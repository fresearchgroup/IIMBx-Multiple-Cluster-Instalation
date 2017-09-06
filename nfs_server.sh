#install nfs server

sudo -S <<< $1 apt-get update
sudo -S <<< $1 apt-get install nfs-kernel-server -y

#provide permission
sudo -S <<< $1 chown nobody:nogroup -R /var/www/html/iimbx


#appending ip address for sharing
sudo -S <<< $1 sed -i "10 a \\\n/var/www/html/iimbx/sites/default/files $2(rw,sync,no_subtree_check)" /etc/exports


#restarting nfs server
sudo -S <<< $1 systemctl restart nfs-kernel-server