(:~
:
: This main module shows how to use the pdtb:find_ref_relation() function. 
: You should have your own test.xml file on disk.
:
: @author Xuchen Yao
: @version 2.2.0
: @since 13 October 2009  
:)

import module namespace pdtb = "http://code.google.com/p/pdtb-xml/pdtb.xq" at "../pdtb.xq" ;

for $t in doc("../../../test.xml")/corpus/body/s/tree
        let $text := pdtb:text_of_tree($t)
        let $pos := pdtb:pos_of_tree($t)
        let $b := $t//b[lower-case(@word)="according"]
        let $b_id := $b/@id
        return
            (: "i" for ignoring case :)
            if (matches($text, "according to", "i"))
            then (<found>{$text}</found>,
                <branch>{$b}</branch>,
                <relation>{pdtb:find_tr_of_ref_relation($b)}</relation>)
            else ""
