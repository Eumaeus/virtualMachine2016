#!/usr/bin/env /bin/bash

echo "-----------------------------------"
echo "Navigating to where Gradle/Fuseki stores data files, specifically the 'cts' data…"
echo ""

cd /vagrant/cs2/fuseki/fusekibase/databases/cts

echo "-----------------------------------"
echo "Removing anything there, since we are loading new data…"
echo ""

rm *
echo "-----------------------------------"
echo "We have a file 'cts-demo.ttl', built with CITE-Manager."
echo "We will add additional RDF, expressing an experimental 'aligned translation' of the Aeneid."
echo "We are using 'cat' to combine cts-demo.ttl with the files in cts-demo-corpus/TTL-RDF/. The new .ttl file will be 'cts-all.ttl'."
echo ""

cat /vagrant/data/cts-demo.ttl /vagrant/cts-demo-corpus/TTL-RDF/phi0690-phi003-alignedEng-RDF.ttl /vagrant/cts-demo-corpus/TTL-RDF/tlg0012-tlg001-fuEng-RDF.ttl > /vagrant/data/cts-all.ttl

echo ""
echo "-----------------------------------"
echo "Using the 'tdbloader2' utility from Apache Jena to load our 'cts-all.ttl' file into a TDB Database…"
echo ""

/usr/bin/jena/bin/tdbloader2 --loc /vagrant/cs2/fuseki/fusekibase/databases/cts /vagrant/data/cts-all.ttl

echo "-----------------------------------"
echo "Doing the same for CITE Collection data and CITE Image data."

echo ""
echo "-----------------------------------"

cd /vagrant/cs2/fuseki/fusekibase/databases/cc
rm *
cat /vagrant/data/collections.ttl /vagrant/data/cite-imgs.ttl > /vagrant/data/cc_plus_imgs.ttl
/usr/bin/jena/bin/tdbloader2 --loc /vagrant/cs2/fuseki/fusekibase/databases/cc /vagrant/data/cc_plus_imgs.ttl

cd /vagrant/cs2/fuseki/fusekibase/databases/img
rm *
/usr/bin/jena/bin/tdbloader2 --loc /vagrant/cs2/fuseki/fusekibase/databases/img /vagrant/data/cc_plus_imgs.ttl

echo "-----------------------------------"
echo "Copying collection inventory into place"

mkdir /vagrant/cs2/sparqlcc/src/main/webapp/invs
cp /vagrant/cite_test_ttl/testsuite/collections/collections.xml /vagrant/cs2/sparqlcc/src/main/webapp/invs/inventory.xml





echo "-----------------------------------"
echo "Done!"
