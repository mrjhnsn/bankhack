#!/bin/bash

## This is a script to simulate connecting to the Swift Banking Network and processing a fake wire transfer.
## Inspired by Hollywood, and designed to be used in conjunction with similar "hacker" simulations on TV.

## Requirements: 
# curl
# dialog

## Here we use Curl to initiate a connection to swift.com for a somewhat legitimate connection.


echo "Connecting to Swift Network at 149.134.177.224........."
sleep 2s
curl -vv https://swift.com/

sleep 1.5s

## Greeting Page confirming connection

dialog --infobox '============ You are now CONNECTED to SWIFT MTN ==============' 5 80

sleep 3s
if (dialog --title "============ Connected to SWIFT MTN ==============" --yesno "Initate wire transfer?" 6 80) then
    echo "You chose Yes. Exit status was $?."
else
    echo "You chose No. Exit status was $?."
fi

## Money Transfer Amount to be simulated.


transferAmount=$(dialog --title "============ Connected to SWIFT MTN ==============" --inputbox "Amount to transfer:" 6 80 3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then
    dialog --title "============ Connected to SWIFT MTN ==============" --infobox "You are transferring:"$transferAmount 6 80   
else
    echo "You chose to Cancel."
fi
sleep 1s

## Source Account Routing number (does not need to be a valid routing number, type whatever you want here)

routingNumber1=$(dialog --title "============ Connected to SWIFT MTN ==============" --inputbox "Source Bank Routing Number:" 6 80 3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then
    dialog --title "============ Connected to SWIFT MTN ==============" --infobox "Source Bank Routing Confirmed:"$routingNumber1 6 80  
else
    echo "You chose to Cancel."
fi
sleep 1s

## Source Account Number (does not need to be a valid account number, type whatever you want here)

accountNumber1=$(dialog --title "============ Connected to SWIFT MTN ==============" --inputbox "Source Account Number:" 6 80 3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then
    dialog --title "============ Connected to SWIFT MTN ==============" --infobox "Source Account Confirmed:"$accountNumber1 6 80 
else
    echo "You chose to Cancel."
fi
sleep 1s
## Destination Account Routing number (does not need to be a valid routing number, type whatever you want here)

routingNumber2=$(dialog --title "============ Connected to SWIFT MTN ==============" --inputbox "Destination Bank Routing Number:" 6 80 3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then
    dialog --title "============ Connected to SWIFT MTN ==============" --infobox "Destination Bank:"$routingNumber2 6 80    
else
    echo "You chose to Cancel."
fi
sleep 1s
## Destination Account number (does not need to be a valid account number, type whatever you want here)

accountNumber2=$(dialog --title "============ Connected to SWIFT MTN ==============" --inputbox "Destination Account Number:" 6 80 3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then
    dialog --title "============ Connected to SWIFT MTN ==============" --infobox "Destination Account Confirmed:"$accountNumber2 6 80 
else
    echo "You chose to Cancel."
fi
sleep 1s

## Progress bar showing transfer in progress 


for i in $(seq 1 100)
do
    sleep 0.1 
    echo $i
done | dialog --title "====== SWIFT wire transfer in progress ======" --gauge "Transferring: "$transferAmount" from "$accountNumber1"---------------> "$accountNumber2 6 80 0

## Confirmation of money transferred. 

sleep 1s
dialog --title "============ Connected to SWIFT MTN ==============" --infobox "Transfer of '$transferAmount' from '$accountNumber1' to '$accountNumber2' successfully completed." 3 80
sleep 3s
dialog --title "============ Connected to SWIFT MTN ==============" --infobox "Disconnecting.... Have a nice day. Hack the planet." 3 60
sleep 2s

reset

echo 'Disconnected.'

## And we are done. Have fun, and happy Hollywood hacking.