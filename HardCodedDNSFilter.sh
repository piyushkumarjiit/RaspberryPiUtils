#!/bin/bash
exec &>> /home/pi/piCron-log.txt
echo "Running cron-job HardCodedDNSFilter on $(date)"
#Get IP Address of your PiHole
PiHoleIP=$(hostname -I)
#PiHoleIP='<yourPiHoleIP>'

#Check if PiHole is getting all requests including harcoded ones
## Figure out how to do this

#Assuming your default gateway is your DD-WRT router, get the IP of your router
RouterIP=$(ip r | awk '/default via/ {print $3}')
#Port at which Router is running SSH service
RouterPort='8022'

#Connect to your DD-WRT router via SSH. Assuming you have set up key based SSH login
#You can execute/follow other script to get this to work
echo "Calling shell script to update Pre Routing on Router with Router IP:$RouterIP and Port:$RouterPort for PiHole IP:$PiHoleIP"
ssh admin@$RouterIP -p$RouterPort 'sh -s' < /home/pi/PreRoutingForPi.sh $PiHoleIP
echo "Processing complete"
