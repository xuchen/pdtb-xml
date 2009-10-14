(:~
:
: This main module shows how to use the pdtb:range_relation() function. 
: It shows the relations between the arguments of two adjacent relations.
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
        let $arg1_1 := $r1/Arg1
        let $arg1_2:= $r1/Arg2
        let $id1 := $r1/@id
            for $r2 in $c/corpus/Relations/*[position() > $counter and position() < $counter+2]/Relation
                let $arg2_1 := $r2/Arg1
                let $arg2_2 := $r2/Arg2
                let $id2 := $r2/@id
                return
                    if (boolean($arg1_1) or boolean($arg1_2) or boolean($arg2_1) or boolean($arg2_2))
                    then
                        (
                        <rel r1="{$id1}_Arg1" r2="{$id2}_Arg1">{pdtb:range_relation($arg1_1, $arg2_1)}</rel>,
                        <rel r1="{$id1}_Arg1" r2="{$id2}_Arg2">{pdtb:range_relation($arg1_1, $arg2_2)}</rel>,
                        <rel r1="{$id1}_Arg2" r2="{$id2}_Arg1">{pdtb:range_relation($arg1_2, $arg2_1)}</rel>,
                        <rel r1="{$id1}_Arg2" r2="{$id2}_Arg2">{pdtb:range_relation($arg1_2, $arg2_2)}</rel>
                        )
                    else
                        (
                        <notfound/>
                        )
