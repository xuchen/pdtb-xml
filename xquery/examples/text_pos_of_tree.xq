(:~
:
: This main module shows how to use the pdtb:text_pos_of_tree() function. 
: You should have your own test.xml file on disk.
:
: @author Xuchen Yao
: @version 2.2.0
: @since 14 October 2009  
:)

import module namespace pdtb = "http://code.google.com/p/pdtb-xml/pdtb.xq" at "../pdtb.xq" ;

for $t in doc("../../../test.xml")/corpus/body/s/tree
    let $text := pdtb:text_of_tree($t)
    let $pos := pdtb:pos_of_tree($t)
    let $text_pos := pdtb:text_pos_of_tree($t)
    return
        <sp>
        <s>{$text}</s>
        <p>{$pos}</p>
        <q>{$text_pos}</q>
        </sp>
