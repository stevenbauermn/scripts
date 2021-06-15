#!/bin/bash

# The script needs three arguments to run correctly.
# First arugment is the time formated as HH:MM:SS.
# Second arugment is AM or PM.
# Thrid arugement is the four digit month and day to query from the Dealer_schedule files formated as MMDD.
# Usage: $ sh roulette_dealer_finder_by_time_and_game.sh <HH:MM:SS> <AM/PM> <MMDD>
# The dealer schedule is queried per the arugnts then the time, AM/PM, First Name, Last Name are
# output to the screen for review.
# Author: Steven Bauer

clear
grep -i $1' '$2 $3_Dealer_schedule | awk -F " " '{print "Black Jack dealer: " $3, $4, "| Roulette dealer: " $5, $6, "| Texas Hold EM dealer: " $7, $8, "were all working during the " $1, $2, "shift."}'
