#How to use the Oracle Berkeley DB XML with PDTB XML.



# Introduction #

The [Oracle Berkeley DB XML](http://www.oracle.com/database/berkeley-db/xml/index.html) is an XML database with XQuery access. Compared to [eXist](http://exist.sourceforge.net/), it automatically builds indexes. So the administration effort is kept minimum.

Bear in mind that BDB XML is not a server but only provides a set of APIs in C/C++/Java for users to access the database. However, with a set of simplified standalone utilities, querying on PDTB XML can still be accomplished.

As this wiki is written, the BDB XML version 2.5.13 for linux is used.


# Steps #

## Build BDB XML ##

After downloading the file, simply decompress it and follow the build instructions. Make sure the final executables are in your PATH environment, i.e. you should have the command **dbxml** and **dbxml\_load\_container**.

## Put the XML files in a container ##
A container is a place holding everything (such as indexes) in your XML files. We can use the command line utility **dbxml\_load\_container** to create a container for PDTB XML.

### Remove DTD ###
_Note: you don't have to do this step if your XML files are converted by pdtb-xml-2.2.0_

When creating a container, dbxml\_load\_container tries to verify the XML files by accessing external DTDs. But unfortunately, dbxml\_load\_container is not programmed to be allowed to access the DTDs. So you might encounter this error:

> Error adding XML data to container: pdtb.dbxml

> Error: External access not allowed. Cannot resolve
> entity: ../schema/pdtb.dtd

The only solution seems to remove the DTD declarations in the XML files. So, if your PDTB XML files are converted using the pdtb-xml-2.1.0 version, you should remove the line containing DTD (in pdtb-xml-2.2.0, the final XML files won't contain this line). You can use the following perl script.

```
#! /usr/bin/perl

# A simple script to remove the 2nd line of every XML file.
#
# Usage: perl remove_2nd_line.pl input_xml_dir output_dir
# It reads every xml file  in input_xml_dir recursively and 
# output all to output_dir without keeping the original directory structure
# 
# Author: Xuchen Yao, 9 Nov. 2009

use File::Find;
use File::Basename;

$file_counter = 0;
@ARGV = qw(.) unless @ARGV;
$in_dir = $ARGV[0];
$out_dir = $ARGV[1];
$wn_perm = 0755;
if (! -d $out_dir) { mkdir $out_dir, $wn_perm or warn "can't make $out_dir: $!"; }
find ({no_chdir => 1, wanted => \&process_file}, $in_dir);
print "number of files processed: $file_counter";

sub process_file {
    if (/\.xml$/i) {
        $file_counter++;
        open(IN, " < $_") or warn "can't open $File::Find::name for reading: $!";
        $out = $out_dir."/".basename($_,@suffixlis);
        open(OUT, " > $out") or warn "can't open $out for writing: $!";
        $line=0;
        while (<IN>) {
            if ($line != 1) {print OUT $_;}
            $line++;
        }
        close IN;
        close OUT;
    }
}
```

### Build a file list ###

Simply use a Linux `find` command to output paths of all the files to a single file. One path per line.

### Create a container ###

Go to a directory where you want to put the container, and execute the following command:

```
dbxml_load_container -c pdtb.dbxml -e -f pdtb.list
```

`pdtb.dbxml` is the newly created container while `pdtb.list` contains all the file names. (For some unknown reason) this process might take as long as 3 hours and the final container size is around 2.0GB.

## Execute queries ##

Run the command `dbxml` in the directory where you put your container. Simple type `help` at the prompt to know the options it provides.

The first step is to set the PDTB container as the default container:

```
dbxml> openContainer pdtb.dbxml
```

Then we can list the indexes it creates to make sure BDB XML works well:
```
dbxml> listIndexes
Index: node-attribute-equality-string node-attribute-equality-double for node {}:Class
Index: node-element-equality-string node-element-equality-double for node {}:Conn1
Index: node-element-equality-string node-element-equality-double for node {}:Conn2
Index: node-attribute-equality-string node-attribute-equality-double for node {}:ConnType
Index: node-element-equality-string node-element-equality-double for node {}:Connective
Index: node-attribute-equality-string node-attribute-equality-double for node {}:Determinacy
Index: node-attribute-equality-string node-attribute-equality-double for node {}:Polarity
Index: node-element-equality-string node-element-equality-double for node {}:RawText
Index: node-attribute-equality-string node-attribute-equality-double for node {}:SemanticClass1
Index: node-attribute-equality-string node-attribute-equality-double for node {}:SemanticClass2
Index: node-attribute-equality-string node-attribute-equality-double for node {}:Source
Index: node-attribute-equality-string node-attribute-equality-double for node {}:Type
Index: node-element-equality-string node-element-equality-double for node {}:b
Index: node-attribute-equality-string node-attribute-equality-double for node {}:cat
Index: node-element-equality-string node-element-equality-double for node {}:edge
Index: node-attribute-equality-string node-attribute-equality-double for node {}:external
Index: node-element-equality-string node-element-equality-double for node {}:head
Index: node-attribute-equality-string node-attribute-equality-double for node {}:id
Index: node-attribute-equality-string node-attribute-equality-double for node {}:idref
Index: node-attribute-equality-string node-attribute-equality-double for node {}:label
Index: unique-node-metadata-equality-string for node {http://www.sleepycat.com/2002/dbxml}:name
Index: node-attribute-equality-string node-attribute-equality-double for node {http://www.w3.org/2001/XMLSchema-instance}:noNamespaceSchemaLocation
Index: node-attribute-equality-string node-attribute-equality-double for node {}:pos
Index: node-attribute-equality-string node-attribute-equality-double for node {}:root
Index: node-element-equality-string node-element-equality-double for node {}:secedge
Index: node-element-equality-string node-element-equality-double for node {}:t
Index: node-element-equality-string node-element-equality-double for node {}:tr
Index: node-attribute-equality-string node-attribute-equality-double for node {}:word
28 indexes found.
```

At last we can execute queries, such as finding out all the explicit relations in the container:

```
dbxml> time query ' 
for $r in collection("pdtb.dbxml")/corpus//Explicit
return $r
'
```

It should give us some results like this:

```
18459 objects returned for eager expression ' 
for $r in collection("pdtb.dbxml")/corpus//Explicit
return $r
'

Time in seconds for command 'query': 40.2122
```

Simply type `print` at the prompt to print all the results (be aware this could be a lot) to your screen or a file. You can type this command to know how to use `print`:

```
dbxml> ? print

print -- Prints most recent results, optionally to a file

Usage: print | printNames [n <number>] [pathToFile]
If "print" is used, the most recent results are printed,
using XmlValue::asString().
If the "printNames" form is used, the results are turned
into document names and printed, if possible.  If the results
cannot be converted, the command will fail.  If the optional
argument "n" is specified followed by a number, then only the
specified number of results are printed. If the optional
pathToFile parameter is specified, the output is written to
the named file, rather than to stdout.
```

Another useful command is `run`:

```
dbxml> ? run

run -- Runs the given file as a script

Usage: run <scriptFile>
```

Thus we can encode the query in a file and run that file.