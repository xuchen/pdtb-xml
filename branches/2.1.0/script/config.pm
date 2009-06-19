#! /usr/bin/perl
#
# Gently modify this file according to your own settings.
#


############# pdtb-xml folder ################

# the top dir where the pdtb-xml toolset is
$top_dir = "/home/xcyao/treebanks/pdtb-xml";

############# Swithes ################

$ptbXML = 1; # convert PTB into XML
$pdtbXML = 1; # convert PDTB into XML
$combineXML = 1; # combine the above two into a final one
$validateXML = 1; # validate final XML file
# generate graphics per relation. GraphViz and Saxon are required. It will take a long time so the default is off.
$generateGraph = 0; 

############# External command line tools ################

# XSLT processor, usually it's /usr/bin/xsltproc
$xsltproc = `which xsltproc`;
chomp $xsltproc;
#$xsltproc = "/usr/bin/xsltproc";

# xmllint, validate XML files. If you don't have this command, install libxml2-utils
$xmllint = `which xmllint`;
chomp $xmllint;
#$xmlllint = "/usr/bin/xmllint";


############# PDTB Directory ################

# The "corpora" directory in a PDTB release. This directory should contain the "raw", "combined" and "pdtb_v2" directories.
$corpora = "/home/xcyao/treebanks/pdtb/corpora";

# The "raw" directory contains plain text files
$raw = "$corpora/raw/wsj";

# The "combined" directory contains .mrg PTB files
$combined = "$corpora/combined/wsj";

# The "pdtb_v2" directory contains .pdtb PDTB files
$pdtb_v2 = "$corpora/pdtb_v2/data";

############# Output Directory ################

# Output diretory, where you want to see the final XML files
# This dir shouldn't exist before you run the script
$output_dir = "/home/xcyao/treebanks/pdtb-xml-output";

# Intermediate PTB XML directory. You can delete this dir after converting.
$ptb_xml_dir = "$output_dir/ptb-xml";

# Intermediate PDTB XML directory. You can delete this dir after converting.
$pdtb_xml_dir = "$output_dir/pdtb-xml";

# Final PDTB XML directory
$final_pdtb_xml_dir = "$output_dir/all-xml";

if ($generateGraph) {
    # Generated DOT directory
    $pdtb_dot_dir = "$output_dir/all-dot";

    # The file format used to show the final pictures.
    # possible values are (refer to the manpages of dot):
    # png, ps, svg, svgz, fig, mif, hpgl, pcl, gif, dia, imap, cmapx
    $dot_lang = "png";

    # Final PDTB graphic directory
    $pdtb_pic_dir = "$output_dir/all-$dot_lang";
}

############# Default ################

# You don't have to change the following unless you've modified the pdtb-xml toolset yourself
# But you have to first chdir to the dir where the script is and then run it

# ptbXMLizer
$ptbXMLizer = "java -jar $top_dir/jar/ptbXMLizer.jar ";

# pdtbXMLizer
$pdtbXMLizer = "java -jar $top_dir/jar/pdtbXMLizer.jar ";

# XSLT stylesheets to combine the outputs of ptbXMLizer and pdtbXMLizer into the final one
$xslt_combine = "$top_dir/xslt/combine.xslt";

# XSLT stylesheets to extract trees in DOT language
$xslt_ptb = "$top_dir/xslt/ptb2dot2.xslt";

# XSLT stylesheets to extract relations in DOT language
$xslt_pdtb = "$top_dir/xslt/pdtb2dot2.xslt";

# schema files dir
$schema = "$top_dir/schema";

$dotGraph = "$top_dir/script/dotGraph.pl";

############# Graphic ################

if ($generateGraph) {
    # dot and gvpack are from GraphViz. They are usually in /usr/bin
    $dot = `which dot`;
    chomp $dot;
    $gvpack = `which gvpack`;
    chomp $gvpack;

    # A XSLT 2.0 processor is required. 
    # xsltproc only supports XSLT 1.0 thus can't be used here.
    $saxonJar = "/home/xcyao/xml/saxon9/saxon9.jar";
    $saxonTransform = "java -cp $saxonJar net.sf.saxon.Transform "; 
}


############# Test ################

# Developer's test
$test = 0;
if ($test) {
    $raw = "$corpora/raw00";
    $combined = "$corpora/combined00";
    $pdtb_v2 = "$corpora/pdtb_v2/data00";
}

if (not $test) {
    die "You should remove the following dir before running this script!\n $output_dir" if -e $output_dir;
    die "You should configure the command 'xsltproc' before running this script!\nCurrently it's: $xsltproc" if (not -e $xsltproc);
    die "You should set up the schema dir correctly before running this script!\nCurrently it's: $schema" if (not -e $schema);
    die "You should set up the corpora dir correctly before running this script!\nCurrently it's: $corpora" if (not -e $corpora);
    die "You should set up the raw dir correctly before running this script!\nCurrently it's: $raw" if (not -e $raw);
    die "You should set up the combined dir correctly before running this script!\nCurrently it's: $combined" if (not -e $combined);
    die "You should set up the pdtb_v2 dir correctly before running this script!\nCurrently it's: $pdtb_v2" if (not -e $pdtb_v2);
    if ($generateGraph) {
        die "You should configure the command 'dot' before running this script if you want to generate pictures!\nCurrently it's: $dot" if (not -e $dot);
        die "You should configure the command 'gvpack' before running this script if you want to generate pictures!\nCurrently it's: $gvpack" if (not -e $gvpack);
        die "You should set up the saxon9.jar file correctly before running this script!\nCurrently it's: $saxonJar" if (not -e $saxonJar);
    }
}

print "Everything looks fine. Now start converting. Good luck.\n";
