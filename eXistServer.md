#How to use the eXist Database to query in a client-server mode



# Introduction #

[eXist](http://exist.sourceforge.net/) is an open source XML database. It provides functionalities of XQuery/XSLT. It runs in a server mode, so can be deployed across the network and users access the database by http request or a simple GUI querying interface.

As this wiki is written, eXist-1.4-RC1 is used.

# Steps #

## Install and configure eXist ##

Simply follow the [quick start](http://exist.sourceforge.net/quickstart.html) page to install eXist. Then we need to do some configuration against PDTB XML. **The following paths all assume you are now in the eXist installation directory.**

### Disable validation ###

eXist tries to validate all the xml files before building indexes. It validates the XML files against DTD, rather than Xschema. But unfortunately the DTD files PDTB XML provides are not complete (the schema files are complete but sadly eXist doesn't check it). So we have to disable this option.

Edit the file `conf.xml` in the top eXist directory, find the validation option and change the mode to "no":

```
<validation mode="no">
```

### Increase cache size ###

Also in `conf.xml` there's an option for setting the cache size when indexing data. The default is 48M working only for small databases. So we'd better increase it. Simple change the `cacheSize` and `collectionCache` to about 1/3 of available memory:

```
    <db-connection cacheSize="1024M" collectionCache="1024M" database="native"
        files="webapp/WEB-INF/data" pageSize="4096">
```

### Assign Java more memory ###

Since PDTB XML is not of small-size, we should let Java use more memory when executing a query. Edit the file `bin/functions.d/eXist-settings.sh` and change the following two options as your memory permits:

```
set_client_java_options() {
    if [ -z "${CLIENT_JAVA_OPTIONS}" ]; then
    CLIENT_JAVA_OPTIONS="-Xms128m -Xmx4096m -Dfile.encoding=UTF-8";
    fi
    JAVA_OPTIONS="${CLIENT_JAVA_OPTIONS} -Djava.endorsed.dirs=${JAVA_ENDORSED_DIRS}";
}

set_java_options() {
    if [ -z "${JAVA_OPTIONS}" ]; then
    JAVA_OPTIONS="-Xms128m -Xmx4096m -Dfile.encoding=UTF-8";
    fi
    JAVA_OPTIONS="${JAVA_OPTIONS} -Djava.endorsed.dirs=${JAVA_ENDORSED_DIRS}";
}
```

## Build indexes ##

### Start the database ###
First start the database:

```
bin/startup.sh &
```

Now we can access it through a web interface at `http://localhost:8080/exist`. But here we only use a Java client to access the database:

```
bin/client.sh
```

Enter your name and password. Now we are in a GUI. Depending on our user attributes, we can perform different tasks. But here we are the administrator so we can build the indexes for general use.

### Configure indexes ###

The default policy of building indexes doesn't suit PDTB XML very well, so we need to define what we want to index ourselves. Refer to [this page](http://exist.sourceforge.net/indexing.html) if you want to understand what the following codes mean.

Click "File->Create collection" to create a new collection in your panel called "pdtb-xml". Now we could have clicked "Tools->Edit Indexes" to configure the indexes through a GUI as shown below, but since the configuration options are a lot, we won't do that.

![http://pdtb-xml.googlecode.com/svn/wiki/images/eXist_edit_index.png](http://pdtb-xml.googlecode.com/svn/wiki/images/eXist_edit_index.png)

Now double click "system" in your resource panel, then double click "config", then "db", then "pddb-xml", then "File->Store files / directories", there would be a file selection window popping up, change the "Files of Type" option to "All files", and put the following file with the exact name `collection.xconf` there:

```
<collection xmlns="http://exist-db.org/collection-config/1.0">
    <index>
        <fulltext default="none" attributes="false" alphanum="false">
            <create qname="corpus"/>
            <create qname="head"/>
            <create qname="s"/>
            <create qname="graph"/>
            <create qname="tree"/>
            <create qname="terminals"/>
            <create qname="nonterminals"/>
            <create qname="t"/>
            <create qname="nt"/>
            <create qname="edge"/>
            <create qname="b"/>
            <create qname="Relations"/>
            <create qname="Relation"/>
            <create qname="NoRel"/>
            <create qname="Explicit"/>
            <create qname="Implicit"/>
            <create qname="EntRel"/>
            <create qname="AltLex"/>
            <create qname="Arg1"/>
            <create qname="Arg2"/>
            <create qname="TreeRef"/>
            <create qname="tr"/>
            <create qname="Attribution"/>
            <create qname="ConnHead"/>
            <create qname="Connective"/>
            <create qname="Sup1"/>
            <create qname="Sup2"/>
        </fulltext>
        <create qname="@id" type="xs:string"/>
        <create qname="@idref" type="xs:string"/>
        <create qname="RawText" type="xs:string"/>
        <create qname="@pos" type="xs:string"/>
        <create qname="@cat" type="xs:string"/>
        <create qname="@word" type="xs:string"/>
        <create qname="@Source" type="xs:string"/>
        <create qname="@Type" type="xs:string"/>
        <create qname="@Class" type="xs:string"/>
        <create qname="@Polarity" type="xs:string"/>
        <create qname="@Determinacy" type="xs:string"/>
    </index>
</collection>
```

The file `collection.xconf` contains the configuration options for indexing. It will work when we put XML files into the database. After you are done, the paths&file should look like this:

![http://pdtb-xml.googlecode.com/svn/wiki/images/eXist_index.png](http://pdtb-xml.googlecode.com/svn/wiki/images/eXist_index.png)

### Upload files & build indexes ###

Now we should go back to the original resource panel where the folder `pdtb-xml` is in parallel with the folder `system`. Enter `pdtb-xml`, click "File->Store files / directories", navigate to the folder containing all the PDTB XML files, select all the sub directories `00` to `24`. eXist will start uploading the files and building the indexes.

Depending on your machine, the whole process might take 30 minutes to 1 hour. The final index size should be around 1.3 GB. It should be in the directory `eXist-install-dir/webpp/WEB-INF`.

## Query ##

There's a button with a picture of a telescope on the top right of the client window. Clicking it triggers the query window. Paste the following code to the query window:

```
for $r in collection("/db/pdtb-xml")/corpus//Explicit
    return $r
```

Then we have the result:

![http://pdtb-xml.googlecode.com/svn/wiki/images/eXist_query.png](http://pdtb-xml.googlecode.com/svn/wiki/images/eXist_query.png)

# Deploy the database #

Please check [this page](http://exist.sourceforge.net/deployment.html).