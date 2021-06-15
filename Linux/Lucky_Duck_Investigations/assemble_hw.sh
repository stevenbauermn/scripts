#!/bin/bash

# This script copies all the files for homework zips it and readies it to be submitted.
# Usage: $sh assemble_hw.sh
# Author: Steven Bauer

cp '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/Notes_Dealer_Analysis' '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/'
cp '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis/Notes_Player_Analysis' '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/' 
cp '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis/Roulette_Losses_Raw' '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/'
cp '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis/Roulette_Losses' '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/'
cp '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/Dealers_working_during_losses' '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/'
cp '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/dealer_0310_0500.sh' '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/'
cp '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/dealer_0310_0800.sh' '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/'
cp '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/dealer_0310_1400.sh' '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/'
cp '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/dealer_0310_2000.sh' '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/'
cp '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/dealer_0310_2300.sh' '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/'
cp '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/dealer_0312_0500.sh' '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/'
cp '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/dealer_0312_0800.sh' '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/'
cp '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/dealer_0312_1400.sh' '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/'
cp '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/dealer_0312_2000.sh' '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/'
cp '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/dealer_0312_2300.sh' '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/'
cp '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/dealer_0315_0500.sh' '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/'
cp '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/dealer_0315_0800.sh' '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/'
cp '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/dealer_0315_1400.sh' '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/'
cp '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/roulette_dealer_finder_by_time.sh' '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/'
cp '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/roulette_dealer_finder_by_time_and_game.sh' '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/'
cp '/home/sysadmin/Lucky_Duck_Investigations/assemble_hw.sh' '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/'
cd '/home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/'
zip -r Player_Dealer_Correlation.zip 'Player_Dealer_Correlation'
mv Player_Dealer_Correlation.zip '/home/sysadmin/Lucky_Duck_Investigations/'
