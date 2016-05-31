#!/usr/bin/env /bin/bash

echo "-----------------------------------"
echo "Copy 'apache2-cite-proxy.conf' into place…"
echo ""
echo "    sudo cp /vagrant/scripts/apache2-cite-proxy.conf /etc/apache2/sites-available/cite.conf"
echo ""
sudo cp /vagrant/scripts/apache2-cite-proxy.conf /etc/apache2/sites-available/cite.conf
echo "-----------------------------------"
echo "Activate it…"
echo ""
echo "    sudo a2ensite cite.conf"
echo ""
sudo a2ensite cite.conf
echo "-----------------------------------"
echo "Restart Apache2…"
echo ""
echo "    sudo apachectl restart"
echo ""
sudo apachectl restart
echo ""
echo "(Ignore the warning about 'reliably determine…'.)"
echo ""
echo "You can now access the CTS Service, from the host computer, at http://192.168.33.10/cts."
echo ""
echo "You can have quick access to an (unstyled XML) text-passage at, e.g., http://192.168.33.10/cts-urn/urn:cts:greekLit:tlg0012.tlg001.fuPers:1.1-1.10 ."
echo ""
echo "Done."



