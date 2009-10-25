(:~
: This module provides basic APIs to access the pdtb-xml files.
:
: @author Xuchen Yao, Gosse Bouma
: @version 2.2.0
: @since 12 October 2009
:)

module namespace pdtb = 'http://code.google.com/p/pdtb-xml/pdtb.xq';

(:~
: find all <b> elements that match pattern with $a.
: The patterns match the Stanford Tregex pattern
: Specifically, when knowing
: an A and a pattern, this function returns the B that follows any of the following realtions:
:
: A << B    
:   A dominates B  
: A >> B 
:   A is dominated by B  
: A < B 
:   A immediately dominates B  
: A .. B 
:   A precedes B 
: A . B 
:   A immediately precedes B 
: A ,, B 
:   A follows B 
: A , B 
:   A immediately follows B 
: A <<, B 
:   B is a leftmost descendant of A 
: A <<- B 
:   B is a rightmost descendant of A 
: A >>, B 
:   A is a leftmost descendant of B 
: A >>- B 
:   A is a rightmost descendant of B 
: A <, B 
:   B is the first child of A 
: A >, B 
:   A is the first child of B 
: A <- B 
:   B is the last child of A
: A >- B 
:   A is the last child of B 
: A <: B 
:   B is the only child of A
: A >: B 
:   A is the only child of B 
: A <<: B 
:   A dominates B via an unbroken chain (length > 0) of unary local trees. 
: A >>: B 
:   A is dominated by B via an unbroken chain (length > 0) of unary local trees. 
: A $.. B 
:   A is a sister of B and precedes B 
: A $,, B 
:   A is a sister of B and follows B 
: A $. B 
:   A is a sister of B and immediately precedes B 
: A $, B 
:   A is a sister of B and immediately follows B 
:
:
: The following pattern is not supported by this function for some explicit or implicit reasons:
A <i B 
   B is the ith child of A (i > 0) 
A >i B 
   A is the ith child of B (i > 0) 
A <-i B 
   B is the ith-to-last child of A (i > 0) 
A >-i B 
   A is the ith-to-last child of B (i > 0) 
A $++ B 
   A is a left sister of B (same as $.. for context-free trees) 
A $-- B 
   A is a right sister of B (same as $,, for context-free trees) 
A $+ B 
   A is the immediate left sister of B (same as $. for context-free trees) 
A $- B 
   A is the immediate right sister of B (same as $, for context-free trees) 
A <+(C) B 
   A dominates B via an unbroken chain of (zero or more) nodes matching description C 
A >+(C) B 
   A is dominated by B via an unbroken chain of (zero or more) nodes matching description C 
A .+(C) B 
   A precedes B via an unbroken chain of (zero or more) nodes matching description C 
A ,+(C) B 
   A follows B via an unbroken chain of (zero or more) nodes matching description C 
A <<# B 
   B is a head of phrase A 
A >># B 
   A is a head of phrase B 
A <# B 
   B is the immediate head of phrase A 
A ># B 
   A is the immediate head of phrase B 
A == B 
   A and B are the same node 
A : B
   [this is a pattern-segmenting operator that places no constraints on the relationship between A and B] 
:
:
: @param $a a <b> element
: @param $pattern a string representing a pattern, could be "&lt;&lt;" or "A dominates B", etc.
: @return a <b> element matching $pattern with $a
:
: @see the file README-tregex.txt in http://nlp.stanford.edu/software/tregex.shtml
: @see or the Tgrep2 manual at http://tedlab.mit.edu/~dr/TGrep2/tgrep2.pdf
:)

declare function pdtb:find_matching_tree_node($a as element(b)*, $pattern as xs:string) as element(b)*
{
(:
# &amp; refers to an ampersand (&) 
# &lt; refers to a less-than symbol (<) 
# &gt; refers to a greater-than symbol (>) 
# &quot; refers to a double-quote mark (") 
# &apos; refers to an apostrophe (')
:)
    let $id_a := $a/@id
    let $tree := tokenize($id_a, "_")[1]
    return 
    if (not($a))
    then ()
    else if ($pattern eq "&lt;&lt;" or $pattern eq "A dominates B")
    then $a/descendant::b
    
    else if ($pattern eq "&gt;&gt;" or $pattern eq "A is dominated by B")
    (: note, this doesn't return the top <tree> element :)
    then $a/ancestor::b
    
    else if($pattern eq "&lt;" or $pattern eq "A immediately dominates B")
    then $a/child::b
    
    else if($pattern eq "&gt;" or $pattern eq "A is immediately dominated by B")
    then $a/parent::b
    
    else if($pattern eq "$" or $pattern eq "A is a sister of B")
    then $a/(following-sibling::b | preceding-sibling::b)
    
    else if($pattern eq ".." or $pattern eq "A precedes B")
    then $a/following::b[matches(@id, $tree)]
    
    else if($pattern eq "." or $pattern eq "A immediately precedes B")
    then $a/following::b[matches(@id, $tree)][1]
    
    else if($pattern eq ",," or $pattern eq "A follows B")
    then $a/preceding::b[matches(@id, $tree)]
    
    else if($pattern eq "," or $pattern eq "A immediately follows B")
    then $a/preceding::b[matches(@id, $tree)][last()]
    
    else if($pattern eq "&lt;&lt;," or $pattern eq "B is a leftmost descendant of A")
    (: the leftmost descendant must be a terminal, which has a @pos attribute
     : also, it must always be the first in "the first child of the first child of ... $a"
     : for instance, $a/@id is $1_2_3, then the id of its leftmost descendant must be
     : something like: $1_2_3_1_1_1_1...
     :)
    then $a/descendant::b[@pos and matches(replace(@id, $id_a, ""), "^(_1)+$")]
    
    else if($pattern eq "&lt;&lt;-" or $pattern eq "B is a rightmost descendant of A")
    (: the rightmost descendant must be the LAST terminal, which has a @pos attribute :)
    then $a/descendant::b[@pos][last()]
    
    else if( ($pattern eq "&gt;&gt;," or $pattern eq "A is a leftmost descendant of B")
     and number(tokenize($id_a, "_")[last()]) = 1)
    (: since A is the leftmost descendant, it must ends with a "_1"
     : also, it must always be the first in "the first child of the first child of ... $b"
     : for instance, $b/@id is $1_2_3, then the id of its leftmost descendant ($a) must be
     : something like: $1_2_3_1_1_1_1...
     : note A could be the leftmost descendant of multiple B's
     :)
    then $a/ancestor::b[matches(replace($id_a, @id, ""), "^(_1)+$")]
    
    else if(($pattern eq "&gt;&gt;-" or $pattern eq "A is a rightmost descendant of B")
        and $a[@pos] and not($a/following-sibling::b) and number(tokenize($id_a, "_")[last()]) != 1)
    (: the rightmost descendant $a must be a termninal, the last one of its siblings and not the only child of its parent :)   
    (: $b must be $a's ancestor :)
    then $a/ancestor::b[descendant::b[@pos][last()]/@id eq $id_a]
    
    else if($pattern eq "&lt;," or $pattern eq "B is the first child of A")
    then $a/child::b[1]
    
    else if(($pattern eq "&gt;," or $pattern eq "A is the first child of B")
        and not($a/preceding-sibling::b))
    then $a/parent::*
    
    else if($pattern eq "&lt;-" or $pattern eq "B is the last child of A")
    then $a/child::b[last()]
    
    else if(($pattern eq "&gt;-" or $pattern eq "A is the last child of B")
        and not($a/following-sibling::b))
    then $a/parent::*
    
    else if($pattern eq "&lt;:" or $pattern eq "B is the only child of A")
    then $a/child::b[last()=1]
    
    else if(($pattern eq "&gt;:" or $pattern eq "A is the only child of B") 
        and not($a/following-sibling::b) and not($a/preceding-sibling::b))
    then $a/parent::*
    
    else if($pattern eq "&lt;&lt;:" or $pattern eq "A dominates B via an unbroken chain of unary local trees")
    then ($a/child::b[last()=1], pdtb:find_matching_tree_node($a/child::b[last()=1], "&lt;&lt;:"), $a/child::b[last()=1]/child::b[last()>1])
    
    else if(($pattern eq "&gt;&gt;:" or $pattern eq "A is dominated by B via an unbroken chain of unary local trees")
        and not($a/following-sibling::b) and not($a/preceding-sibling::b))
    then ($a/parent::b, pdtb:find_matching_tree_node($a/parent::b, "&gt;&gt;:"))
    
    else if($pattern eq "$.." or $pattern eq "A is a sister of B and precedes B")
    then $a/following-sibling::b
    
    else if($pattern eq "$,," or $pattern eq "A is a sister of B and follows B")
    then $a/preceding-sibling::b
    
    else if($pattern eq "$." or $pattern eq "A is a sister of B and immediately precedes B")
    then $a/following-sibling::b[number(tokenize($id_a, "_")[last()]) - number(tokenize(@id, "_")[last()]) = -1]
    
    else if($pattern eq "$," or $pattern eq "A is a sister of B and immediately follows B")
    then $a/preceding-sibling::b[number(tokenize($id_a, "_")[last()]) - number(tokenize(@id, "_")[last()]) = 1]
    
    else ()
};

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