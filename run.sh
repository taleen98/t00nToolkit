#!/bin/bash

ip=$1

if [ ! -d "$ip" ]; then 
        mkdir  $ip
fi
if [ ! -d "$ip/nmap" ]; then 
        mkdir $ip/recon
fi

figlet -f slant "T00N ToolKit" | lolcat




echo "+============================================+"
echo "| [+] Scanning $ip with Nmap ...    |"
echo "+============================================+"

nmap -T4 -p- -A $ip >> $ip/recon/nmap.txt


echo""
echo""

echo "+============================================+"
echo "| [+] Scanning $ip With Gobuster ...|"
echo "+============================================+"

gobuster dir -u http://$ip/ -w /usr/share/wordlists/dirb/common.txt >> $ip/recon/gobuster.txt 

echo""
echo""


echo "+============================================+"
echo "| [+] Scanning Vulns Using Nikto ...         |"
echo "+============================================+"

nikto -h http://$ip >> $ip/recon/nikto.txt




echo""
echo""



echo "+============================================+"
echo "| [+] Scanning $ip With Dirb ...    |"
echo "+============================================+"

dirb http://$ip/ >> $ip/recon/dirb.txt


