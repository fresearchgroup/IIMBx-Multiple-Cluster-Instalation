
#update and install haproxy
sudo -S <<< "123456" apt-get update
sudo -S <<< "123456" apt-get install haproxy -y

#chnage the permission of default
sudo -S <<< "123456" chmod 777 -R /etc/default

#add ENABLE =1 on line no. 8
sed -i '8 a ENABLED = 1' /etc/default/haproxy

#change the permission of default again
sudo -S <<< "123456" chmod 755 -R /etc/default

#changing the permission for haproxy directory
sudo -S <<< "123456" chmod 777 -R /etc/haproxy

#appending the line at the end of the file proving line no. as parameter. For eg- following first sed command will append the text on line no. 35
sed -i '35 a \\n #frontend haproxy_in' /etc/haproxy/haproxy.cfg
sed -i '36 a frontend http_front' /etc/haproxy/haproxy.cfg
sed -i '37 a \\t bind *:80' /etc/haproxy/haproxy.cfg
sed -i '38 a \\t default_backend http_back' /etc/haproxy/haproxy.cfg
sed -i '39 a \\n #backend haproxy_http' /etc/haproxy/haproxy.cfg
sed -i '40 a backend http_back' /etc/haproxy/haproxy.cfg
sed -i '41 a \\t balance roundrobin' /etc/haproxy/haproxy.cfg
sed -i '42 a \\t mode http' /etc/haproxy/haproxy.cfg
sed -i '43 a \\t server vm1 10.129.26.103:80 check' /etc/haproxy/haproxy.cfg
sed -i '44 a \\t server vm2 10.129.28.102:80 check' /etc/haproxy/haproxy.cfg

#changing to default permissions again
sudo -S <<< "123456" chmod 755 -R /etc/haproxy



#restart the haproxy again
sudo -S <<< "123456" sudo /etc/init.d/haproxy restart