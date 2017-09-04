#install nfs server

sudo -S <<< "123456" apt-get update
sudo -S <<< "123456" apt-get install nfs-kernel-server -y

#provide permission
sudo -S <<< "123456" chown nobody:nogroup -R /var/www/html/iimbx

#chnaging permissions
sudo -S <<< "123456" chmod 777 /etc

#appending ip address for sharing
sed -i "10 a \\\n/var/www/html/iimbx/sites/default/files $1(rw,sync,no_subtree_check)" /etc/exports
sudo -S <<< "123456" chmod 755 /etc

#restarting nfs server
sudo -S <<< "123456" systemctl restart nfs-kernel-server