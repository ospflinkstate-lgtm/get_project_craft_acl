@echo off
title Update Executive Tracker
echo ----------------------------------------------------
echo Updating Executive Tracker (MikroTik_PoC_Enforcement_Tracker.xlsx)
echo ----------------------------------------------------
echo.
set /p rsc_file="Enter RSC filename [default: Mikrotik-TP3.rsc]: "
if "%rsc_file%"=="" set rsc_file=Mikrotik-TP3.rsc

echo.
echo Running: python generate_tracker_excel.py %rsc_file%...
python generate_tracker_excel.py "%rsc_file%"
echo.
echo ----------------------------------------------------
echo Done! Press any key to close this window.
echo ----------------------------------------------------
pause
