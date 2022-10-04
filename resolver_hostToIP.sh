# Input file: domains
# Resolves host to IP from an input file of hosts

INPUT_FILE=$1
RECURSIVE_DNS=$1.RECURSIVE_DNS
for line in $(cat $INPUT_FILE | sed 's/.*:\/\///' ); do echo $line && nslookup $line | grep Address | grep -v 'Address:	' && echo ; done
