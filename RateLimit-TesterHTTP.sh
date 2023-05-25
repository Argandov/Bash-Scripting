# Generate HTTP traffic using cURL

# This will generate normal GET requests to $URL + $_PATH, with $TIME_SLEEP intervals
# Change the number of requests by modifying the seq parameter

TIME_SLEEP=0
_PATH='login.php'
URL='https://example.com/'

for a in $(seq 1 10); do
	curl -s -o /dev/null -w "$(date '+%Y-%m-%d %H:%M:%S') --- %{response_code} \t($URL$_PATH)\n" $URL$_PATH
  sleep $TIME_SLEEP
done
