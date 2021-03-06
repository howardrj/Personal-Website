echo "Stopping nginx ..."
systemctl stop nginx
echo "Stopped nginx"

echo "Renewing certificates ..."
/var/www/letsencrypt/letsencrypt-auto --server https://acme-v01.api.letsencrypt.org/directory --standalone --expand -d robbie-howard.com -d www.robbie-howard.com certonly

if [ $? -ne 0 ]
then
    echo "Successfully renewed certificates"
else
    echo "ERROR: Failed to renew certificates"
fi

echo "Restarting nginx ..."
systemctl restart nginx
echo "Restarted nginx"
