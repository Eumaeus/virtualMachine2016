#!/usr/bin/env /bin/bash

echo "-----------------------------------"
echo "Navigate to the citemgr directory…"
echo ""
echo "   cd /vagrant/citemgr"
echo ""
cd /vagrant/citemgr
echo "-----------------------------------"
echo "Copy the configuration file for bulding the CTS Test Data here…"
echo ""
echo "   cp /vagrant/scripts/citemgr-cts-test.gradle ."
echo ""
cp /vagrant/scripts/citemgr-cts-test.gradle .
echo "-----------------------------------"
echo "Run the 'clean' task to prepare Gradle…"
echo ""
echo "   gradle clean"
echo ""
gradle clean
echo "-----------------------------------"
echo "Run the CITE Manager 'ctsttl' task in Gradle to process the XML files, using a TextInventory and Citaition Config file, into tabular representations of texts, and then into a single '.ttl' file expressing the corpus as RDF statement. This will take some time."
echo ""
echo "The file 'citemgr-cts-test.gradle' directs CITE Manager to the proper TextInventory, CitationConfig, and directory containing XML texts."
echo ""
echo "   gradle -Pproj=citemgr-cts-test.gradle projects:ctsttl"
echo ""
gradle -Pproj=citemgr-cts-test.gradle projects:ctsttl
echo "-----------------------------------"
echo "Copy the resulting file, 'corpus.tll', into 'vagrant/data/' as 'cts-test.ttl', for safekeeping."
echo ""
echo "   cp /vagrant/citemgr/projects/build/ttl/corpus.ttl /vagrant/data/cts-test.ttl"
echo ""
cp /vagrant/citemgr/projects/build/ttl/corpus.ttl /vagrant/data/cts-test.ttl
echo "-----------------------------------"
echo "Move the TextInventory file cataloging this test data into place."
echo ""
echo "   cp /vagrant/cite_test_ttl/testsuite/textcorpus/testinventory.xml /vagrant/cs2/sparqlcts/src/main/webapp/invs/inventory-test.xml"
echo ""
cp /vagrant/cite_test_ttl/testsuite/textcorpus/testinventory.xml /vagrant/cs2/sparqlcts/src/main/webapp/invs/inventory-test.xml
echo "-----------------------------------"
echo "Done!"