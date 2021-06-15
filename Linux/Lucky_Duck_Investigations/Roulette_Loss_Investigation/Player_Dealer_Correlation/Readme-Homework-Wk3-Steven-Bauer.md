## Week 3 Homework: A High Stakes Investigation

Hello, 

I have placed the commands I ran within this readme for reference on how I completed my homework, assembled it and zipped it. 

Make it a great day!

Steven Bauer

### Scenario

You have just been hired by Lucky Duck Casino as a security analyst.

 - Lucky Duck has lost a significant amount of money on the roulette tables over the last month.
 - The largest losses occurred on March 10, 12, and 15.
 - Your manager believes there is a player working with a Lucky Duck dealer to steal money at the roulette tables.
 - The casino has a large database with data on wins and losses, player analysis, and dealer schedules.
- You are tasked with navigating, modifying, and analyzing these data files to gather evidence on the rogue player and dealer.
 - You will prepare several evidence files to assist the prosecution.
 - You must work quickly as Lucky Duck can't afford any more losses.
Lucky Duck Casino has provided you with the following files if required:

  - [Roulette Player Data: Week of March 10](Resources/Roulette_Player_WinLoss_0310.zip)
  - [Employee Dealer Schedule: Week of March 10](Resources/Dealer_Schedules_0310.zip)

**Note**: The instructions ask you to set up the files using a `wget` command, but the files are also provided in compressed zip format if the command does not work.

### Lab Environment

- You will use your local Vagrant virtual machine for today's activities. Please note that instructors and students have different access credentials.
    - Username: `sysadmin`
    - Password: `cybersecurity`

### Instructions 

Use your command-line skills to uncover the identities of the rogue casino player and dealer colluding to scam Lucky Duck out of thousands of dollars. 

After your investigation, you will provide a summary of your findings to the casino. 

#### Step 1: Investigation Preparation

Your first task is to set up directories to prepare for your investigation.

1. Begin by making a single directory titled `Lucky_Duck_Investigations`.

`mkdir Lucky_Duck_Investigations`

2. In this directory, create a directory for this specific investigation titled `Roulette_Loss_Investigation`.

`cd Lucky_Duck_Investigations`
`mkdir Roulette_Loss_Investigation`

3. In `Roulette_Loss_Investigation`, create the following directories:

    - `Player_Analysis` to investigate the casino player.

`mkdir Player_Analysis`

    - `Dealer_Analysis` to investigate the dealers.

`mkdir Dealer_Analysis`

    - `Player_Dealer_Correlation` to summarize your findings of the collusion.

`mkdir Player_Dealer_Correlation`

4. Create empty files called `Notes_<Directory Name>` under each subdirectory to store investigation notes.

    - For example: `Notes_Player_Analysis`

`touch ./Player_Analysis/Notes_Player_Analysis`
`touch ./Dealer_Analysis/Notes_Dealer_Analysis`
`touch ./Player_Dealer_Correlation/Notes_Player_Dealer_Correlation1`

#### Step 2: Gathering Evidence

Your next task is to move evidence from the specific days that Lucky Duck experienced heavy losses at the roulette tables.

1. Navigate to the directory where you created the `Lucky_Duck_Investigations` directory and run the following command to set up the evidence files:

`cd ~/Lucky_Duck_Investigations/`

`wget "https://tinyurl.com/3-HW-setup-evidence" && chmod +x ./3-HW-setup-evidence && ./3-HW-setup-evidence`

   After running this command your current directory should have the following subdirectories:

    - `Dealer_Schedules_0310`: Contains the dealer schedules.
    - `Lucky_Duck_Investigations`: Contains the investigation directories and notes files you created.
    - `Roulette_Player_WinLoss_0310`: Contains the data for player wins and losses.

2. The `Dealer_Schedules_0310` and `Roulette_Player_WinLoss_0310` directories contain the dealer schedules and win/loss player data from the roulette tables during the week of March 10.

     -  Since the losses occurred on March 10, 12, and 15, move the schedules for those days into the directory `Dealer_Analysis`.

`cp ./Dealer_Schedules_0310/0310_Dealer_schedule ./Roulette_Loss_Investigation/Dealer_Analysis/0310_Dealer_schedule`
`cp ./Dealer_Schedules_0310/0312_Dealer_schedule ./Roulette_Loss_Investigation/Dealer_Analysis/0312_Dealer_schedule`
`cp ./Dealer_Schedules_0310/0315_Dealer_schedule ./Roulette_Loss_Investigation/Dealer_Analysis/0315_Dealer_schedule`
     
    - Move the files for those days into the directory `Player_Analysis`.

` cp ./Roulette_Player_WinLoss_0310/0310_win_loss_player_data ./Roulette_Loss_Investigation/Player_Analysis/0310_win_loss_player_data`
` cp ./Roulette_Player_WinLoss_0310/0312_win_loss_player_data ./Roulette_Loss_Investigation/Player_Analysis/0312_win_loss_player_data`
` cp ./Roulette_Player_WinLoss_0310/0315_win_loss_player_data ./Roulette_Loss_Investigation/Player_Analysis/0315_win_loss_player_data`

#### Step 3: Correlating the Evidence

Your next task is to correlate the large losses from the roulette tables with the dealer schedule. This will help you determine which dealer and player are colluding to steal money from Lucky Duck.

  **Note:** Winnings for Lucky Duck Casino are indicated with a positive number and losses are indicated with a negative number.

Complete the player analysis.
  1. Navigate to the `Player_Analysis` directory.

`cd Roulette_Loss_Investigation/Player_Analysis/`

  2. Use `grep` to isolate all of the losses that occurred on March 10, 12, and 15.

`grep - 0310_win_loss_player_data 0312_win_loss_player_data 0315_win_loss_player_data`

  3. Place those results in a file called `Roulette_Losses`.

`This command pulls the losses from each of the occurances, replaces replace the file name with a space with sed then puts it into the Roulette_Losses file.`
`grep - 0310_win_loss_player_data 0312_win_loss_player_data 0315_win_loss_player_data | sed 's/_win_loss_player_data:/ /' > Roulette_Losses`

  4. Preview the file `Roulette_Losses` and analyze the data.

`cat Roulette_Losses`

      - Record in the `Notes_Player_Analysis` file:

        - The times the losses occurred on each day.

`awk '{print $1, $2, $3}' Roulette_Losses > Notes_Player_Analysis`
        - If there is a certain player that was playing during each of those times.

`cat Roulette_Losses` To find the player present during each time.

`Used grep to search loss occuring with the least amount of players.`
`grep -o -i 'Mylie Schmidt' Roulette_Losses | wc -l`
`grep -o -i 'Corey Huffman' Roulette_Losses | wc -l`
`echo 'Mylie Schmidt' >> Notes_Player_Analysis`

        - The total count of times this player was playing.
          - **Hint:** Use the `wc` command to find this value.

`grep -o -i 'Mylie Schmidt' Roulette_Losses | wc -l >> Notes_Player_Analysis`

`In the 03-Termainal-and-Bash Readme.md I found the the following URL https://tldp.org/LDP/abs/html/textproc.html which referenced the Word Frequency Analysis wf.sh example script.`

`sh wf.sh Roulette_Losses | head`
`     59`
`     13 mylie`
`     6 schmidt`
`     5 08:00:00`
`     5 0312`
`     5 0310`
`     3 05:00:00`
`     3 0315`
`     3 02:00:00`
`     2 11:00:00`

`This activity confimred Mylie was the player dure all 13 loss occurances.`

Complete the dealer analysis. 
  1. Navigate to the `Dealer_Analysis` directory.

`cd ../Dealer_Analysis/`

  2. This file contains the dealer schedules for the various Lucky Duck casino games: Blackjack, Roulette, and Texas Hold 'Em.

      - Preview the schedule to view the format and to understand how the data is separated.

`cat 0310_Dealer_schedule 0312_Dealer_schedule 0315_Dealer_schedule`

  3. Using your findings from the player analysis, create a separate script to look at each day and time that you determined losses occurred. Use `awk`, `pipes`, and `grep` to isolate out the following four fields:

      - Time
      - a.m./p.m.
      - First name of roulette dealer
      - Last name of roulette dealer

      For example, if a loss occurred on March 10 at 2 p.m., you would write one script to find the roulette dealer who was working at that specific day and time.

      - **Hint:** You will have many scripts, but only a small change is required for each script.

`script used for home`
`nano dealer_0310_0500.sh`
`#!/bin/bash`
`grep -i '05:00:00 AM' 0310_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses`

`then exit nano`
`chmod +x `
`dealer_0310_0500.sh`

`Command used to rename script to create addtinoal scripts:`
`cp dealer_0310_0500.sh dealer_0315_0800.sh`
`cp dealer_0310_0500.sh dealer_0315_1400.sh`
`Copied scripts until there were 13, one for each time a loss occured.`

`Used nano to modify each script to adjust date and time ro find the dealer each time a loss occured as follows.`
`grep -i '08:00:00 AM' 0310_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses`
`grep -i '02:00:00 PM' 0310_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses`
`grep -i '08:00:00 PM' 0310_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses`
`grep -i '11:00:00 PM' 0310_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses`
`grep -i '05:00:00 AM' 0312_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses`
`grep -i '08:00:00 AM' 0312_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses`
`grep -i '02:00:00 PM' 0312_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses`
`grep -i '08:00:00 PM' 0312_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses`
`grep -i '11:00:00 PM' 0312_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses`
`grep -i '05:00:00 AM' 0315_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses`
`grep -i '08:00:00 AM' 0315_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses`
`grep -i '02:00:00 PM' 0315_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses`

`Alternate commands considered to run scripts:`

`This command would be modified and used in 13 scripts`
`cat 0310_Dealer_schedule | awk -F" " '{print $1, $2, $5,$6}'| grep '08:00:00 AM' >> Dealers_working_during_losses`

`This command would result in three scripts one per day the losses occured. It did not match the requirments, but was fun to research and assemble.`
`grep '05:00:00 AM\|08:00:00 AM\|02:00:00 PM\|08:00:00 PM\|11:00:00 PM' 0310_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses`

  4. Run all of the scripts and append those results to a file called `Dealers_working_during_losses`.

`sh dealer_0310_0500.sh`
`sh dealer_0310_0800.sh`
`Continued to run the scripts in the above patern until the remaining 11 scripts were run.`

  5. Preview your file `Dealers_working_during_losses` and analyze the data.

cat Dealers_working_during_losses
  
      - Record in the `Notes_Dealer_Analysis` file:

        - The primary dealer working at the times where losses occurred.

`nano Notes_Dealer_Analysis`
`added Billy Jones`

        - How many times the dealer worked when major losses occurred.

`wc -l Dealers_working_during_losses >> Notes_Dealer_Analysis`

3. Complete the player/employee correlation. 

   - In the notes file of the `Player_Dealer_Correlation` directory, add a summary of your findings noting the player and dealer you believe are colluding to scam Lucky Duck.

`nano Player_Dealer_Correlation`
`The correlation of the player and dealer data indicates there were hundreds of thousands of dollars lost during 13 occurrences on March 10th, 12th, and 15th. During each occurrence, player Mylie Schmidt and dealer Billy Jones were present indicating they were colluding to steal money from Luck Duck.`

`Specific reasons for finding including times with largest losses, player present during each game, and number of occurances:`

    - Make sure to document your specific reasons for this finding.

`Here is the specific evidence for the finding added to the Notes_Dealer_Correlation`
`~/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation$`
`cat ../Player_Analysis/Notes_Player_Analysis >> Notes_Player_Dealer_Correlation`
`cat ../Dealer_Analysis/Notes_Dealer_Analysis >> Notes_Player_Dealer_Correlation`

#### Step 4: Scripting Your Tasks
Your manager is impressed with the work you have done so far on the investigation.  

 They tasked you with building a shell script that can easily analyze future employee schedules. They will use this to determine which employee was working at a specific time in the case of future losses.

Complete the following tasks:

1. Remain in the `Dealer_Analysis` directory.  Develop a shell script called `roulette_dealer_finder_by_time.sh` that can analyze the employee schedule to easily find the roulette dealer at a specific time.

      **Hint:** You will be using a script similar to the one you created for the dealer analysis step, but you will not output the results into a file.

    - Design the shell script to accept the following two arguments:
      - One for the date (four digits)
      - One for the time

     **Note:** The argument should be able to accept a.m. or p.m.
`nano roulette_dealer_finder_by_time.sh`
`#!/bin/bash`

`# The script needs a minimum of two arguments to run correctly.`
`# First argument is the four digit month and day to query from the MMDD_Dealer_schedule files formated as MMDD.`
`# Second argument is the time formated as HH:MM:SS.`
`# Thrid argument is AM or PM and is an optional argument. Not using it will list all both AM And PM schedules.`
`# Usage: $ sh roulette_dealer_finder_by_time.sh <MMDD> <HH:MM:SS> <AM/PM>`
`# The dealer schedule is queried per the input arguments previously listed and dealer schedued for that time is output is printed to the screen.`
`# Author: Steven Bauer`

`grep -i $2' '$3 $1_Dealer_schedule | awk -F " " '{print $1, $2, $5, $6}'`

`chmod +x roulette_dealer_finder_by_time.sh`

3. Test your script on the schedules to confirm it outputs the correct dealer at the time specified.

`sh roulette_dealer_finder_by_time.sh 0310 05:00:00 AM`
`05:00:00 AM Billy Jones`

#### Bonus

- In case there is future fraud on the other Lucky Duck games, create a shell script called `roulette_dealer_finder_by_time_and_game.sh` that has the three following arguments:

   - Specific time
   - Specific date
   - Casino game being played

  **Hint:** The argument does not need to name the specific casino game.

`nano roulette_dealer_finder_by_time_and_game.sh`
`#!/bin/bash`

`# The script needs three arguments to run correctly.`
`# First arugment is the time formated as HH:MM:SS.`
`# Second arugment is AM or PM.`
`# Thrid arugement is the four digit month and day to query from the Dealer_schedule files formated as MMDD.`
`# Usage: $ sh roulette_dealer_finder_by_time_and_game.sh <HH:MM:SS> <AM/PM> <MMDD>`
`# The dealer schedule is queried per the arugnts then the time, AM/PM, First Name, Last Name are`
`# output to the screen for review.`
`# Author: Steven Bauer`

`clear`
`grep -i $1' '$2 $3_Dealer_schedule | awk -F " " '{print "Black Jack dealer: " $3, $4, "| Roulette dealer: " $5, $6, "| Texas Hold E$`

`chmod +x roulette_dealer_finder_by_time_and_game.sh`
`sh roulette_dealer_finder_by_time_and_game.sh 05:00:00 AM 0312`
`Black Jack dealer: Katey Bean | Roulette dealer: Billy Jones | Texas Hold EM dealer: Evalyn Howell were all working during the 05:00:00 AM shift.`

#### Submission Guidelines

- Move the following to the `Player_Dealer_Correlation` directory:
`Created assemble_hw.sh to place the files in Player_Dealer_Correlation directory and zip in preparation to submit it, see script below.`

  - All note files 
  - Evidence files:
    - `Roulette_Losses`
    - `Dealers_working_during_losses`
  - Shell script(s)

`Directory structure:`
`sudo apt-get install tree`
`tree Lucky_Duck_Investigations > Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/hw_directory_structure`
`cat Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/hw_directory_structure`
Lucky_Duck_Investigations
├── 3-HW-setup-evidence
├── assemble_hw.sh
├── Dealer_Schedules_0310
│   ├── 0310_Dealer_schedule
│   ├── 0311_Dealer_schedule
│   ├── 0312_Dealer_schedule
│   ├── 0313_Dealer_schedule
│   ├── 0314_Dealer_schedule
│   ├── 0315_Dealer_schedule
│   ├── 0316_Dealer_schedule
│   └── 0317_Dealer_schedule
├── Player_Dealer_Correlation.zip
├── Roulette_Loss_Investigation
│   ├── Dealer_Analysis
│   │   ├── 0310_Dealer_schedule
│   │   ├── 0312_Dealer_schedule
│   │   ├── 0315_Dealer_schedule
│   │   ├── dealer_0310_0500.sh
│   │   ├── dealer_0310_0800.sh
│   │   ├── dealer_0310_1400.sh
│   │   ├── dealer_0310_2000.sh
│   │   ├── dealer_0310_2300.sh
│   │   ├── dealer_0312_0500.sh
│   │   ├── dealer_0312_0800.sh
│   │   ├── dealer_0312_1400.sh
│   │   ├── dealer_0312_2000.sh
│   │   ├── dealer_0312_2300.sh
│   │   ├── dealer_0315_0500.sh
│   │   ├── dealer_0315_0800.sh
│   │   ├── dealer_0315_1400.sh
│   │   ├── Dealers_working_during_losses
│   │   ├── Notes_Dealer_Analysis
│   │   ├── roulette_dealer_finder_by_time_and_game.sh
│   │   └── roulette_dealer_finder_by_time.sh
│   ├── Player_Analysis
│   │   ├── 0310_win_loss_player_data
│   │   ├── 0312_win_loss_player_data
│   │   ├── 0315_win_loss_player_data
│   │   ├── Notes_Player_Analysis
│   │   ├── Roulette_Losses
│   │   ├── Roulette_Losses_Raw
│   │   └── wf.sh
│   └── Player_Dealer_Correlation
│       ├── dealer_0310_0500.sh
│       ├── dealer_0310_0800.sh
│       ├── dealer_0310_1400.sh
│       ├── dealer_0310_2000.sh
│       ├── dealer_0310_2300.sh
│       ├── dealer_0312_0500.sh
│       ├── dealer_0312_0800.sh
│       ├── dealer_0312_1400.sh
│       ├── dealer_0312_2000.sh
│       ├── dealer_0312_2300.sh
│       ├── dealer_0315_0500.sh
│       ├── dealer_0315_0800.sh
│       ├── dealer_0315_1400.sh
│       ├── Dealers_working_during_losses
│       ├── hw_directory_structure
│       ├── Notes_Dealer_Analysis
│       ├── Notes_Player_Analysis
│       ├── Notes_Player_Dealer_Correlation
│       ├── roulette_dealer_finder_by_time_and_game.sh
│       ├── roulette_dealer_finder_by_time.sh
│       └── Roulette_Losses
└── Roulette_Player_WinLoss_0310
    ├── 0310_win_loss_player_data
    ├── 0311_win_loss_player_data
    ├── 0312_win_loss_player_data
    ├── 0313_win_loss_player_data
    ├── 0314_win_loss_player_data
    ├── 0315_win_loss_player_data
    ├── 0316_win_loss_player_data
    └── 0317_win_loss_player_data


`Script to assemble and zip homework`
sh assemble_hw.sh
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

- Compress the `Player_Dealer_Correlation` folder to a zip file and submit it.

---

© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
