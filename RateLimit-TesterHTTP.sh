# Generate HTTP traffic using cURL

TIME_SLEEP=0
_PATH='login.php'
URL='https://example.com/'
for a in $(seq 1 3); do
	curl -s -o /dev/null -w "$(date '+%Y-%m-%d %H:%M:%S') --- %{response_code} \t($URL$_PATH)\n" $URL$_PATH
  sleep $TIME_SLEEP
done
