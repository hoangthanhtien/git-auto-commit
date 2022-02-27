import subprocess
from subprocess import call, STDOUT
import os
from os import path

# Get the git folder path
print("Enter the folder path you want to auto commit: ")
git_folder_path = input()

# Validate path
if not path.exists(git_folder_path):
    raise Exception(f"{git_folder_path} is not exists, please check")

# Check if input path is a git folder by checking if a .git folder exists
if not path.exists(git_folder_path+"/.git"):
    raise Exception(f"{git_folder_path} is not a git repository")

# Get the commit time everyday
# TODO support other durations: Every month, hour,...
print("Enter the commit time (HH:mm): ")
commit_time = input()

# Validate commit time
if not commit_time:
    raise Exception('You must enter the valid commit time')
hour, minute = commit_time.split(":")
if len(hour) != 2 or len(minute) != 2:
    raise Exception('You must enter the valid commit time')
try:
    hour_number = int(hour)
    minute_number = int(minute)
    if hour_number >= 24 or hour_number < 0:
        raise Exception("Hour is not in the valid format")
    elif minute_number >= 60 or minute_number < 0:
        raise Exception("Minute is not in the valid format")
except Exception:
    raise Exception("You must enter the valid commit time")
print("hour, minute", hour, minute)
print("###########################################")
print(f"{git_folder_path} will be auto commit everyday at {commit_time}")
