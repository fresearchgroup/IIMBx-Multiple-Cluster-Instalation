export DEBIAN_FRONTEND="noninteractive"

sudo -S <<< "123456" debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
sudo -S <<< "123456" debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"

sudo -S <<< "123456" apt-get install -y mysql-server

echo "Downloaing IIMbx database from Git Lab"
wget http://gitlab.cse.iitb.ac.in/mangeshg/iimbx/blob/589dd9a9511e32545d9b9c65d3a77498c89de7fd/iimbx_21082017.sql

echo "Creating a iimbx database"
mysql -uroot -proot -e "CREATE DATABASE iimbx ;"

echo "Importing the database on Mysql server"
mysql -u root -proot iimbx < iimbx_*.sql