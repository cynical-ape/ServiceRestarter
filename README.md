# ServiceRestarter
ServiceRestarter PowerShell Script


This script is a simple tool to automate the restarting of Windows Services. It is helpful for services that sometimes fail to start on the first try or get stuck in a "Stopped" state.

Key Features

Automatic Retries: If the service fails to start, the script will try again up to a specific number of times.

Custom Wait Time: You can set how many seconds the script should wait for the service to respond before checking its status.

Status Reporting: The script gives you feedback in the console, telling you if the service is "Running," "Stopped," or in another state.

How to Use

To use this script, you call the ServiceRestarter function and provide the name of the service you want to manage.

Example Command:

PowerShell



ServiceRestarter -Service "Spooler" -WaitingTime 5 -Count 3

Parameters

ParameterDescription-ServiceThe internal name of the Windows Service (e.g., "Spooler" for Print Spooler).-WaitingTimeHow many seconds to wait after a restart attempt (Default is 2).-CountHow many times the script should try to restart the service (Default is 1).

Logic Workflow

The script runs the Restart-Service command.

It pauses for the duration of the WaitingTime.

It checks the current status of the service.

If the service is Running, the script stops and reports success.

If the service is Stopped, it loops back to try again until it reaches the Count limit.
