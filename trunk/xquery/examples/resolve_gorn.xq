(:~
:
: This main module shows how to use the pdtb:resolve_gorn() function. 
: You should have your own test.xml file on disk.
:
: @author Xuchen Yao
: @version 2.2.0
: @since 13 October 2009  
:)

import module namespace pdtb = "http://code.google.com/p/pdtb-xml/pdtb.xq" at "../pdtb.xq" ;

(: find  explicit relations :)
(: and their POS :)

for $rel in doc("../../../test.xml")/corpus/Relations/*/Relation[@Class="Explicit"]

    let $connective := normalize-space(string($rel/ConnHead/RawText))
    let $gorn :=  $rel/ConnHead/TreeRef/tr
    let $resolved := pdtb:resolve_gorn($gorn)
    let $pos := $resolved/@pos
    
    return
        <rel uri="{base-uri($rel)}" connective="{$connective}" pos="{$pos}">
            {$gorn}
            {$resolved}
        </rel>
