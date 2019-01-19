#!/bin/bash

# Gets:
#	- Number of processes to run in parallel.

# check if the script is already running.
if [ $(ps -ef | grep "ops_school.sh" | grep -v grep | wc -l) -gt 2 ]; then
	echo -e "The ops_school.sh script is already running."
	exit 1
fi

# Delete old stats file if exists.
rm -f /tmp/ops.stats

# Run parallel processes.
for ((run=1; run<=$1; run++)) do
	 sleep $(shuf -i 1-20 -n 1) && echo $(date) $BASHPID && echo "$?" >> /tmp/ops.stats &
done

wait

echo "$(cat /tmp/ops.stats | grep ^0$ | wc -l) processes completed successfully."
echo "$(cat /tmp/ops.stats | grep -v ^0$ | wc -l) processes failed to complete."
