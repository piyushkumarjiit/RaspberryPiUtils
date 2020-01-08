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

#Open the authorized key file (or copy the contents of Public key generated in previous step) and paste inside the Key box on Admin page of your router


# Hit apply on your Routers Admin page

#Try to ssh to your router. If everything worked as expected, you woudl login without any issue.
