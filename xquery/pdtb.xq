(:~
: This module provides basic APIs to access the pdtb-xml files.
:
: @author Xuchen Yao, Gosse Bouma
: @version 2.2.0
: @since 12 October 2009
:)

module namespace pdtb = 'http://code.google.com/p/pdtb-xml/pdtb.xq';


(: find yield of a pdtb tree :)

declare function pdtb:yield($node as element(*)) as xs:string*
  { if ( $node/@word )
    then string($node/@word)
    else pdtb:yield_nt($node)
  } ;

declare function pdtb:yield_nt($nt as element(nt)) as xs:string*
  { for $edge in $nt/edge 
    let $edge_nt := $edge/ancestor::graph/descendant::*[@id=$edge/@idref]
    return pdtb:yield($edge_nt)
  } ;

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
