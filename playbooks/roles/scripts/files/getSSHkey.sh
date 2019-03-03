#!/bin/bash

system=$1

if [ $? -lt 1 ]; then 
	echo "Usage: getSSHkey.sh <server|service>"
	echo "------------------------------------"
	echo "Exiting..."
	exit
fi

aws ssm get-parameter --name "/wickestest03/privatekey/${system}" --with-decryption --region eu-west-1 | jq .Parameter.Value \
	sed -e 's/\\n/\n/g' | sed -e 's/"//g' > "/tmp/${system}.pem" | chmod 400 "/tmp/${system}.pem"

echo "PEM available at /tmp/${system}.pem"
