#!/bin/bash

# Create /var/backup of it doesn't exsist
mkdir -p /var/backup

# Create a new backup
tar cvf /var/backup/home.tar /home

# Moves the file /var/backup/home.tar /var/backup/home.MMDDYYYY.tar
mv /var/backup/home.tar /var/backup/home.04082021.tar

# List all files in /var/backup and save output to /var/backup/file_report.txt
ls -lah /var/backup > /var/backup/file_report.txt

# Print availale free memory
free -h > /var/backup/disk_report.txt
