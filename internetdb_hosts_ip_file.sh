# Checks an input file with domains & IPs with Internet DB

# INPUT FILE WITH IPs @ $1
# INPUT FILE FORMAT example:
# domain ip ip ip
# (It is designed to read amass outfiles with IP)

INPUT_FILE=$1
OUTFILE=$INPUT_FILE.internetdb.json

for IP in $(awk '{print $2}' $INPUT_FILE | sed 's/,/ /g' | awk '{print $1}'); do sh internetdb_argument.sh $IP >> $OUTFILE; done
