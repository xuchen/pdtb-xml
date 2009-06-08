#! /usr/bin/perl
#
# Gently modify this file according to your own settings.
#


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


############# Default ################

# You don't have to change the following unless you've modified the pdtb-xml toolset yourself
# But you have to first chdir to the dir where the script is and then run it

# ptbXMLizer
$ptbXMLizer = "java -jar ../jar/ptbXMLizer.jar ";

# pdtbXMLizer
$pdtbXMLizer = "java -jar ../jar/pdtbXMLizer.jar ";

# XSLT stylesheets to combine the outputs of ptbXMLizer and pdtbXMLizer into the final one
$xslt_combine = "../xslt/combine.xslt";

# schema files
$schema = "../schema";

############# Swithes ################

$ptbXML = 1; # convert PTB into XML
$pdtbXML = 1; # convert PDTB into XML
$combineXML = 1; # combine the above two into a final one
$validateXML = 1; # validate final XML file

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
    die "You should set up the schema dir corrctly before running this script!\nCurrently it's: $schema" if (not -e $schema);
    die "You should set up the corpora dir corrctly before running this script!\nCurrently it's: $corpora" if (not -e $corpora);
    die "You should set up the raw dir corrctly before running this script!\nCurrently it's: $raw" if (not -e $raw);
    die "You should set up the combined dir corrctly before running this script!\nCurrently it's: $combined" if (not -e $combined);
    die "You should set up the pdtb_v2 dir corrctly before running this script!\nCurrently it's: $pdtb_v2" if (not -e $pdtb_v2);
}

print "Everything looks fine. Now start converting. Good luck.\n";
