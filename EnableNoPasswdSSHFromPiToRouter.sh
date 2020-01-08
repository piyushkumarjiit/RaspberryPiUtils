#!/bin/bash
#Setting up Public key based login to DD-WRT router

#Steps to generate Key for Raspberry Pi
cd ~
mkdir .ssh
cd .ssh
#Create the file to store geenrated key
touch authorized_keys
#Set right permissions on files to prevent unauthorized access to key
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

#Follow the prompts to generate the key. I did not rename my keys and did not specify any password
ssh-keygen

#Copy the Public key generated in previous step to authorized keys file
cat id_rsa.pub >> authorized_keys
read -p "Are you configuring SSH for a Router (Yes/No): " ServerType
if [[ $ServerType == "No"]]
then
	#Ask user to provide ServerIP
	read -p "Please provide server IP address: " ServerIP
	#Ask user to provide Server SSH Port
	read -p "Please provide SSH Port used by Server: " ServerPort
	#Ask user to provide Username to connect to Server
	read -p "Please provide Username to connect to the Server: " UserName
	if [[ ( -n $ServerIP) && ( -n $ServerPort) && ( -n $UserName) ]]
	then
		echo "Trying to connect to the server. Enter password when prompted."
		ssh-copy-id $UserName@$ServerIP -p$ServerPort
	else
		echo "details missing. Try again."
	fi
else
	#cp /home/pi/.ssh/id_rsa.pub /home/pi/k.txt
	echo "Open the file present in your home directory."
	sleep 2
	echo "Copy the entire content of the file."
	sleep 2
	echo "Login to your Router."
	sleep 2
	echo "Go to Authorized Key config in your Router Admin page."
	sleep 2
	echo "Paste copied content inside the Key box on Admin page of your router."
	sleep 2
	echo "Hit apply on your Routers Admin page."
	#rm /home/pi/k.txt
fi
echo "Script complete. Exiting."
#Try to ssh to your router. If everything worked as expected, you would login without any issue.
#ssh -p $ServerPort $UserName@$ServerIP
