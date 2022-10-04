#!/bin/bash

# Usage: amasser.sh domain.com

# Input: domain name
# get output file from amass domain:ip and other results and only look for domains/subdomains, then probe for 
# response and write a new file
# (The output of amass is > domain ip,ip,ip)
#
# Note: This could be also useful for any input file containing domains/subdomains
#

if [ $# -eq 0 ]
  then
    echo "Usage: $0 example.com"
    exit 1
fi


DOMAIN=$1 # example.com
OUT_FOLDER=$(echo $1 | sed 's/\./ /g' | awk '{print $1}').d
echo $OUT_FOLDER
AMASS_FILE=$DOMAIN.amassenum # amass_outfile.txt (I normally use the format domain.com.amassenum for organization)

mkdir $OUT_FOLDER

# Automatically enumerate with amass
echo '[+] RUnning Amass'
amass enum -r 1.1.1.1,8.8.8.8 -ip -d $DOMAIN | tee $OUT_FOLDER/$AMASS_FILE
echo '[+] RUnning HttProbe'
#
cat $OUT_FOLDER/$AMASS_FILE | grep $DOMAIN | awk '{print $1}' | httprobe | tee $OUT_FOLDER/$AMASS_FILE.httprobed
# Then:
# (Clean http/https probes and sort results)
sleep 1
echo "------------------------------------------------"
cat $OUT_FOLDER/$AMASS_FILE.httprobed | sed 's/http.*:\/\///g' | sort | uniq | tee $OUT_FOLDER/$DOMAIN.amassenum.hosts

# TO-DO: Automate this and use only 1 output file instead of writing a file and reading it agan, 
# then writing another one. 
# But *.httprobed could be useful to see what methods the hosts accept
echo "[+] Files generated:"
echo $OUT_FOLDER/$AMASS_FILE
echo $OUT_FOLDER/$DOMAIN.amassenum.hosts
echo $OUT_FOLDER/$AMASS_FILE.httprobed
