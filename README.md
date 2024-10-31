# windows-updates-script

This script automates the process of updating Windows operating systems. It allows users to run updates seamlessly without needing to navigate through the Windows Update interface manually.

## Features

- **Automated Updates**: Checks for and installs available Windows and install softwares updates.
- **Error Handling**: Captures errors and logs them for review.
- **Scheduled Execution**: Can be set to run at regular intervals using Task Scheduler.
- **Log File**: Creates a log file to track updates and any issues that may arise.

## Prerequisites

- Windows 10 or later.
- Administrator privileges are required to run the script successfully.

## Usage

1. **Download the Script**:
   Clone this repository or download the script file directly.

   ```bash
   git clone https://github.com/<USERNAME>/windows-update-script.git

# Windows Update Script

This repository contains a PowerShell script that automates the Windows update and software installation process. Users can easily check for and install available updates while capturing logs for tracking. With built-in error handling and scheduling capabilities, this script simplifies system maintenance, ensuring your Windows environment stays up-to-date effortlessly.

## Features

- **Automated Updates**: Checks for and installs available Windows updates.
- **Error Handling**: Captures errors and logs them for review.
- **Scheduled Execution**: Can be set to run at regular intervals using Task Scheduler.
- **Log File**: Creates a log file to track updates and any issues that may arise.

## Prerequisites

- Windows 10 or later.
- Administrator privileges are required to run the script successfully.

## Usage Instructions

1. **Open PowerShell as Administrator**:  
   Right-click on the PowerShell icon and select **"Run as Administrator"**.

2. **Run the Script**:  
   Navigate to the directory where the script is located and execute it:

 ```powershell```
 cd path\to\your\script
 .\update_script.ps1

   
3. **Change Execution Policy**:
If you encounter a security warning, you may need to change the execution policy:

```powershell```
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser


4. **Check the Log File**:
After running the script, check the log file (e.g., update_log.txt) for details on the updates installed and any errors that may have occurred.

## Scheduling the Script
You can automate the execution of this script by scheduling it to run at specific intervals using Windows Task Scheduler:

1. Open Task Scheduler.

2.Click on Create Basic Task.

3.Follow the prompts to name your task and set the schedule (daily, weekly, etc.).

4.Under the Action tab, select Start a program and point it to powershell.exe.

5.In the Add arguments field, enter the following:
   -ExecutionPolicy Bypass -File "C:\path\to\your\script\update_script.ps1"
6.finish setting up the task, and it will run automatically as scheduled.
