#!/bin/bash

network=$(ip r | grep "scope link" | awk '{print $1}')
if [ -z "$network" ]
then 
        echo -e "\e[31mNetwork not found\e[0m"
        exit
fi
echo "scanning network: $network"
if ! command -v nmap &> /dev/null
then
echo -e "\e[31mnmap is not installed\e[0m"
exit
fi
nmap -F  $network
