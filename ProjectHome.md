This project provides a toolset (Linux only) to convert the [Penn Discourse TreeBank (PDTB)](http://www.seas.upenn.edu/~pdtb/) version 2.0 into XML format. Thus more linguistic annotations could be added to PDTB by adding XML elements or attributes and queries could be performed by using [XQuery](http://en.wikipedia.org/wiki/XQuery).

You can have a view of the generated XML structures in this [picture](http://pdtb-xml.googlecode.com/svn/trunk/mm/PDTB-XML.png). Note PDTB-XML is created as a supplement of PDTB, rather than replacement. It still lacks some fundamental functionalities PDTB API support.

The following tools are needed to use this toolset:
  * [Java](http://www.java.com) 1.5 or higher.
  * [xsltproc](http://xmlsoft.org/XSLT/xsltproc2.html) to process XSLT stylesheet. It comes with the [libxslt](http://www.xmlsoft.org/XSLT/) package.
  * [xmllint](http://xmlsoft.org/) to do XML validation. It comes with the _libxml2-utils_ package.
  * [Perl](http://www.perl.org).

Also, the [PDTB v2.0 corpus](http://www.ldc.upenn.edu/Catalog/CatalogEntry.jsp?catalogId=LDC2008T05) is a must.

This toolset borrows some codes from [TIGERSearch](http://www.ims.uni-stuttgart.de/projekte/TIGER/TIGERSearch/) and [PDTB API](http://www.seas.upenn.edu/~pdtb/PDTBAPI/). Thanks to the original authors for sharing their work.

Upcoming updates:

Preparation for release 2.2.0 (date undecided yet):
  * format change: a `<b>` element will be added under the `<tree>` element with the same attributes of `<tree>` (to make search easier)
  * a set of XQuery APIs will be released