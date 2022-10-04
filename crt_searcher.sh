DOMAIN=$1

# Search in crt.sh (https://crt.sh/), and prepares the URL with specified domain, then gets crt.sh' API output,
# "curate" the output and sort/uniq its contents. Useful for very quick Subdomain enumeration

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"; exit
fi

curl -s https://crt.sh/\?q\=\%.$DOMAIN\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u
