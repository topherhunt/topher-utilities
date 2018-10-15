# TODO: Optional argument for the # of seconds to sleep
while [ true ]
do
  output=$(ping -c1 google.com | head -n2 | tr -d '\n')
  echo "$(date) $output"
  echo "$(date) $output" >> ~/pings.txt
  sleep 3
done
