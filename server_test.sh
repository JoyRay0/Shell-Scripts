#!/bin/bash

URL="https://rksoftwares.fun/All_app/Daraz_clone/Api/products.json"

#read -r REQUESTS

REQUESTS=200

echo "================================================"

echo "          Server health checking"

echo "================================================"

# Make sure bc exists
if ! command -v bc &> /dev/null
then
    echo "bc not installed. Installing..."
    sudo apt install -y bc
fi

echo "  "
echo "CPU usages : "
top -bn1 | grep "Cpu(s)"

echo "  "
echo "Memory usages : "
free -h

echo "  "
echo "Disk usages : "
df -h /

echo "  "
echo "Load Average : "
uptime

echo "  "
echo "Top 5 memory process :"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6

sleep 1

echo "  "
echo "=============================================="

echo "          LATENCY TEST (10 Request)"

echo "=============================================="

for i in {1..50}
do

    echo "Request $i"
     time curl -s -o /dev/null $URL
     echo "  "

done

sleep 1


echo "  "
echo "=============================================="

echo "          RPS TEST START"

echo "=============================================="


start=$(date +%s.%N)

for i in $(seq 1 $REQUESTS)
do
    curl -s -o /dev/null "$URL" &

done

wait

end=$(date +%s.%N)

runtime=$(echo "$end - $start" | bc)
rps=$(echo "$REQUESTS / $runtime" | bc)

echo "Total Requests: $REQUESTS"
echo "Time Taken: $runtime seconds"
echo "Approx RPS: $rps req/sec"

echo "======================================="

echo "              TEST FINISHED"

echo "======================================="
