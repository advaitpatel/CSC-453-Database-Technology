@ECHO off
:: Murach's Oracle SQL and PL/SQL
:: Mike Murach & Associates, Inc.
:: 
:: Uses SQL*Plus utility to run the SQL scripts that create
:: and populate the tables in the AP, OM, and EX schemas.

:: If necessary, edit the username/password
sqlplus system/system @setup_database

:: Display a message about the log file
ECHO.
ECHO For details, check the setup_database.log file in the current directory.
ECHO.

:: Display 'press any key to continue' message
PAUSE