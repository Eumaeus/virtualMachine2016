#!/usr/bin/env /bin/bash

echo "-----------------------------------"
echo "Navigate to the SparqlCTS project in CS2…"
echo "    cd /vagrant/cs2/sparqlcts"
cd /vagrant/cs2/sparqlcts
echo "-----------------------------------"
echo "Run it."
echo ""
echo "Watch the command-line. The service will take a few moments to start up. You will know it is ready when you see:"
echo "   'Press any key to stop the server'"
echo "(which is not true; type control-c to stop the server)."
echo ""
echo "In your host computer, go to http://localhost:9090/sparqlcts to interact with CTS."
echo ""
read -p "Press [ENTER] to start the server. Stop it with control-c."
echo "  gradle farmRun"
gradle farmRun
echo "-----------------------------------"
echo "The server is stopped."



