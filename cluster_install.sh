#provide the nfs ip adress. It will be on of the two ip addresses of Web servers where drupal will be installed
web1=10.129.26.25
web2=10.129.26.77

#assuming that all machine have same user name .eg:- edx 

#assuming that all machines have same password 
password=123456


#!/bin/bash
#install sshpass for accessing remote by providing password as an argument
sudo -S <<< "$password" apt-get install sshpass

#Provide the ip address of Mysql 
#Copy the script to be executed on mysql server
sshpass -p "$password" scp mysql.sh edx@10.129.46.102:~/ 

#run the script  on mysql server.
sshpass -p "$password" ssh edx@10.129.46.102 /home/edx/mysql.sh $password

#Copy the script to web 1
sshpass -p "$password" scp web.sh edx@10.129.26.25:~/ 

#Execute the script on web 1
sshpass -p "$password" ssh edx@10.129.26.25 /home/edx/web.sh $password

#Copy the script to web 2
sshpass -p "$password" scp web.sh edx@10.129.26.77:~/ 

#Execute the script on web 2
sshpass -p "$password" ssh edx@10.129.26.77 /home/edx/web.sh $password

#Copy the script to haproxy server
sshpass -p "$password" scp haproxy.sh edx@10.129.28.120:~/ 

#Execute the script on haproxy server
sshpass -p "$password" ssh edx@10.129.28.120 /home/edx/haproxy.sh $password $web1 $web2


#Copy the script to nfs server
sshpass -p "$password" scp nfs_server.sh edx@10.129.26.77:~/ 

#Execute the script in nfs server 
sshpass -p "$password" ssh edx@10.129.26.77 /home/edx/nfs_server.sh $password $web2

#Copy the script to nfs client
sshpass -p "$password" scp nfs_client.sh edx@10.129.26.25:~/ 

#Execute the script on nfs client 
sshpass -p "$password" ssh edx@10.129.26.25 /home/edx/nfs_client.sh $password $web1