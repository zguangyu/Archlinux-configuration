#!/bin/dash -f 
wmiir read /rbar/b_usage > /dev/null
if [ $? -eq 0 ]; then
       exit 0
fi       
echo '' | wmiir create /rbar/b_usage
while [ 1 -lt 2 ]; do
	echo -n label "$(/home/shui/cpuu)" | wmiir write /rbar/b_usage
	if [ $? -ne 0 ]; then
		exit 0
	fi
	sleep 4
done

