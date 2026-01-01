@echo off
echo ========================================
echo  OSOMS Compiler and Runner
echo ========================================
echo.
echo Compiling main.cpp...
echo.


REM Kill any running instances first
taskkill /F /IM OSOMS.exe >nul 2>&1
taskkill /F /IM osoms.exe >nul 2>&1
timeout /t 1 /nobreak >nul

REM Delete old executable if it exists
if exist OSOMS.exe (
    echo Deleting old OSOMS.exe...
    del OSOMS.exe
    timeout /t 1 /nobreak >nul
    echo.
)

if exist osoms.exe (
    echo Deleting old osoms.exe...
    del osoms.exe
    timeout /t 1 /nobreak >nul
    echo.
)

REM Compile the program
g++ -o OSOMS.exe main.cpp -std=c++11

REM Check if compilation was successful
if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo  SUCCESS! OSOMS.exe created!
    echo ========================================
    echo.
    echo Starting OSOMS.exe...
    echo.
    timeout /t 1 /nobreak >nul
    
    REM Run the program
    OSOMS.exe
    
    echo.
    echo ========================================
    echo  Program Ended
    echo ========================================
    echo.
) else (
    echo.
    echo ========================================
    echo  COMPILATION FAILED!
    echo ========================================
    echo.
    echo Please check the error messages above.
    echo.
    pause
)
