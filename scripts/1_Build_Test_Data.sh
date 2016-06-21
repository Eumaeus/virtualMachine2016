#!/usr/bin/env /bin/bash

echo "-----------------------------------"
echo "Navigating to the citemgr directory…"
echo ""

cd /vagrant/citemgr

echo "-----------------------------------"
echo "Copying the configuration file for bulding the CTS Test Data here…"
echo ""

cp /vagrant/scripts/citemgr-cts-test.gradle .

echo "-----------------------------------"
echo "Running the 'clean' task to prepare Gradle…"
echo ""

gradle clean

echo "-----------------------------------"
echo "Running the CITE Manager 'ctsttl' task in Gradle to process the XML files, using a TextInventory and Citaition Config file, into tabular representations of texts, and then into a single '.ttl' file expressing the corpus as RDF statement. This will take some time."
echo ""
echo "The file 'citemgr-cts-test.gradle' directs CITE Manager to the proper TextInventory, CitationConfig, and directory containing XML texts."
echo ""

gradle -Pproj=citemgr-cts-test.gradle projects:ctsttl

echo "-----------------------------------"
echo "Copying the resulting file, 'cts.tll', into 'vagrant/data/' as 'cts-test.ttl', for safekeeping."
echo ""

cp /vagrant/citemgr/projects/build/ttl/cts.ttl /vagrant/data/cts-test.ttl

echo "-----------------------------------"
echo "Moving the TextInventory file cataloging this test data into place."
echo ""

cp /vagrant/cite_test_ttl/testsuite/textcorpus/testinventory.xml /vagrant/cs2/sparqlcts/src/main/webapp/invs/inventory-test.xml

echo "-----------------------------------"
echo "Done!"
