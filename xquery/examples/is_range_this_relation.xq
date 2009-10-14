(:~
:
: This main module shows how to use the pdtb:is_range_this_relation() function. 
: It checks whether the arguments of two relations have a "range-contains" relation.
: You should have your own test.xml file on disk.
:
: @author Xuchen Yao
: @version 2.2.0
: @since 14 October 2009  
:)

import module namespace pdtb = "http://code.google.com/p/pdtb-xml/pdtb.xq" at "../pdtb.xq" ;

for $c in doc("../../../test.xml")
    let $i := $c/corpus/@id
    let $count := count($c/corpus/Relations/*/Relation)
    for $r1 at $counter in $c/corpus/Relations/*/Relation
        (: Modify to Sup1 or Sup2 to judge the relations between supplements :)
        let $arg1_1 := $r1/Arg1
        let $arg1_2:= $r1/Arg2
        let $id1 := $r1/@id
            (: Check at most 2 relations further away. 
             : This would make the program much more efficient. 
             :)
            for $r2 in $c/corpus/Relations/*[position() > $counter and position() < $counter+3]/Relation
                let $arg2_1 := $r2/Arg1
                let $arg2_2 := $r2/Arg2
                let $id2 := $r2/@id
                let $b1 := pdtb:is_range_this_relation("range-contains", $arg1_1, $arg2_1)
                let $b2 := pdtb:is_range_this_relation("range-contains", $arg1_1, $arg2_2)
                let $b3 := pdtb:is_range_this_relation("range-contains", $arg1_2, $arg2_1)
                let $b4 := pdtb:is_range_this_relation("range-contains", $arg1_2, $arg2_2)
                return
                    if ($b1=true())
                    then
                        (
                        <contains file="{$i}" r1="{$id1}_Arg1" r2="{$id2}_Arg1" />
                        )
                    else
                        (
                            if ($b2=true())
                            then
                                (
                                <contains file="{$i}" r1="{$id1}_Arg1" r2="{$id2}_Arg2" />
                                )
                            else
                                (
                                if ($b3=true())
                                then
                                    (
                                        <contains file="{$i}" r1="{$id1}_Arg2" r2="{$id2}_Arg1" />
                                    )
                                else
                                    (
                                    if ($b4=true())
                                    then
                                        (
                                            <contains file="{$i}" r1="{$id1}_Arg2" r2="{$id2}_Arg2" />
                                        )
                                    else ( )
                                    )
                                )
                        )
                            