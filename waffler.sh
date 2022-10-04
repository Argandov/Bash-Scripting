# USAGE: script.sh host_list.txt 
# format: domains only

INPUT_FILE=$1
OUTPUT_FILE=$INPUT_FILE.WAF
for domain in $(cat $INPUT_FILE); do wafw00f -a $domain -o - >> $OUTPUT_FILE && echo "\n" >> $OUTPUT_FILE; done
cat $OUTPUT_FILE | grep -Ev '\\n' >> $INPUT_FILE.WAF.Clean

echo "
files created:
\t$OUTPUT_FILE
\t$INPUT_FILE.WAF.Clean
"
