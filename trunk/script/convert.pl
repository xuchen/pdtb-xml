#! /usr/bin/perl 
#
# This script converts the Penn Discourse TreeBank Version 2.0 into XML format.
#
# Usage (please first change to the script's dir and then run it):
# perl convert.pl 
# 
use File::Find;

require("config.pm");

# Convert PTB into XML format
if ($ptbXML)
{
    print "Start converting the PTB .mrg files into XML format.\n";
    system("$ptbXMLizer $combined $ptb_xml_dir") == 0
        or die "Converting the PTB .mrg files into XML format failed: $?\n";
    print "Done converting the PTB .mrg files into XML format.\n";
}

# Convert PDTB into XML format
if ($pdtbXML)
{
    print "Start converting the PDTB .pdtb files into XML format.\n";
    system("$pdtbXMLizer -r $raw -p $combined -d $pdtb_v2 -o $pdtb_xml_dir -x '*' -c") == 0
        or die "Converting the PDTB .pdtb files into XML format failed: $?\n";
    print "Done converting the PDTB .pdtb files into XML format.\n";
}

# Combine PDTB and PTB XML files into one
if ($combineXML)
{
    print "Start combining the PTB/PDTB files into one.\n";
    find ({no_chdir => 1, wanted => \&process_file}, $pdtb_xml_dir);
    # Copy schema to final XML dir
    system("cp -rf $schema $final_pdtb_xml_dir") == 0
        or die "Copying schema files failed: $?\n";
    print "Done combining the PDTB .pdtb files into XML format.\n";
}

# Validate the generated XML files
if ($validateXML)
{
    print "Start validating the combined XML files.\n";
    system("find $final_pdtb_xml_dir -name \"*.xml\" -type f -exec $xmllint --noout --schema $schema/TigerXML.xsd {} \\; 2>&1") == 0
        or die "Validating the combined XML files failed: $?\n";
    print "Done validating the combined XML files.\n";
    print "The final number of XML files should be 2159 while the actual file number is: ";
    system("find $final_pdtb_xml_dir -name \"*.xml\" -type f | wc -l");
}

if ($generateGraph) {
    require("$dotGraph");
}

sub process_file
{
    my ($outSubDir, $outDir, $pdtbFile, $ptbFile, $outFile);
    if(-d)
    {
        # Making output dir
        $outSubDir = substr($File::Find::name, length($pdtb_xml_dir));
        $outDir = $final_pdtb_xml_dir."/".$outSubDir;
        if (not -e $outDir)
        {
            mkdir($outDir) or die "can't mkdir $outDir: $!";;
        }
    }
    if (/\.xml$/i && -f) 
    {
        $pdtbFile = $File::Find::name;
        $ptbFile = substr($pdtbFile, length($pdtb_xml_dir));
        $outFile = substr($pdtbFile, length($pdtb_xml_dir));
        $ptbFile = $ptb_xml_dir."/".$ptbFile;
        $outFile = $final_pdtb_xml_dir."/".$outFile;
        system("$xsltproc  -o $outFile  --stringparam file $pdtbFile $xslt_combine $ptbFile");
    }
}

print "Converting is done. The final files are located in:\n$final_pdtb_xml_dir\n";
0;
