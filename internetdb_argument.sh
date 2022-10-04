# Checks first argument's (IP) information with Internet DB

curl -X 'GET' \
  'https://internetdb.shodan.io/'$1 \
  -H 'accept: application/json'
