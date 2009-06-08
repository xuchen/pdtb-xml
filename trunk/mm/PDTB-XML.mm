<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node COLOR="#000000" CREATED="1240948988928" ID="ID_1691040155" MODIFIED="1243501799781" TEXT="corpus">
<font NAME="SansSerif" SIZE="20"/>
<hook NAME="accessories/plugins/AutomaticLayout.properties"/>
<node COLOR="#0033ff" CREATED="1243494807516" ID="ID_1087505912" MODIFIED="1243501764518" POSITION="right" TEXT="head">
<edge STYLE="sharp_bezier" WIDTH="8"/>
<font NAME="SansSerif" SIZE="18"/>
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="78"/>
</node>
<node COLOR="#0033ff" CREATED="1243495199060" ID="ID_1533094647" MODIFIED="1243501798527" POSITION="right" TEXT="body">
<edge STYLE="sharp_bezier" WIDTH="8"/>
<font NAME="SansSerif" SIZE="18"/>
<node COLOR="#00b439" CREATED="1243495216691" ID="ID_511029063" MODIFIED="1243496214930" TEXT="s">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="16"/>
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="40"/>
<attribute NAME="id" VALUE="e.g. s1"/>
<node COLOR="#990000" CREATED="1243495259361" ID="ID_546188263" MODIFIED="1243496269195" TEXT="graph">
<font NAME="SansSerif" SIZE="14"/>
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="67"/>
<attribute NAME="root" VALUE="e.g. s1_500"/>
<node COLOR="#111111" CREATED="1243495384217" ID="ID_1674065861" MODIFIED="1243495393343" TEXT="terminals">
<node COLOR="#111111" CREATED="1243495403822" ID="ID_1492645406" MODIFIED="1243496301388" TEXT="t">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="53"/>
<attribute NAME="id" VALUE="e.g. s1_2"/>
<attribute NAME="word" VALUE=""/>
<attribute NAME="pos" VALUE=""/>
</node>
</node>
<node COLOR="#111111" CREATED="1243495477803" ID="ID_631752965" MODIFIED="1243495543718" TEXT="nonterminals">
<node COLOR="#111111" CREATED="1243495493448" ID="ID_1321556098" MODIFIED="1243496303292" TEXT="nt">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="67"/>
<attribute NAME="id" VALUE="e.g. s1_500"/>
<attribute NAME="cat" VALUE=""/>
<node COLOR="#111111" CREATED="1243495577390" ID="ID_124992431" MODIFIED="1243496304781" TEXT="edge">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="53"/>
<attribute NAME="idref" VALUE="e.g. s1_2"/>
<attribute NAME="label" VALUE=""/>
</node>
</node>
</node>
</node>
<node COLOR="#990000" CREATED="1243495271562" ID="ID_660948800" MODIFIED="1243495905844" TEXT="tree">
<font NAME="SansSerif" SIZE="14"/>
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="67"/>
<attribute NAME="id" VALUE="e.g. t1"/>
<attribute NAME="idref" VALUE="e.g. s1_500"/>
<attribute NAME="cat" VALUE=""/>
<node COLOR="#111111" CREATED="1243495914647" ID="ID_291674939" MODIFIED="1243496313645" TEXT="b (branch linked to &lt;nt&gt;)">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="67"/>
<attribute NAME="id" VALUE="e.g. t1_2_3"/>
<attribute NAME="idref" VALUE="e.g. s1_501"/>
<attribute NAME="cat" VALUE=""/>
</node>
<node COLOR="#111111" CREATED="1243495914647" ID="ID_192409301" MODIFIED="1243496315452" TEXT="b (branch linked to &lt;t&gt;)">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="id" VALUE="e.g. t1_2_3"/>
<attribute NAME="idref" VALUE="e.g. s1_2"/>
<attribute NAME="word" VALUE=""/>
<attribute NAME="pos" VALUE=""/>
</node>
</node>
</node>
</node>
<node COLOR="#0033ff" CREATED="1243494978985" ID="ID_663702072" MODIFIED="1243501123990" POSITION="right" TEXT="Relations">
<edge STYLE="sharp_bezier" WIDTH="8"/>
<font NAME="SansSerif" SIZE="18"/>
<node COLOR="#00b439" CREATED="1242080930177" ID="ID_1924976491" MODIFIED="1244421366716" TEXT="NoRel">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="16"/>
<node COLOR="#990000" CREATED="1240949223114" ID="ID_1931240260" MODIFIED="1243496679368" TEXT="Relation">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="14"/>
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="38"/>
<attribute NAME="id" VALUE="e.g. r1"/>
<attribute NAME="Class" VALUE="NoRel"/>
<node COLOR="#111111" CREATED="1240949549688" ID="ID_822363318" MODIFIED="1243495015535" TEXT="Arg1">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1240952694114" ID="ID_463061855" MODIFIED="1242081001293" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_1234793776" MODIFIED="1242081001294" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_1007738308" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1240949552681" ID="ID_981866143" MODIFIED="1243495015536" TEXT="Arg2">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1240952694114" ID="ID_330125208" MODIFIED="1242081001296" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_1013990985" MODIFIED="1242081001296" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_660190058" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#00b439" CREATED="1242080944944" ID="ID_1555490736" MODIFIED="1244421368037" TEXT="EntRel">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="16"/>
<node COLOR="#990000" CREATED="1240949223114" ID="ID_690215485" MODIFIED="1243496681633" TEXT="Relation">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="14"/>
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="38"/>
<attribute NAME="id" VALUE="e.g. r1"/>
<attribute NAME="Class" VALUE="EntRel"/>
<node COLOR="#111111" CREATED="1240949549688" ID="ID_1086816906" MODIFIED="1243495013342" TEXT="Arg1">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1240952694114" ID="ID_1661098713" MODIFIED="1242081004232" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_99523518" MODIFIED="1242081004232" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_1608432569" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1240949552681" ID="ID_860146253" MODIFIED="1243495013343" TEXT="Arg2">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1240952694114" ID="ID_1224880284" MODIFIED="1242081004232" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_1923465226" MODIFIED="1242081004232" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_909319190" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#00b439" CREATED="1242080914734" ID="ID_267870248" MODIFIED="1244421370051" TEXT="Explicit">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="16"/>
<node COLOR="#990000" CREATED="1240949601834" ID="ID_1733702342" MODIFIED="1243496687274" TEXT="Relation">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="14"/>
<attribute_layout NAME_WIDTH="67" VALUE_WIDTH="76"/>
<attribute NAME="id" VALUE="e.g. r1"/>
<attribute NAME="Class" VALUE="Explicit"/>
<attribute NAME="Source" VALUE="Tab29-31Col1"/>
<attribute NAME="Type" VALUE="Tab29-31Col1"/>
<attribute NAME="Polarity" VALUE="Tab29-31Col1"/>
<attribute NAME="Determinacy" VALUE="Tab29-31Col1"/>
<node COLOR="#111111" CREATED="1240949609266" ID="ID_1523983921" MODIFIED="1243495006246" TEXT="ConnHead">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1240949642388" ID="ID_1936035752" MODIFIED="1242080967542" TEXT="Attribution">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1240949726024" ID="ID_525931730" MODIFIED="1241345820553" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_1989525067" MODIFIED="1241345821952" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_1264360702" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1240949633289" ID="ID_139201157" MODIFIED="1242080967543" TEXT="Connective">
<font NAME="SansSerif" SIZE="12"/>
<attribute_layout NAME_WIDTH="86" VALUE_WIDTH="86"/>
<attribute NAME="ConnType" VALUE="Tab2-7Col1"/>
<attribute NAME="SemanticClass1" VALUE="Tab2-7Col2"/>
<attribute NAME="SemanticClass2" VALUE="Optional"/>
</node>
<node COLOR="#111111" CREATED="1240949627965" ID="ID_956967520" MODIFIED="1242080967543" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1241354758634" ID="ID_107471265" MODIFIED="1241354778233" TEXT="* Tab14-17Col2"/>
</node>
<node COLOR="#111111" CREATED="1241337705711" ID="ID_1757448028" MODIFIED="1242080967544" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_1080436655" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1240951186100" ID="ID_998763664" MODIFIED="1243495006249" TEXT="Sup1">
<edge STYLE="bezier" WIDTH="thin"/>
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1240951192881" ID="ID_1279202065" MODIFIED="1242080967545" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_719218116" MODIFIED="1242080967546" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_138895683" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1240949612589" ID="ID_569591958" MODIFIED="1243495006252" TEXT="Arg1">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="12"/>
<attribute_layout NAME_WIDTH="67" VALUE_WIDTH="76"/>
<attribute NAME="Source" VALUE="Tab29-31Col2"/>
<attribute NAME="Type" VALUE="Tab29-31Col2"/>
<attribute NAME="Polarity" VALUE="Tab29-31Col2"/>
<attribute NAME="Determinacy" VALUE="Tab29-31Col2"/>
<node COLOR="#111111" CREATED="1240949657687" ID="ID_52619961" MODIFIED="1242080967547" TEXT="Attribution">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1240949726024" ID="ID_460215693" MODIFIED="1241345827783" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_1089725474" MODIFIED="1241345828773" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_1633411189" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1240949651964" ID="ID_944704419" MODIFIED="1242080967548" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_830737598" MODIFIED="1242080967548" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_908138380" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1240949614609" ID="ID_507509421" MODIFIED="1243495006254" TEXT="Arg2">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="12"/>
<attribute_layout NAME_WIDTH="67" VALUE_WIDTH="76"/>
<attribute NAME="Source" VALUE="Tab29-31Col3"/>
<attribute NAME="Type" VALUE="Tab29-31Col3"/>
<attribute NAME="Polarity" VALUE="Tab29-31Col3"/>
<attribute NAME="Determinacy" VALUE="Tab29-31Col3"/>
<node COLOR="#111111" CREATED="1240949657687" ID="ID_895973193" MODIFIED="1242080967549" TEXT="Attribution">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1240949726024" ID="ID_446189560" MODIFIED="1241345830517" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_1272568718" MODIFIED="1241345831350" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_514274324" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1240949651964" ID="ID_99411969" MODIFIED="1242080967550" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_1079949682" MODIFIED="1242080967550" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_1190884777" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1240951541496" ID="ID_1500097040" MODIFIED="1243495006258" TEXT="Sup2">
<edge STYLE="bezier" WIDTH="thin"/>
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1240951545968" ID="ID_479577741" MODIFIED="1242080967551" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_553926180" MODIFIED="1242080967551" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_1106729031" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#00b439" CREATED="1242080926513" ID="ID_1377943137" MODIFIED="1244421373295" TEXT="AltLex">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="16"/>
<node COLOR="#990000" CREATED="1240949601834" ID="ID_726619808" MODIFIED="1243496693138" TEXT="Relation">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="14"/>
<attribute_layout NAME_WIDTH="67" VALUE_WIDTH="76"/>
<attribute NAME="id" VALUE="e.g. r1"/>
<attribute NAME="Class" VALUE="AltLex"/>
<attribute NAME="Source" VALUE="Tab32-33Col1"/>
<attribute NAME="Type" VALUE="Tab32-33Col1"/>
<attribute NAME="Polarity" VALUE="Tab32-33Col1"/>
<attribute NAME="Determinacy" VALUE="Tab32-33Col1"/>
<node COLOR="#111111" CREATED="1240949609266" ID="ID_128553725" MODIFIED="1243494998119" TEXT="ConnHead">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="12"/>
<attribute_layout NAME_WIDTH="86" VALUE_WIDTH="86"/>
<node COLOR="#111111" CREATED="1240949642388" ID="ID_517693676" MODIFIED="1242080958141" TEXT="Attribution">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1240949726024" ID="ID_1456319848" MODIFIED="1241346032892" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_760373401" MODIFIED="1241346033863" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_1679124419" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1240949633289" ID="ID_376423273" MODIFIED="1242080958142" TEXT="Connective">
<font NAME="SansSerif" SIZE="12"/>
<attribute_layout NAME_WIDTH="86" VALUE_WIDTH="86"/>
<attribute NAME="SemanticClass1" VALUE="Tab28Col1"/>
<attribute NAME="SemanticClass2" VALUE="Optional"/>
</node>
<node COLOR="#111111" CREATED="1240949627965" ID="ID_303150870" MODIFIED="1242080958143" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_1234956980" MODIFIED="1242080958143" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_984987774" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1240951186100" ID="ID_1369846366" MODIFIED="1243494998121" TEXT="Sup1">
<edge STYLE="bezier" WIDTH="thin"/>
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1240951192881" ID="ID_1285475641" MODIFIED="1242080958145" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_270829545" MODIFIED="1242080958145" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_69518371" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1240949612589" ID="ID_226189745" MODIFIED="1243494998122" TEXT="Arg1">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="12"/>
<attribute_layout NAME_WIDTH="67" VALUE_WIDTH="76"/>
<attribute NAME="Source" VALUE="Tab32-33Col2"/>
<attribute NAME="Type" VALUE="Tab32-33Col2"/>
<attribute NAME="Polarity" VALUE="Tab32-33Col2"/>
<attribute NAME="Determinacy" VALUE="Tab32-33Col2"/>
<node COLOR="#111111" CREATED="1240949657687" ID="ID_1698271214" MODIFIED="1242080958146" TEXT="Attribution">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1240949726024" ID="ID_1786380069" MODIFIED="1241346041869" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_1875850103" MODIFIED="1241346043352" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_433911572" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1240949651964" ID="ID_34427249" MODIFIED="1242080958146" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_1116808331" MODIFIED="1242080958147" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_106160803" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1240949614609" ID="ID_1176508382" MODIFIED="1243494998123" TEXT="Arg2">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="12"/>
<attribute_layout NAME_WIDTH="67" VALUE_WIDTH="76"/>
<attribute NAME="Source" VALUE="Tab32-33Col3"/>
<attribute NAME="Type" VALUE="Tab32-33Col3"/>
<attribute NAME="Polarity" VALUE="Tab32-33Col3"/>
<attribute NAME="Determinacy" VALUE="Tab32-33Col3"/>
<node COLOR="#111111" CREATED="1240949657687" ID="ID_800785022" MODIFIED="1242080958148" TEXT="Attribution">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1240949726024" ID="ID_1083566461" MODIFIED="1241346046606" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_230859941" MODIFIED="1241346046916" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_337375261" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1240949651964" ID="ID_144766835" MODIFIED="1242080958149" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_372655143" MODIFIED="1242080958150" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_111302848" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1240951541496" ID="ID_353290761" MODIFIED="1243494998124" TEXT="Sup2">
<edge STYLE="bezier" WIDTH="thin"/>
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1240951545968" ID="ID_1060320212" MODIFIED="1242080958151" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_1691672031" MODIFIED="1242080958152" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_1104951594" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#00b439" CREATED="1242080922608" ID="ID_1816917409" MODIFIED="1244421375291" TEXT="Implicit">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="16"/>
<node COLOR="#990000" CREATED="1240949601834" ID="ID_669153876" MODIFIED="1243496697991" TEXT="Relation">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="14"/>
<attribute_layout NAME_WIDTH="67" VALUE_WIDTH="76"/>
<attribute NAME="id" VALUE="e.g. r1"/>
<attribute NAME="Class" VALUE="Implicit"/>
<attribute NAME="Source" VALUE="Tab32-33Col1"/>
<attribute NAME="Type" VALUE="Tab32-33Col1"/>
<attribute NAME="Polarity" VALUE="Tab32-33Col1"/>
<attribute NAME="Determinacy" VALUE="Tab32-33Col1"/>
<node COLOR="#111111" CREATED="1240949609266" ID="ID_1733624593" MODIFIED="1243494988709" TEXT="ConnHead">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1240949642388" ID="ID_495167868" MODIFIED="1242080984473" TEXT="Attribution">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1240949726024" ID="ID_188105234" MODIFIED="1241345837530" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_69435235" MODIFIED="1241345838327" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_1559451761" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1240949633289" ID="ID_26854859" MODIFIED="1242080984473" TEXT="Conn1">
<font NAME="SansSerif" SIZE="12"/>
<attribute_layout NAME_WIDTH="86" VALUE_WIDTH="86"/>
<attribute NAME="ConnType" VALUE="Tab18-23Col1"/>
<attribute NAME="SemanticClass1" VALUE="Tab18-23Col2"/>
<attribute NAME="SemanticClass2" VALUE="Optional"/>
</node>
<node COLOR="#111111" CREATED="1240949633289" ID="ID_1447676478" MODIFIED="1242080984473" TEXT="Conn2">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<attribute_layout NAME_WIDTH="86" VALUE_WIDTH="86"/>
<attribute NAME="ConnType" VALUE="Tab18-23Col1"/>
<attribute NAME="SemanticClass1" VALUE="Tab18-23Col2"/>
<attribute NAME="SemanticClass2" VALUE="Optional"/>
</node>
</node>
<node COLOR="#111111" CREATED="1240951186100" ID="ID_1348359365" MODIFIED="1243494988711" TEXT="Sup1">
<edge STYLE="bezier" WIDTH="thin"/>
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1240951192881" ID="ID_7360515" MODIFIED="1242080984474" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_1780748218" MODIFIED="1242080984475" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_652766598" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1240949612589" ID="ID_1569541980" MODIFIED="1243494988713" TEXT="Arg1">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="12"/>
<attribute_layout NAME_WIDTH="67" VALUE_WIDTH="76"/>
<attribute NAME="Source" VALUE="Tab32-33Col2"/>
<attribute NAME="Type" VALUE="Tab32-33Col2"/>
<attribute NAME="Polarity" VALUE="Tab32-33Col2"/>
<attribute NAME="Determinacy" VALUE="Tab32-33Col2"/>
<node COLOR="#111111" CREATED="1240949657687" ID="ID_399250160" MODIFIED="1242080984475" TEXT="Attribution">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1240949726024" ID="ID_1538999998" MODIFIED="1241346020402" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_858948409" MODIFIED="1241346023133" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_470728524" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1240949651964" ID="ID_501728660" MODIFIED="1242080984476" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_1608418814" MODIFIED="1242080984476" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_1289588055" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1240949614609" ID="ID_1787506417" MODIFIED="1243494988715" TEXT="Arg2">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="12"/>
<attribute_layout NAME_WIDTH="67" VALUE_WIDTH="76"/>
<attribute NAME="Source" VALUE="Tab32-33Col3"/>
<attribute NAME="Type" VALUE="Tab32-33Col3"/>
<attribute NAME="Polarity" VALUE="Tab32-33Col3"/>
<attribute NAME="Determinacy" VALUE="Tab32-33Col3"/>
<node COLOR="#111111" CREATED="1240949657687" ID="ID_623563317" MODIFIED="1242080984477" TEXT="Attribution">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1240949726024" ID="ID_585347596" MODIFIED="1241346025282" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_1389661512" MODIFIED="1241346026660" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_257274449" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1240949651964" ID="ID_379247915" MODIFIED="1242080984478" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_1847427066" MODIFIED="1242080984478" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_1719156016" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1240951541496" ID="ID_1891787680" MODIFIED="1243494988717" TEXT="Sup2">
<edge STYLE="bezier" WIDTH="thin"/>
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1240951192881" ID="ID_1855503827" MODIFIED="1242080984479" TEXT="RawText">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241340591272" ID="ID_1372550019" MODIFIED="1242080984479" TEXT="TreeRef">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1242813340878" ID="ID_1045080450" MODIFIED="1243496438186" TEXT="tr">
<attribute_layout NAME_WIDTH="33" VALUE_WIDTH="64"/>
<attribute NAME="idref" VALUE="e.g. t1_2_3"/>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#00b439" CREATED="1241355542344" ID="ID_855945217" MODIFIED="1244421376976" TEXT="*Notes">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="16"/>
<node COLOR="#990000" CREATED="1241355973559" ID="ID_320585900" MODIFIED="1243502082011" TEXT="">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="14"/>
<node COLOR="#111111" CREATED="1241356015700" ID="ID_908478040" MODIFIED="1243494983969" TEXT="">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1241355555099" ID="ID_1760401379" MODIFIED="1241356031923" TEXT="* stands for notes, not actuall elements, including this one">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241355592672" ID="ID_1856907047" MODIFIED="1241356031928" TEXT="Tab32-33Col3 reads: Table 32 to Table 33, Column 3,&#xa;in pdtb-annotation-manual.pdf">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1241355623285" ID="ID_1143019806" MODIFIED="1241356054863" TEXT="Italics are optional, except this one">
<edge STYLE="bezier" WIDTH="thin"/>
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
</node>
</map>
