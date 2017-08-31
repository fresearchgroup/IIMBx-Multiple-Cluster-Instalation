#!/bin/bash
#install sshpass for accessing remote by providing password as an argument
sudo -S <<< apt-get install sshpass

#Mysql
#Copy the script to be executed on the server
sshpass -p "123456" scp mysql.sh frg@10.129.46.102:~/ 

#Execute the script which you just copied on the server
sshpass -p "123456" ssh frg@10.129.46.102 /home/frg/mysql.sh
