<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.6.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="16" fill="1" visible="no" active="no"/>
<layer number="3" name="Route3" color="17" fill="1" visible="no" active="no"/>
<layer number="4" name="Route4" color="18" fill="1" visible="no" active="no"/>
<layer number="5" name="Route5" color="19" fill="1" visible="no" active="no"/>
<layer number="6" name="Route6" color="25" fill="1" visible="no" active="no"/>
<layer number="7" name="Route7" color="26" fill="1" visible="no" active="no"/>
<layer number="8" name="Route8" color="27" fill="1" visible="no" active="no"/>
<layer number="9" name="Route9" color="28" fill="1" visible="no" active="no"/>
<layer number="10" name="Route10" color="29" fill="1" visible="no" active="no"/>
<layer number="11" name="Route11" color="30" fill="1" visible="no" active="no"/>
<layer number="12" name="Route12" color="20" fill="1" visible="no" active="no"/>
<layer number="13" name="Route13" color="21" fill="1" visible="no" active="no"/>
<layer number="14" name="Route14" color="22" fill="1" visible="no" active="no"/>
<layer number="15" name="Route15" color="23" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="24" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="2x40 Connector">
<packages>
<package name="2X40_PIN_CONNECTOR">
<pad name="5V_5" x="0" y="0" drill="1" diameter="1.6764"/>
<pad name="5V_4" x="2.54" y="0" drill="1" diameter="1.6764"/>
<pad name="5V_3" x="5.08" y="0" drill="1" diameter="1.6764"/>
<pad name="5V_2" x="7.62" y="0" drill="1" diameter="1.6764"/>
<pad name="GND_7" x="10.16" y="0" drill="1" diameter="1.6764"/>
<pad name="GND_6" x="12.7" y="0" drill="1" diameter="1.6764"/>
<pad name="GND_5" x="15.24" y="0" drill="1" diameter="1.6764"/>
<pad name="GND_4" x="17.78" y="0" drill="1" diameter="1.6764"/>
<pad name="RESET" x="20.32" y="0" drill="1" diameter="1.6764"/>
<pad name="3.3V" x="22.86" y="0" drill="1" diameter="1.6764"/>
<pad name="D10" x="22.86" y="2.54" drill="1" diameter="1.6764"/>
<pad name="D11" x="20.32" y="2.54" drill="1" diameter="1.6764"/>
<pad name="D12" x="17.78" y="2.54" drill="1" diameter="1.6764"/>
<pad name="D13" x="15.24" y="2.54" drill="1" diameter="1.6764"/>
<pad name="GND_3" x="12.7" y="2.54" drill="1" diameter="1.6764"/>
<pad name="AREF" x="10.16" y="2.54" drill="1" diameter="1.6764"/>
<pad name="3.3V_2" x="7.62" y="2.54" drill="1" diameter="1.6764"/>
<pad name="3.3V_3" x="5.08" y="2.54" drill="1" diameter="1.6764"/>
<pad name="3.3V_4" x="2.54" y="2.54" drill="1" diameter="1.6764"/>
<pad name="3.3V_5" x="0" y="2.54" drill="1" diameter="1.6764"/>
<pad name="5V" x="25.4" y="0" drill="1" diameter="1.6764"/>
<pad name="D9" x="25.4" y="2.54" drill="1" diameter="1.6764"/>
<pad name="D8" x="27.94" y="2.54" drill="1" diameter="1.6764"/>
<pad name="GND_2" x="27.94" y="0" drill="1" diameter="1.6764"/>
<pad name="GND_1" x="30.48" y="0" drill="1" diameter="1.6764"/>
<pad name="D7" x="30.48" y="2.54" drill="1" diameter="1.6764"/>
<pad name="D6" x="33.02" y="2.54" drill="1" diameter="1.6764"/>
<pad name="VIN" x="33.02" y="0" drill="1" diameter="1.6764"/>
<pad name="A0" x="35.56" y="0" drill="1" diameter="1.6764"/>
<pad name="D5" x="35.56" y="2.54" drill="1" diameter="1.6764"/>
<pad name="A1" x="38.1" y="0" drill="1" diameter="1.6764"/>
<pad name="D4" x="38.1" y="2.54" drill="1" diameter="1.6764"/>
<pad name="D3" x="40.64" y="2.54" drill="1" diameter="1.6764"/>
<pad name="A2" x="40.64" y="0" drill="1" diameter="1.6764"/>
<pad name="A3" x="43.18" y="0" drill="1" diameter="1.6764"/>
<pad name="D2" x="43.18" y="2.54" drill="1" diameter="1.6764"/>
<pad name="D1" x="45.72" y="2.54" drill="1" diameter="1.6764"/>
<pad name="A4" x="45.72" y="0" drill="1" diameter="1.6764"/>
<pad name="A5" x="48.26" y="0" drill="1" diameter="1.6764"/>
<pad name="D0" x="48.26" y="2.54" drill="1" diameter="1.6764" shape="square"/>
<wire x1="52.13" y1="-1.72" x2="-3.87" y2="-1.72" width="0.127" layer="21"/>
<wire x1="-3.87" y1="-1.72" x2="-3.87" y2="4.28" width="0.127" layer="21"/>
<wire x1="-3.87" y1="4.28" x2="52.13" y2="4.28" width="0.127" layer="21"/>
<wire x1="52.13" y1="4.28" x2="52.13" y2="-1.72" width="0.127" layer="21"/>
<text x="36.449" y="5.08" size="1.27" layer="21">2x40 CONNECTOR</text>
</package>
</packages>
<symbols>
<symbol name="2X40_CONNECTOR">
<wire x1="0" y1="0" x2="56.32" y2="0" width="0.254" layer="94"/>
<wire x1="56.32" y1="0" x2="56.32" y2="30" width="0.254" layer="94"/>
<wire x1="56.32" y1="30" x2="0" y2="30" width="0.254" layer="94"/>
<wire x1="0" y1="30" x2="0" y2="0" width="0.254" layer="94"/>
<pin name="D0" x="53.34" y="33.02" length="middle" rot="R270"/>
<pin name="D1" x="50.8" y="33.02" length="middle" rot="R270"/>
<pin name="D2" x="48.26" y="33.02" length="middle" rot="R270"/>
<pin name="D3" x="45.72" y="33.02" length="middle" rot="R270"/>
<pin name="D4" x="43.18" y="33.02" length="middle" rot="R270"/>
<pin name="D5" x="40.64" y="33.02" length="middle" rot="R270"/>
<pin name="D6" x="38.1" y="33.02" length="middle" rot="R270"/>
<pin name="D7" x="35.56" y="33.02" length="middle" rot="R270"/>
<pin name="D8" x="33.02" y="33.02" length="middle" rot="R270"/>
<pin name="D9" x="30.48" y="33.02" length="middle" rot="R270"/>
<pin name="D10" x="27.94" y="33.02" length="middle" rot="R270"/>
<pin name="D11" x="25.4" y="33.02" length="middle" rot="R270"/>
<pin name="D12" x="22.86" y="33.02" length="middle" rot="R270"/>
<pin name="D13" x="20.32" y="33.02" length="middle" rot="R270"/>
<pin name="GND_3" x="17.78" y="33.02" length="middle" rot="R270"/>
<pin name="AREF" x="15.24" y="33.02" length="middle" rot="R270"/>
<pin name="3.3V_2" x="12.7" y="33.02" length="middle" rot="R270"/>
<pin name="3.3V_3" x="10.16" y="33.02" length="middle" rot="R270"/>
<pin name="3.3V_4" x="7.62" y="33.02" length="middle" rot="R270"/>
<pin name="3.3V_5" x="5.08" y="33.02" length="middle" rot="R270"/>
<pin name="A5" x="53.34" y="-2.54" length="middle" rot="R90"/>
<pin name="A4" x="50.8" y="-2.54" length="middle" rot="R90"/>
<pin name="A3" x="48.26" y="-2.54" length="middle" rot="R90"/>
<pin name="A2" x="45.72" y="-2.54" length="middle" rot="R90"/>
<pin name="A1" x="43.18" y="-2.54" length="middle" rot="R90"/>
<pin name="A0" x="40.64" y="-2.54" length="middle" rot="R90"/>
<pin name="VIN" x="38.1" y="-2.54" length="middle" rot="R90"/>
<pin name="GND_1" x="35.56" y="-2.54" length="middle" rot="R90"/>
<pin name="GND_2" x="33.02" y="-2.54" length="middle" rot="R90"/>
<pin name="5V" x="30.48" y="-2.54" length="middle" rot="R90"/>
<pin name="3.3V" x="27.94" y="-2.54" length="middle" rot="R90"/>
<pin name="RST" x="25.4" y="-2.54" length="middle" rot="R90"/>
<pin name="GND_4" x="22.86" y="-2.54" length="middle" rot="R90"/>
<pin name="GMD_5" x="20.32" y="-2.54" length="middle" rot="R90"/>
<pin name="GND_6" x="17.78" y="-2.54" length="middle" rot="R90"/>
<pin name="GMD_7" x="15.24" y="-2.54" length="middle" rot="R90"/>
<pin name="5V_2" x="12.7" y="-2.54" length="middle" rot="R90"/>
<pin name="5V_3" x="10.16" y="-2.54" length="middle" rot="R90"/>
<pin name="5V_4" x="7.62" y="-2.54" length="middle" rot="R90"/>
<pin name="5V_5" x="5.08" y="-2.54" length="middle" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="2X40_CONNECTOR" prefix="2X40CONECTOR">
<gates>
<gate name="G$1" symbol="2X40_CONNECTOR" x="0" y="0"/>
</gates>
<devices>
<device name="" package="2X40_PIN_CONNECTOR">
<connects>
<connect gate="G$1" pin="3.3V" pad="3.3V"/>
<connect gate="G$1" pin="3.3V_2" pad="3.3V_2"/>
<connect gate="G$1" pin="3.3V_3" pad="3.3V_3"/>
<connect gate="G$1" pin="3.3V_4" pad="3.3V_4"/>
<connect gate="G$1" pin="3.3V_5" pad="3.3V_5"/>
<connect gate="G$1" pin="5V" pad="5V"/>
<connect gate="G$1" pin="5V_2" pad="5V_2"/>
<connect gate="G$1" pin="5V_3" pad="5V_3"/>
<connect gate="G$1" pin="5V_4" pad="5V_4"/>
<connect gate="G$1" pin="5V_5" pad="5V_5"/>
<connect gate="G$1" pin="A0" pad="A0"/>
<connect gate="G$1" pin="A1" pad="A1"/>
<connect gate="G$1" pin="A2" pad="A2"/>
<connect gate="G$1" pin="A3" pad="A3"/>
<connect gate="G$1" pin="A4" pad="A4"/>
<connect gate="G$1" pin="A5" pad="A5"/>
<connect gate="G$1" pin="AREF" pad="AREF"/>
<connect gate="G$1" pin="D0" pad="D0"/>
<connect gate="G$1" pin="D1" pad="D1"/>
<connect gate="G$1" pin="D10" pad="D10"/>
<connect gate="G$1" pin="D11" pad="D11"/>
<connect gate="G$1" pin="D12" pad="D12"/>
<connect gate="G$1" pin="D13" pad="D13"/>
<connect gate="G$1" pin="D2" pad="D2"/>
<connect gate="G$1" pin="D3" pad="D3"/>
<connect gate="G$1" pin="D4" pad="D4"/>
<connect gate="G$1" pin="D5" pad="D5"/>
<connect gate="G$1" pin="D6" pad="D6"/>
<connect gate="G$1" pin="D7" pad="D7"/>
<connect gate="G$1" pin="D8" pad="D8"/>
<connect gate="G$1" pin="D9" pad="D9"/>
<connect gate="G$1" pin="GMD_5" pad="GND_5"/>
<connect gate="G$1" pin="GMD_7" pad="GND_7"/>
<connect gate="G$1" pin="GND_1" pad="GND_1"/>
<connect gate="G$1" pin="GND_2" pad="GND_2"/>
<connect gate="G$1" pin="GND_3" pad="GND_3"/>
<connect gate="G$1" pin="GND_4" pad="GND_4"/>
<connect gate="G$1" pin="GND_6" pad="GND_6"/>
<connect gate="G$1" pin="RST" pad="RESET"/>
<connect gate="G$1" pin="VIN" pad="VIN"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="pinhead" urn="urn:adsk.eagle:library:325">
<description>&lt;b&gt;Pin Header Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="1X02" urn="urn:adsk.eagle:footprint:22309/1" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<pad name="1" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-2.6162" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
</package>
<package name="1X02/90" urn="urn:adsk.eagle:footprint:22310/1" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-3.175" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="4.445" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
</package>
<package name="1X03" urn="urn:adsk.eagle:footprint:22340/1" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-3.175" y1="1.27" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<pad name="1" x="-2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-3.8862" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<rectangle x1="-2.794" y1="-0.254" x2="-2.286" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
</package>
<package name="1X03/90" urn="urn:adsk.eagle:footprint:22341/1" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-3.81" y1="-1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="6.985" x2="-2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="6.985" x2="0" y2="1.27" width="0.762" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="6.985" x2="2.54" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="0" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-4.445" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="5.715" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.921" y1="0.635" x2="-2.159" y2="1.143" layer="21"/>
<rectangle x1="-0.381" y1="0.635" x2="0.381" y2="1.143" layer="21"/>
<rectangle x1="2.159" y1="0.635" x2="2.921" y2="1.143" layer="21"/>
<rectangle x1="-2.921" y1="-2.921" x2="-2.159" y2="-1.905" layer="21"/>
<rectangle x1="-0.381" y1="-2.921" x2="0.381" y2="-1.905" layer="21"/>
<rectangle x1="2.159" y1="-2.921" x2="2.921" y2="-1.905" layer="21"/>
</package>
<package name="1X04" urn="urn:adsk.eagle:footprint:22258/1" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="0" y1="0.635" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-5.1562" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
</package>
<package name="1X04/90" urn="urn:adsk.eagle:footprint:22259/1" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-5.08" y1="-1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="6.985" x2="-3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="6.985" x2="3.81" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-5.715" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="6.985" y="-4.445" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-4.191" y1="0.635" x2="-3.429" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="3.429" y1="0.635" x2="4.191" y2="1.143" layer="21"/>
<rectangle x1="-4.191" y1="-2.921" x2="-3.429" y2="-1.905" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
<rectangle x1="3.429" y1="-2.921" x2="4.191" y2="-1.905" layer="21"/>
</package>
</packages>
<packages3d>
<package3d name="1X02" urn="urn:adsk.eagle:package:22435/2" type="model" library_version="4">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X02"/>
</packageinstances>
</package3d>
<package3d name="1X02/90" urn="urn:adsk.eagle:package:22437/2" type="model" library_version="4">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X02/90"/>
</packageinstances>
</package3d>
<package3d name="1X03" urn="urn:adsk.eagle:package:22458/2" type="model" library_version="4">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X03"/>
</packageinstances>
</package3d>
<package3d name="1X03/90" urn="urn:adsk.eagle:package:22459/2" type="model" library_version="4">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X03/90"/>
</packageinstances>
</package3d>
<package3d name="1X04" urn="urn:adsk.eagle:package:22407/2" type="model" library_version="4">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X04"/>
</packageinstances>
</package3d>
<package3d name="1X04/90" urn="urn:adsk.eagle:package:22404/2" type="model" library_version="4">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X04/90"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="PINHD2" urn="urn:adsk.eagle:symbol:22308/1" library_version="4">
<wire x1="-6.35" y1="-2.54" x2="1.27" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="1.27" y2="5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="5.08" x2="-6.35" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="5.08" x2="-6.35" y2="-2.54" width="0.4064" layer="94"/>
<text x="-6.35" y="5.715" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
<symbol name="PINHD3" urn="urn:adsk.eagle:symbol:22339/1" library_version="4">
<wire x1="-6.35" y1="-5.08" x2="1.27" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="1.27" y2="5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="5.08" x2="-6.35" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="5.08" x2="-6.35" y2="-5.08" width="0.4064" layer="94"/>
<text x="-6.35" y="5.715" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
<symbol name="PINHD4" urn="urn:adsk.eagle:symbol:22257/1" library_version="4">
<wire x1="-6.35" y1="-5.08" x2="1.27" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="1.27" y2="7.62" width="0.4064" layer="94"/>
<wire x1="1.27" y1="7.62" x2="-6.35" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="7.62" x2="-6.35" y2="-5.08" width="0.4064" layer="94"/>
<text x="-6.35" y="8.255" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-1X2" urn="urn:adsk.eagle:component:22516/4" prefix="JP" uservalue="yes" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="PINHD2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X02">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22435/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="98" constant="no"/>
</technology>
</technologies>
</device>
<device name="/90" package="1X02/90">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22437/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="24" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-1X3" urn="urn:adsk.eagle:component:22524/4" prefix="JP" uservalue="yes" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD3" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X03">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22458/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="92" constant="no"/>
</technology>
</technologies>
</device>
<device name="/90" package="1X03/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22459/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="17" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-1X4" urn="urn:adsk.eagle:component:22499/5" prefix="JP" uservalue="yes" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD4" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X04">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22407/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="91" constant="no"/>
</technology>
</technologies>
</device>
<device name="/90" package="1X04/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22404/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="9" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0.5" drill="0">
<clearance class="0" value="0.381"/>
</class>
<class number="1" name="GND, 5V" width="0.75" drill="0">
<clearance class="1" value="0.381"/>
</class>
</classes>
<parts>
<part name="2X40CONECTOR1" library="2x40 Connector" deviceset="2X40_CONNECTOR" device="" override_package3d_urn="urn:adsk.eagle:package:44840999/2" override_package_urn="urn:adsk.eagle:footprint:44841001/1"/>
<part name="PUSH1" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X2" device="" package3d_urn="urn:adsk.eagle:package:22435/2"/>
<part name="PUSH2" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X2" device="" package3d_urn="urn:adsk.eagle:package:22435/2"/>
<part name="PUSH3" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X2" device="" package3d_urn="urn:adsk.eagle:package:22435/2"/>
<part name="PUSH4" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X2" device="" package3d_urn="urn:adsk.eagle:package:22435/2"/>
<part name="SWITCH" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X3" device="" package3d_urn="urn:adsk.eagle:package:22458/2"/>
<part name="POT_1" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X3" device="" package3d_urn="urn:adsk.eagle:package:22458/2"/>
<part name="POT_2" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X3" device="" package3d_urn="urn:adsk.eagle:package:22458/2"/>
<part name="POT_3" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X3" device="" package3d_urn="urn:adsk.eagle:package:22458/2"/>
<part name="DISPLAY" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X4" device="" package3d_urn="urn:adsk.eagle:package:22407/2"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="2X40CONECTOR1" gate="G$1" x="0" y="0" smashed="yes"/>
<instance part="PUSH1" gate="G$1" x="83.82" y="73.66" smashed="yes" rot="R90">
<attribute name="NAME" x="78.105" y="67.31" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="88.9" y="67.31" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="PUSH2" gate="G$1" x="63.5" y="73.66" smashed="yes" rot="R90">
<attribute name="NAME" x="57.785" y="67.31" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="68.58" y="67.31" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="PUSH3" gate="G$1" x="43.18" y="73.66" smashed="yes" rot="R90">
<attribute name="NAME" x="37.465" y="67.31" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="48.26" y="67.31" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="PUSH4" gate="G$1" x="20.32" y="73.66" smashed="yes" rot="R90">
<attribute name="NAME" x="14.605" y="67.31" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="25.4" y="67.31" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="SWITCH" gate="A" x="91.44" y="-55.88" smashed="yes" rot="R270">
<attribute name="NAME" x="97.155" y="-49.53" size="1.778" layer="95" rot="R270"/>
<attribute name="VALUE" x="83.82" y="-49.53" size="1.778" layer="96" rot="R270"/>
</instance>
<instance part="POT_1" gate="A" x="71.12" y="-55.88" smashed="yes" rot="R270">
<attribute name="NAME" x="76.835" y="-49.53" size="1.778" layer="95" rot="R270"/>
<attribute name="VALUE" x="63.5" y="-49.53" size="1.778" layer="96" rot="R270"/>
</instance>
<instance part="POT_2" gate="A" x="50.8" y="-55.88" smashed="yes" rot="R270">
<attribute name="NAME" x="56.515" y="-49.53" size="1.778" layer="95" rot="R270"/>
<attribute name="VALUE" x="43.18" y="-49.53" size="1.778" layer="96" rot="R270"/>
</instance>
<instance part="POT_3" gate="A" x="30.48" y="-55.88" smashed="yes" rot="R270">
<attribute name="NAME" x="36.195" y="-49.53" size="1.778" layer="95" rot="R270"/>
<attribute name="VALUE" x="22.86" y="-49.53" size="1.778" layer="96" rot="R270"/>
</instance>
<instance part="DISPLAY" gate="A" x="2.54" y="-55.88" smashed="yes" rot="R270">
<attribute name="NAME" x="10.795" y="-49.53" size="1.778" layer="95" rot="R270"/>
<attribute name="VALUE" x="-5.08" y="-49.53" size="1.778" layer="96" rot="R270"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="1">
<segment>
<pinref part="2X40CONECTOR1" gate="G$1" pin="GND_1"/>
<wire x1="35.56" y1="-2.54" x2="35.56" y2="-17.78" width="0.1524" layer="91"/>
<wire x1="35.56" y1="-17.78" x2="48.26" y2="-17.78" width="0.1524" layer="91"/>
<wire x1="48.26" y1="-17.78" x2="68.58" y2="-17.78" width="0.1524" layer="91"/>
<wire x1="68.58" y1="-17.78" x2="91.44" y2="-17.78" width="0.1524" layer="91"/>
<wire x1="91.44" y1="-17.78" x2="111.76" y2="-17.78" width="0.1524" layer="91"/>
<wire x1="111.76" y1="-17.78" x2="111.76" y2="50.8" width="0.1524" layer="91"/>
<pinref part="PUSH1" gate="G$1" pin="2"/>
<wire x1="111.76" y1="50.8" x2="83.82" y2="50.8" width="0.1524" layer="91"/>
<wire x1="83.82" y1="50.8" x2="83.82" y2="71.12" width="0.1524" layer="91"/>
<pinref part="PUSH2" gate="G$1" pin="2"/>
<wire x1="83.82" y1="50.8" x2="63.5" y2="50.8" width="0.1524" layer="91"/>
<wire x1="63.5" y1="50.8" x2="63.5" y2="71.12" width="0.1524" layer="91"/>
<junction x="83.82" y="50.8"/>
<pinref part="PUSH3" gate="G$1" pin="2"/>
<wire x1="63.5" y1="50.8" x2="43.18" y2="50.8" width="0.1524" layer="91"/>
<wire x1="43.18" y1="50.8" x2="43.18" y2="71.12" width="0.1524" layer="91"/>
<junction x="63.5" y="50.8"/>
<pinref part="PUSH4" gate="G$1" pin="2"/>
<wire x1="43.18" y1="50.8" x2="20.32" y2="50.8" width="0.1524" layer="91"/>
<wire x1="20.32" y1="50.8" x2="20.32" y2="71.12" width="0.1524" layer="91"/>
<junction x="43.18" y="50.8"/>
<pinref part="2X40CONECTOR1" gate="G$1" pin="GND_4"/>
<wire x1="22.86" y1="-2.54" x2="22.86" y2="-17.78" width="0.1524" layer="91"/>
<wire x1="22.86" y1="-17.78" x2="27.94" y2="-17.78" width="0.1524" layer="91"/>
<junction x="35.56" y="-17.78"/>
<pinref part="2X40CONECTOR1" gate="G$1" pin="GND_2"/>
<wire x1="27.94" y1="-17.78" x2="33.02" y2="-17.78" width="0.1524" layer="91"/>
<wire x1="33.02" y1="-17.78" x2="35.56" y2="-17.78" width="0.1524" layer="91"/>
<wire x1="33.02" y1="-2.54" x2="33.02" y2="-17.78" width="0.1524" layer="91"/>
<junction x="33.02" y="-17.78"/>
<pinref part="2X40CONECTOR1" gate="G$1" pin="GMD_7"/>
<wire x1="15.24" y1="-2.54" x2="15.24" y2="-17.78" width="0.1524" layer="91"/>
<wire x1="15.24" y1="-17.78" x2="17.78" y2="-17.78" width="0.1524" layer="91"/>
<junction x="22.86" y="-17.78"/>
<pinref part="2X40CONECTOR1" gate="G$1" pin="GND_6"/>
<wire x1="17.78" y1="-17.78" x2="20.32" y2="-17.78" width="0.1524" layer="91"/>
<wire x1="20.32" y1="-17.78" x2="22.86" y2="-17.78" width="0.1524" layer="91"/>
<wire x1="17.78" y1="-2.54" x2="17.78" y2="-17.78" width="0.1524" layer="91"/>
<junction x="17.78" y="-17.78"/>
<pinref part="2X40CONECTOR1" gate="G$1" pin="GMD_5"/>
<wire x1="20.32" y1="-2.54" x2="20.32" y2="-17.78" width="0.1524" layer="91"/>
<junction x="20.32" y="-17.78"/>
<pinref part="2X40CONECTOR1" gate="G$1" pin="GND_3"/>
<wire x1="17.78" y1="33.02" x2="17.78" y2="50.8" width="0.1524" layer="91"/>
<wire x1="17.78" y1="50.8" x2="20.32" y2="50.8" width="0.1524" layer="91"/>
<junction x="20.32" y="50.8"/>
<pinref part="SWITCH" gate="A" pin="2"/>
<wire x1="91.44" y1="-53.34" x2="91.44" y2="-17.78" width="0.1524" layer="91"/>
<junction x="91.44" y="-17.78"/>
<pinref part="POT_1" gate="A" pin="3"/>
<wire x1="68.58" y1="-53.34" x2="68.58" y2="-17.78" width="0.1524" layer="91"/>
<junction x="68.58" y="-17.78"/>
<pinref part="POT_2" gate="A" pin="3"/>
<wire x1="48.26" y1="-53.34" x2="48.26" y2="-17.78" width="0.1524" layer="91"/>
<junction x="48.26" y="-17.78"/>
<pinref part="POT_3" gate="A" pin="3"/>
<wire x1="27.94" y1="-53.34" x2="27.94" y2="-35.56" width="0.1524" layer="91"/>
<junction x="27.94" y="-17.78"/>
<pinref part="DISPLAY" gate="A" pin="1"/>
<wire x1="27.94" y1="-35.56" x2="27.94" y2="-17.78" width="0.1524" layer="91"/>
<wire x1="7.62" y1="-53.34" x2="7.62" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="7.62" y1="-35.56" x2="27.94" y2="-35.56" width="0.1524" layer="91"/>
<junction x="27.94" y="-35.56"/>
</segment>
</net>
<net name="PUSH1_D2" class="0">
<segment>
<pinref part="2X40CONECTOR1" gate="G$1" pin="D2"/>
<wire x1="48.26" y1="33.02" x2="48.26" y2="45.72" width="0.1524" layer="91"/>
<wire x1="48.26" y1="45.72" x2="81.28" y2="45.72" width="0.1524" layer="91"/>
<pinref part="PUSH1" gate="G$1" pin="1"/>
<wire x1="81.28" y1="45.72" x2="81.28" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="PUSH2_D3" class="0">
<segment>
<pinref part="2X40CONECTOR1" gate="G$1" pin="D3"/>
<wire x1="45.72" y1="33.02" x2="45.72" y2="48.26" width="0.1524" layer="91"/>
<wire x1="45.72" y1="48.26" x2="60.96" y2="48.26" width="0.1524" layer="91"/>
<pinref part="PUSH2" gate="G$1" pin="1"/>
<wire x1="60.96" y1="48.26" x2="60.96" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="PUSH3_D4" class="0">
<segment>
<pinref part="2X40CONECTOR1" gate="G$1" pin="D4"/>
<wire x1="43.18" y1="33.02" x2="43.18" y2="48.26" width="0.1524" layer="91"/>
<wire x1="43.18" y1="48.26" x2="40.64" y2="48.26" width="0.1524" layer="91"/>
<pinref part="PUSH3" gate="G$1" pin="1"/>
<wire x1="40.64" y1="48.26" x2="40.64" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="PUSH4_D5" class="0">
<segment>
<pinref part="2X40CONECTOR1" gate="G$1" pin="D5"/>
<wire x1="40.64" y1="33.02" x2="40.64" y2="45.72" width="0.1524" layer="91"/>
<wire x1="40.64" y1="45.72" x2="35.56" y2="45.72" width="0.1524" layer="91"/>
<wire x1="35.56" y1="45.72" x2="35.56" y2="53.34" width="0.1524" layer="91"/>
<wire x1="35.56" y1="53.34" x2="17.78" y2="53.34" width="0.1524" layer="91"/>
<pinref part="PUSH4" gate="G$1" pin="1"/>
<wire x1="17.78" y1="53.34" x2="17.78" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SWITCH_D6" class="0">
<segment>
<pinref part="2X40CONECTOR1" gate="G$1" pin="D6"/>
<wire x1="38.1" y1="33.02" x2="38.1" y2="43.18" width="0.1524" layer="91"/>
<wire x1="38.1" y1="43.18" x2="93.98" y2="43.18" width="0.1524" layer="91"/>
<pinref part="SWITCH" gate="A" pin="1"/>
<wire x1="93.98" y1="-53.34" x2="93.98" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SWITCH_D7" class="0">
<segment>
<pinref part="SWITCH" gate="A" pin="3"/>
<wire x1="88.9" y1="-53.34" x2="88.9" y2="40.64" width="0.1524" layer="91"/>
<wire x1="88.9" y1="40.64" x2="35.56" y2="40.64" width="0.1524" layer="91"/>
<pinref part="2X40CONECTOR1" gate="G$1" pin="D7"/>
<wire x1="35.56" y1="40.64" x2="35.56" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="5V" class="1">
<segment>
<pinref part="2X40CONECTOR1" gate="G$1" pin="5V"/>
<wire x1="30.48" y1="-2.54" x2="30.48" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="POT_1" gate="A" pin="1"/>
<wire x1="30.48" y1="-30.48" x2="33.02" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="33.02" y1="-30.48" x2="53.34" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="53.34" y1="-30.48" x2="73.66" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="73.66" y1="-30.48" x2="73.66" y2="-53.34" width="0.1524" layer="91"/>
<pinref part="POT_2" gate="A" pin="1"/>
<wire x1="53.34" y1="-53.34" x2="53.34" y2="-30.48" width="0.1524" layer="91"/>
<junction x="53.34" y="-30.48"/>
<pinref part="POT_3" gate="A" pin="1"/>
<wire x1="33.02" y1="-53.34" x2="33.02" y2="-30.48" width="0.1524" layer="91"/>
<junction x="33.02" y="-30.48"/>
<wire x1="30.48" y1="-30.48" x2="5.08" y2="-30.48" width="0.1524" layer="91"/>
<junction x="30.48" y="-30.48"/>
<pinref part="DISPLAY" gate="A" pin="2"/>
<wire x1="5.08" y1="-30.48" x2="5.08" y2="-53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="POTEN1_A0" class="0">
<segment>
<pinref part="POT_1" gate="A" pin="2"/>
<wire x1="71.12" y1="-53.34" x2="71.12" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="71.12" y1="-7.62" x2="40.64" y2="-7.62" width="0.1524" layer="91"/>
<pinref part="2X40CONECTOR1" gate="G$1" pin="A0"/>
<wire x1="40.64" y1="-7.62" x2="40.64" y2="-2.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="POTEN2_A1" class="0">
<segment>
<pinref part="2X40CONECTOR1" gate="G$1" pin="A1"/>
<wire x1="43.18" y1="-2.54" x2="43.18" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="43.18" y1="-10.16" x2="50.8" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="POT_2" gate="A" pin="2"/>
<wire x1="50.8" y1="-10.16" x2="50.8" y2="-53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="POT3_A2" class="0">
<segment>
<pinref part="2X40CONECTOR1" gate="G$1" pin="A2"/>
<wire x1="45.72" y1="-2.54" x2="45.72" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="45.72" y1="-35.56" x2="30.48" y2="-35.56" width="0.1524" layer="91"/>
<pinref part="POT_3" gate="A" pin="2"/>
<wire x1="30.48" y1="-35.56" x2="30.48" y2="-53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="DISPLAY_D8" class="0">
<segment>
<pinref part="2X40CONECTOR1" gate="G$1" pin="D8"/>
<wire x1="33.02" y1="33.02" x2="33.02" y2="48.26" width="0.1524" layer="91"/>
<wire x1="33.02" y1="48.26" x2="-17.78" y2="48.26" width="0.1524" layer="91"/>
<wire x1="-17.78" y1="48.26" x2="-17.78" y2="-17.78" width="0.1524" layer="91"/>
<wire x1="-17.78" y1="-17.78" x2="2.54" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="DISPLAY" gate="A" pin="3"/>
<wire x1="2.54" y1="-17.78" x2="2.54" y2="-53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="DISPLAY_D9" class="0">
<segment>
<pinref part="2X40CONECTOR1" gate="G$1" pin="D9"/>
<wire x1="30.48" y1="33.02" x2="30.48" y2="45.72" width="0.1524" layer="91"/>
<wire x1="30.48" y1="45.72" x2="-20.32" y2="45.72" width="0.1524" layer="91"/>
<wire x1="-20.32" y1="45.72" x2="-20.32" y2="-20.32" width="0.1524" layer="91"/>
<wire x1="-20.32" y1="-20.32" x2="0" y2="-20.32" width="0.1524" layer="91"/>
<pinref part="DISPLAY" gate="A" pin="4"/>
<wire x1="0" y1="-20.32" x2="0" y2="-53.34" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
<note version="9.4" severity="warning">
Since Version 9.4, EAGLE supports the overriding of 3D packages
in schematics and board files. Those overridden 3d packages
will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
