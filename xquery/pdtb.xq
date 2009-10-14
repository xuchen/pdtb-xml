(:~
: This module provides basic APIs to access the pdtb-xml files.
:
: @author Xuchen Yao, Gosse Bouma
: @version 2.2.0
: @since 12 October 2009
:)

module namespace pdtb = 'http://code.google.com/p/pdtb-xml/pdtb.xq';


(:~
: find all words under a <t> or <nt> node
:
: @param $node a <t> or <nt> node
: @return all words under $node, delimitated by spaces
:)

declare function pdtb:yield($node as element(*)) as xs:string*
  { if ( $node/@word )
    then string($node/@word)
    else pdtb:yield_nt($node)
  } ;

(:~
: find all words under a <t> node
:
: @param $node a <nt> node
: @return all words under $node, delimitated by spaces
:)
declare function pdtb:yield_nt($nt as element(nt)) as xs:string*
  { for $edge in $nt/edge 
    let $edge_nt := $edge/ancestor::graph/descendant::*[@id=$edge/@idref]
    return pdtb:yield($edge_nt)
  } ;

(:~
: Resolve a Gorn address given by a <tr> element.
: 
: @param $gorn a <tr> element which refers to a certain node in a tree
: @return a <t> or <nt> element referred by $gorn, or a <no-node-found> element
:)
declare function pdtb:resolve_gorn($gorn as element(tr)) as element()
 { 
   let $sid := $gorn/ancestor::corpus/body/s/tree//b[@id=$gorn/@idref]/@idref
   (:let $sid := $gorn/ancestor::*//id($gorn/@idref)/@idref:)
   return 
    if ($sid) 
    then $gorn/ancestor::corpus/body/s/graph//*[@id=$sid]
    (:then $gorn/ancestor::*//id($sid):)
    else <no-node-found>{string($gorn/@idref)}</no-node-found>
 } ;

(:~
: output all the words in a <s> element, delimited with spaces
:
: @param $s a <s> element
: @return a string containing all the words in $s, delimited with spaces
:)
declare function pdtb:text_of_s($s as element(s)) as xs:string*
{
    string-join((for $t in $s/graph/terminals/t return $t/@word), " ")
};

(:~
: output all the words in a <tree> element, delimited with spaces
:
: @param $t a <tree> element
: @return a string containing all the words in $t, delimited with spaces
:)
declare function pdtb:text_of_tree($t as element(tree)) as xs:string*
{
    string-join((for $b in $t//b[@word] return $b/@word), " ")
};

(:~
: returns all the terminal IDs a <b> or <tree> element refers to.
: For example, a tree "t2" refers to all sentences in s2, 
: then the function returns s2_1, s2_2, ... till the last one.
:
: @param $b a <b> or <tree> element
: @return a string containing all the terminal IDs, delimited with spaces.
:)
declare function pdtb:text_id_of_b($b as element()*) as xs:string*
{
    (: a <b> with @word attribute refers to a terminal <t>:)
    string-join((for $s in $b/descendant-or-self::*[@word] return $s/@idref), " ")
};

(:~
:
: Idem, but returns an "arrary", not a concatenated string.
:)
declare function pdtb:array_text_id_of_b($b as element()*) as xs:string*
{
    for $s in $b/descendant-or-self::*[@word] return $s/@idref
};

(:~
: output the POS tags of each word in a sentence
:
: @param $s a <s> element
: @return a string containing all the POS tags, delimited with spaces
:)
declare function pdtb:pos_of_s($s as element(s)*) as xs:string*
{
    string-join((for $t in $s/graph/terminals/t return $t/@pos), " ")
};

(:~
: output the POS tags of each word in a tree
:
: @param $s a <tree> element
: @return a string containing all the POS tags, delimited with spaces
:)
declare function pdtb:pos_of_tree($t as element(tree)*) as xs:string*
{
    string-join((for $b in $t//b[@pos] return $b/@pos), " ")
};

(:~
: output words and their POS tags in a manner of word(POS) in a sentence
:
: @param $s a <s> element
: @return a string containing all word(POS) sequences, delimited with spaces
:)
declare function pdtb:text_pos_of_s($s as element(s)*) as xs:string*
{
    string-join((for $t in $s/graph/terminals/t return concat($t/@word, '(', $t/@pos, ')')), " ")
};

(:~
: output words and their POS tags in a manner of word(POS) in a tree
:
: @param $s a <tree> element
: @return a string containing all word(POS) sequences, delimited with spaces
:)
declare function pdtb:text_pos_of_tree($t as element(tree)) as xs:string*
{
    string-join((for $b in $t//b[@pos] return concat($b/@word, '(', $b/@pos, ')')), " ")
};


(:~
: Find out an id of a tree element belongs to which relation.
: For example, id "t20" is refered in a <tr> element in relation r12, 
: then the function uses idref() to find out the id of that relation (r12).
: For example, if an id is "t20_1_2", but the <tr> element refers to only "t20", 
: then the function recursively calls itself by delecting 
: the last _2, then _1, then gets t20, and thus traces to r12.
: bug1: what if the function can't find one?
:
: @param $id the ID a <tr> element refers to
: @param $R the <Relations> element in current document
: @return an ID string of the relation that refers to $id  
:)
declare function pdtb:find_ref_relation($id as xs:string, $R as element(Relations)) as xs:string*
{
    let $relation_id := $R//idref($id)
    return
        if ($relation_id)
        then $relation_id/ancestor::Relation/@id
        else pdtb:find_ref_relation(replace($id, "_\d+", ""), $R)
};

(:~
: 
: This function gives the relations of the ranges of 2 nodes.
: The nodes could be any of the <Arg1> <Arg2> <Sup1> or <Sup2> elements.
: 
: @param $arg1 a <Arg1> <Arg2> <Sup1> or <Sup2> element
: @param $arg2 a <Arg1> <Arg2> <Sup1> or <Sup2> element
: @return a string indicating the range relations of $arg1 and $arg2
:
: Algorithm:
: For example, <Arg2> has <TreeRef> with a range from s2_1 to s2_10, 
: <Sup1> has <TreeRef> with a range from s2_9 to s3_5,
: then the function first convert the four strings s2_1, s2_10, s2_9, s3_5 to numbers, 
: such as 2001, 2010, 2009, 3005,
: at last compare them using the following relations (in the above case, it's 1 overlaps 2):
: 

see PDTBUser/htdocs/xpathextension.html:

1 range-identical 2:
--------
--------
1 is range-before 2:
--------
            -------
2 is range-before 1:
            -------
--------
1 range-contains 2:
--------
---
2 range-contains 1:
---
--------
<range-crosses is more strict than range-overlaps>
1 range-crosses 2:
 -------
----
or:
 -------
      ----
1 range-overlaps 2:
-----
 ------
or:
-----
 ---
or:
  ---
------
or:
  ---
----
:)
(:
declare function pdtb:range_relation($range1first as xs:string?, $range1last as xs:string?, $range2first as xs:string?, $range2last as xs:string?) as xs:string
{
    let $range1first := pdtb:id_to_num($range1first)
    let $range1last := pdtb:id_to_num($range1last)
    let $range2first := pdtb:id_to_num($range2first)
    let $range2last := pdtb:id_to_num($range2last)

    return
    if ($range1first = 0 or  $range2first = 0 or  $range1last = 0 or  $range2last = 0)
    then "can't compare"
    else if ($range1first = $range2first and $range1last = $range2last)
        then "1 is range-identical 2"
        else if ($range1last < $range2first)
            then "1 is range-before 2"
            else if ($range1first > $range2last)
                then "2 is range-before 1"
                else if ($range1first <= $range2first and $range1last >= $range2last)
                    then "1 range-contains 2"
                    else if ($range1first >= $range2first and $range1last <= $range2last)
                        then "2 range-contains 1"
                            else if ($range1first < $range2first and $range2first < $range1last and $range2last > $range1last or
                                     $range2first < $range1first and $range1first < $range2last and $range1last > $range2last)
                                then "1 range-crosses and range-overlaps 2"
                                else "1 range-overlaps 2"
};
:)
declare function pdtb:range_relation($arg1 as element(), $arg2 as element() ) as xs:string
{
    let $c := root($arg1)/corpus/body/s/graph
    let $t_id_arg1 := pdtb:array_text_id_of_b(for $b in $arg1/TreeRef/tr/@idref return $c//id($b))
    let $t_id_arg2 := pdtb:array_text_id_of_b(for $b in $arg2/TreeRef/tr/@idref return $c//id($b))
    let $t_id_arg1_first := $t_id_arg1[1]
    let $t_id_arg1_last := $t_id_arg1[last()]
    let $t_id_arg2_first := $t_id_arg2[1]
    let $t_id_arg2_last := $t_id_arg2[last()]

    let $range1first := pdtb:id_to_num($t_id_arg1_first)
    let $range1last := pdtb:id_to_num($t_id_arg1_last)
    let $range2first := pdtb:id_to_num($t_id_arg2_first)
    let $range2last := pdtb:id_to_num($t_id_arg2_last)

    return
    if ($range1first = 0 or  $range2first = 0 or  $range1last = 0 or  $range2last = 0)
    then <range>{$range1first, $range1last, $range2first, $range2last}</range>
    else if ($range1first = $range2first and $range1last = $range2last)
        then "1 is range-identical 2"
        else if ($range1last < $range2first)
            then "1 is range-before 2"
            else if ($range1first > $range2last)
                then "2 is range-before 1"
                else if ($range1first <= $range2first and $range1last >= $range2last)
                    then "1 range-contains 2"
                    else if ($range1first >= $range2first and $range1last <= $range2last)
                        then "2 range-contains 1"
                            else if ($range1first < $range2first and $range2first < $range1last and $range2last > $range1last or
                                     $range2first < $range1first and $range1first < $range2last and $range1last > $range2last)
                                then "1 range-crosses and range-overlaps 2"
                                else "1 range-overlaps 2"
};

(:
declare function pdtb:is_range_identical($arg1 as element(), $arg2 as element() ) as xs:boolean
{
    let $c := root($arg1)/corpus/body/s/graph
    let $t_id_arg1 := pdtb:array_text_id_of_b(for $b in $arg1/TreeRef/tr/@idref return $c//id($b))
    let $t_id_arg2 := pdtb:array_text_id_of_b(for $b in $arg2/TreeRef/tr/@idref return $c//id($b))
    let $t_id_arg1_first := $t_id_arg1[1]
    let $t_id_arg1_last := $t_id_arg1[last()]
    let $t_id_arg2_first := $t_id_arg2[1]
    let $t_id_arg2_last := $t_id_arg2[last()]

    let $range1first := pdtb:id_to_num($t_id_arg1_first)
    let $range1last := pdtb:id_to_num($t_id_arg1_last)
    let $range2first := pdtb:id_to_num($t_id_arg2_first)
    let $range2last := pdtb:id_to_num($t_id_arg2_last)

    return
    if ($range1first = 0 or  $range2first = 0 or  $range1last = 0 or  $range2last = 0)
    then false()
    else if ($range1first = $range2first and $range1last = $range2last)
        then true()
        else false()
};
:)

(:~
:
: Judge whether two elements have a certain range relation
:
: Warning: "range-identical", "range-crosses" and "range-overlaps" are symmetric, but
: "range-before" and "range-contains" are not. 
: So if $arg1 is "range-before" $arg2 then $arg2 is NOT "range-before" $arg1 
:
: @param $str range relation, must be exactly "range-identical", "range-before", 
:                           "range-contains", "range-crosses", "range-overlaps".
: @param $arg1 a <Arg1> <Arg2> <Sup1> or <Sup2> element
: @param $arg2 a <Arg1> <Arg2> <Sup1> or <Sup2> element
: @return a boolean value indicating whether $arg1 and $arg2 have the range relation of $str
:
: @see pdtb:range_relation()
:)
declare function pdtb:is_range_this_relation($str as xs:string, $arg1 as element(), $arg2 as element() ) as xs:boolean
{
    let $c := root($arg1)/corpus/body/s/graph
    let $t_id_arg1 := pdtb:array_text_id_of_b(for $b in $arg1/TreeRef/tr/@idref return $c//id($b))
    let $t_id_arg2 := pdtb:array_text_id_of_b(for $b in $arg2/TreeRef/tr/@idref return $c//id($b))
    let $t_id_arg1_first := $t_id_arg1[1]
    let $t_id_arg1_last := $t_id_arg1[last()]
    let $t_id_arg2_first := $t_id_arg2[1]
    let $t_id_arg2_last := $t_id_arg2[last()]

    let $range1first := pdtb:id_to_num($t_id_arg1_first)
    let $range1last := pdtb:id_to_num($t_id_arg1_last)
    let $range2first := pdtb:id_to_num($t_id_arg2_first)
    let $range2last := pdtb:id_to_num($t_id_arg2_last)

    return
    if ($range1first = 0 or  $range2first = 0 or  $range1last = 0 or  $range2last = 0)
    then false()
    else if ($str eq "range-identical" and $range1first = $range2first and $range1last = $range2last)
        then true()
        else if ($str eq "range-before" and $range1last < $range2first)
            then true()
            else if ($str eq "range-contains" and  $range1first <= $range2first and $range1last >= $range2last)
                then true()
                else if ($str eq "range-crosses" and ($range1first < $range2first and $range2first < $range1last and $range2last > $range1last or
                                     $range2first < $range1first and $range1first < $range2last and $range1last > $range2last))
                    then true()
                    else if ($str eq "range-overlaps" and ($range1first <= $range2first and $range2first < $range1last or
                                     $range2first <= $range1first and $range1first < $range2last))
                        then true()
                        else false()
};


(:~
: 
: Convert an ID sA_B to a number A*1000+B, such as s1_2 -> 1002.
: This function is called by pdtb:range_relation() and pdtb:is_range_this_relation().
:
: Warning: if a sentence contains more than 1000 words, then the function will fail.
:)
declare function pdtb:id_to_num($s as xs:string?) as xs:double
{
    let $s := replace($s, "s", "")
    let $ss := tokenize($s, "_")
    let $n := number($ss[1])*1000+number($ss[2])
    return
        if (xs:string($n) = "NaN")
        then 0
        else $n
};