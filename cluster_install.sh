nfs_client_ip = 10.129.26.25
nfs_server_ip = 10.129.26.77

#example ip address
#mysql = 10.129.46.102
#web 1 = 10.129.26.25
#web 2 = 10.129.26.77
#haproxy = 10.129.28.120


#!/bin/bash
#install sshpass for accessing remote by providing password as an argument
sudo -S <<< "123456" apt-get install sshpass

#Mysql 
#Copy the script to be executed on the server
sshpass -p "123456" scp mysql.sh edx@10.129.46.102:~/ 

#Execute the script which you just copied on the server
sshpass -p "123456" ssh edx@10.129.46.102 /home/edx/mysql.sh

#Copy the script to web 1
sshpass -p "123456" scp web.sh edx@10.129.26.25:~/ 

#Execute the script on web 1
sshpass -p "123456" ssh edx@10.129.26.25 /home/edx/web.sh

#Copy the script to web 2
sshpass -p "123456" scp web.sh edx@10.129.26.77:~/ 

#Execute the script on web 2
sshpass -p "123456" ssh edx@10.129.26.77 /home/edx/web.sh


#Copy the script to nfs server
sshpass -p "123456" scp nfs_server.sh edx@10.129.26.77:~/ 

#Execute the script in nfs server 
sshpass -p "123456" ssh edx@10.129.26.77 /home/edx/nfs_server.sh $nfs_client_ip

#Copy the script to nfs client
sshpass -p "123456" scp nfs_client.sh edx@10.129.26.25:~/ 

#Execute the script on nfs client 
sshpass -p "123456" ssh edx@10.129.26.25 /home/edx/nfs_client.sh $nfs_server_ip