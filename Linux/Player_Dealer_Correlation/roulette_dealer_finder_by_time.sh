#!/bin/bash

# The script needs a minimum of two arguments to run correctly.
# First argument is the four digit month and day to query from the MMDD_Dealer_schedule files formated as MMDD.
# Second argument is the time formated as HH:MM:SS.
# Thrid argument is AM or PM and is an optional argument. Not using it will list all both AM And PM schedules.
# Usage: $ sh roulette_dealer_finder_by_time.sh <MMDD> <HH:MM:SS> <AM/PM>
# The dealer schedule is queried per the input arguments previously listed and dealer schedued for that time is output is printed to the screen.
# Author: Steven Bauer

grep -i $2' '$3 $1_Dealer_schedule | awk -F " " '{print $1, $2, $5, $6}'
