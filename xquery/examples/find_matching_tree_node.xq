(:~
:
: This main module shows how to use the pdtb:find_matching_tree_node() function. 
: You should have your own test.xml file on disk.
:
: @author Xuchen Yao
: @version 2.2.0
: @since 14 October 2009  
:)

import module namespace pdtb = "http://code.google.com/p/pdtb-xml/pdtb.xq" at "../pdtb.xq" ;

for $a in doc("../../../test.xml")/corpus/body/s/tree//b[@id="t2_1_2"]
    return pdtb:find_matching_tree_node($a, "A immediately follows B")