#!/bin/bash

AIRPORT="en1"; #may be en0, use networksetup -listallhardwareports to check
WIFI_NETWORK_NAME="MARCOS-PC_Network"
WIFI_PASSWORD="4040756E6963616D7032303132"

while true
do 
	networksetup -setairportpower $AIRPORT off
	networksetup -setairportpower $AIRPORT on
	sleep 10
	 
	networksetup -setairportnetwork $AIRPORT $WIFI_NETWORK_NAME $WIFI_PASSWORD
	sleep 3

	if networksetup -getairportnetwork $AIRPORT | grep -i -a $WIFI_NETWORK_NAME ;
	then
	    echo 'Connected!';
		say "Back online!";

	    exit 0
	else
		echo 'Connection failed!';
		sleep 7
	fi 
done
