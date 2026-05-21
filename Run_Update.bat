@echo off
title Update Deployment Plan
echo ----------------------------------------------------
echo Updating Deployment Plan (A-Draft - Mikrotik Deployment.xlsx)
echo ----------------------------------------------------
echo.
set /p rsc_file="Enter RSC filename [default: Mikrotik-TP3.rsc]: "
if "%rsc_file%"=="" set rsc_file=Mikrotik-TP3.rsc

echo.
echo Running: python update_deployment_excel.py %rsc_file%...
python update_deployment_excel.py "%rsc_file%"
echo.
echo ----------------------------------------------------
echo Done! Press any key to close this window.
echo ----------------------------------------------------
pause
