
#update and install haproxy
sudo -S <<< $1 apt-get update
sudo -S <<< $1 apt-get install haproxy -y


#add ENABLE =1 on line no. 8
sudo -S <<< $1 sed -i '9 a ENABLED=1' /etc/default/haproxy

#appending the line at the end of the file proving line no. as parameter. For eg- following first sed command will append the text on line no. 35
sudo -S <<< $1 sed -i '35 a \\n #frontend haproxy_in' /etc/haproxy/haproxy.cfg
sudo -S <<< $1 sed -i '36 a frontend http_front' /etc/haproxy/haproxy.cfg
sudo -S <<< $1 sed -i '37 a \\t bind *:80' /etc/haproxy/haproxy.cfg
sudo -S <<< $1 sed -i '38 a \\t default_backend http_back' /etc/haproxy/haproxy.cfg
sudo -S <<< $1 sed -i '39 a \\n #backend haproxy_http' /etc/haproxy/haproxy.cfg
sudo -S <<< $1 sed -i '40 a backend http_back' /etc/haproxy/haproxy.cfg
sudo -S <<< $1 sed -i '41 a \\t balance roundrobin' /etc/haproxy/haproxy.cfg
sudo -S <<< $1 sed -i '42 a \\t mode http' /etc/haproxy/haproxy.cfg
sudo -S <<< $1 sed -i "43 a \\\t server vm1 $2:80 check" /etc/haproxy/haproxy.cfg
sudo -S <<< $1 sed -i "44 a \\\t server vm2 $3:80 check" /etc/haproxy/haproxy.cfg


#restart the haproxy again
sudo -S <<< $1 sudo /etc/init.d/haproxy restart