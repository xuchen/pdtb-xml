(:~
:
: This main module shows how to use the pdtb:yield() function. 
: You should have your own test.xml file on disk.
:
: @author Xuchen Yao
: @version 2.2.0
: @since 13 October 2009  
:)

import module namespace pdtb = "http://code.google.com/p/pdtb-xml/pdtb.xq" at "../pdtb.xq" ;

for $nt in doc("../../../test.xml")//graph[@root="s1_500"]//nt
    return
        <yield id="{$nt/@id}" cat="{$nt/@cat}">
            {pdtb:yield($nt)}
        </yield>
