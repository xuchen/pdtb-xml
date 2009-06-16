#! /usr/bin/perl
#
# This script uses XSLT 2.0 to extract and describe syntactic trees and discourse relations
# in the DOT language. For further info of DOT, please refer to:
#
# http://www.graphviz.org/Documentation/dotguide.pdf
# http://en.wikipedia.org/wiki/DOT_language
#
# For every single tree and every relation, this script generates an indivindual .dot file
# to describe it. Then a static picture is generated for display.
#
use File::Find;

my $color_example = '
ConnHeadAttr [style = filled, color = lightpink, label= "ConnHead Attribution"];
ConnHeadAttr -> ConnHead [color=white];
ConnHead [style = filled, color = red, label=ConnHead];
ConnHead -> Sup1 [color=white];
Sup1 [style = filled, color = grey, label=Sup1];
Sup1 -> Arg1Attr [color=white];
Arg1Attr [style = filled, color = tan1, label=Arg1Attr];
Arg1Attr -> Arg1 [color=white];
Arg1 [style = filled, color = yellow, label=Arg1];
Arg1 -> Arg2Attr [color=white];
Arg2Attr [style = filled, color = purple, label=Arg2Attr];
Arg2Attr -> Arg2 [color=white];
Arg2 [style = filled, color = cornflowerblue, label=Arg2];
Arg2 -> Sup2 [color=white];
Sup2 [style = filled, color = green, label=Sup2];
';


print "Start generating DOT files for syntactic trees and discourse relations.\n";
find ({no_chdir => 1, wanted => \&generate_dot}, $final_pdtb_xml_dir);
print "Done generating DOT files.\n";

print "Start generating $dot_lang pictures from DOT for relations.\n";
find ({no_chdir => 1, wanted => \&generate_pic}, $pdtb_dot_dir);
print "Done generating $dot_lang pictures.\n";
print "The final pictures for relations are stored in $pdtb_pic_dir\n";


# this subroutine generates a .dot file for every syntactic tree and discourse relation,
# the .dot files are stored in $pdtb_dot_dir
sub generate_dot
{
    my ($outSubDir, $outDir, $pdtbFile);
    # exclude the "schema" dir
    if(-d && $_ !~ "schema")
    {
        $outSubDir = substr($File::Find::name, length($final_pdtb_xml_dir));
        $outDir = $pdtb_dot_dir."/".$outSubDir;
        # Making output dir
        if (not -e $outDir)
        {
            mkdir($outDir) or die "can't mkdir $outDir: $!";
        }
    }
    if (/\.xml$/i && -f) 
    {
        $outSubDir = substr($File::Find::dir, length($final_pdtb_xml_dir));
        $outDir = $pdtb_dot_dir."/".$outSubDir;
        $pdtbFile = $File::Find::name;
        chdir $outDir;
        system("$saxonTransform  -s:$pdtbFile -xsl:$xslt_ptb");
        system("$saxonTransform  -s:$pdtbFile -xsl:$xslt_pdtb");
    }
    chdir $final_pdtb_xml_dir;
}

# this subroutine generates a picture for every discourse relation.
sub generate_pic
{
    my ($outSubDir, $outDir, $picFile, $ptbFile, $outFile);
    if(-d && $_ !~ "schema")
    {
        print "$_\n";
        $outSubDir = substr($File::Find::name, length($pdtb_dot_dir));
        $outDir = $pdtb_pic_dir."/".$outSubDir;
        # Making output dir
        if (not -e $outDir)
        {
            mkdir($outDir) or die "can't mkdir $outDir: $!";;
        }
    }
    if (/(r\d+)\.dot$/i && -f) 
    {
        # relation id
        my $rname = $1;
        # file name for a relation .dot file
        my $rdot = $_;
        # .dot file content for relations
        my $rdotraw = "";
        # harsh used to count how many trees a relation .dot file contains
        my %trees = ();
        # array used to count how many trees a relation .dot file contains
        my @trees_array = ();
        # the name of all trees a relation .dot file contains
        my $all_tree_names = "";
        my $combined_tree_names = "";

        # Change to the input dir
        chdir $File::Find::dir;

        # Read all DOT content of relations, such as r4.dot
        open RDOT, "<$rdot";
        while (<RDOT>)
        {
            # comment or tree element
            if (/\/\*.*\*\// or /(t\d+).*\[.*style.*color.*label.*\]/)
            {
                $rdotraw .= $_;
                if ($1) { $trees{$1} = 1;}
            }
            # leaves element
            if (/s\d.* \[style = \w+, color = (\w+), label = "(.*)"\]/)
            {
                $rdotraw .= $_;
            }
        }
        close RDOT;

        # Construct tree file names a relation DOT file refers to
        foreach (sort keys %trees)
        {
            # sth like "t5.dot t6.dot "
            $all_tree_names .= $_.".dot ";
            # sth like "t5t6.dot"
            $combined_tree_names  .= $_;
        }
        $combined_tree_names  .= ".dot";

        # Pack all tree files to produce combined compact output, such as t5t6.dot
        if (scalar %trees != 1)
        {
            system("dot $all_tree_names | gvpack -g  >  $combined_tree_names");
        }

        # Read the content of combined tree files except the last line
        open COMBINED_TREES, "<$combined_tree_names";

        my $output = "";
        my $lastline = "";
        while (<COMBINED_TREES>)
        {
            # read every line except the last line, which is a closing "}";
            $output .= $_ unless eof(COMBINED_TREES);
            $lastline = $_;
        }
        close COMBINED_TREES;

        # Concatenate combined, relation, and color examples into one graph
        $output .= $rdotraw.$color_example.$lastline;

        $dot_pic_file = $File::Find::dir."/".$rname."_".$combined_tree_names;
        $pic_file = $rname."_".$combined_tree_names.".$dot_lang";

        # Write output dot file for pic file
        open OUTPUT, ">$dot_pic_file";
        print OUTPUT $output;
        close OUTPUT;

        # Write final pic file
        $outSubDir = substr($File::Find::dir, length($pdtb_dot_dir));
        $outDir = $pdtb_pic_dir."/".$outSubDir;
        chdir $outDir;

        system ("dot -T$dot_lang $dot_pic_file > $pic_file");

    }
    chdir $pdtb_dot_dir;
}

1;
