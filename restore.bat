::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBNQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXqZg==
::ZQ05rAF9IAHYFVzEqQICLQhAQxaHfEajNYQwiA==
::eg0/rx1wNQPfEVWB+kM9LVsJDDaHL3+1FLBcxfHI3sbn
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQIWLQlGTQmHMn+7RqUd+um7/e+UtkwIRuOcvywY1fSKJaAR60bvYIZjtg==
::dhA7uBVwLU+EWHyX91A5Kho0
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATE1U41MFtkTQCLMGO7Zg==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJHSdx3McZT5VXx2xKXuqCacI1MXC3Nur72g8Z9sMTb/r9Ya6HPIW+VHrZ5Nj02Jf+A==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
color 0e
set HOST=%1
set PORTA=%2
set USUARIO=%3
set MYSQL_PWD=%4
set PATHBIN=%5
set PATHBKP=%6

:: COLETA DATA ATUAL
FOR /F "tokens=1,2,3 delims=/ " %%a in ("%DATE%") do (

set DIA=%%a

set MES=%%b

set ANO=%%c
)

set ERRORLOG=restore_error_%DIA%_%MES%_%ANO%.log

IF "%HOST%" EQU "" goto FIM
IF "%PORTA%" EQU "" goto FIM
IF "%USUARIO%" EQU "" goto FIM
IF "%MYSQL_PWD%" EQU "" goto FIM
IF "%PATHBIN%" EQU "" goto FIM
IF "%PATHBKP%" EQU "" goto FIM


set LOG=%PATHBKP%\log_import_%DIA%_%MES%_%ANO%.log

echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - Restauracao Iniciada >> %LOG%
FOR /F %%z IN ('type %PATHBKP%\databases.txt') DO echo create database if not exists %%z; | %PATHBIN%\mysql -u%USUARIO% -h%HOST% -P%PORTA% 2>> %LOG%
FOR /F %%i IN ('type %PATHBKP%\databases.txt') DO (
@echo. >> %LOG%
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - Importando database: %%i >> %LOG%
FOR /F %%j IN ('type %PATHBKP%\%%i.tabelas'); DO (
IF EXIST %PATHBKP%\%%i.%%j.sql;(
@echo "type %PATHBKP%\%%i.%%j.sql |%PATHBIN%\mysql -u%USUARIO% -h%HOST% -P%PORTA% %%i" >>%LOG%
@echo on
type %PATHBKP%\%%i.%%j.sql |%PATHBIN%\mysql -u%USUARIO% -h%HOST% -P%PORTA% %%i 2>>%LOG%)))
@echo. >> %LOG%
@echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - Restaurando Procedures se existir >> %LOG%
FOR /F %%b IN ('type %PATHBKP%\databases.txt') DO (
IF EXIST %PATHBKP%\%%b.routines.sql;(
@echo "type %PATHBKP%\%%b.routines.sql |%PATHBIN%\mysql -u%USUARIO% -h%HOST% -P%PORTA% %%b" >>%LOG%
type %PATHBKP%\%%b.routines.sql |%PATHBIN%\mysql -u%USUARIO% -h%HOST% -P%PORTA% %%b 2>>%LOG%))
@echo. >> %LOG%
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - Restauracao Finalizada >> %LOG%
@echo off
cls
@echo.
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - RESTAURACAO CONCLUIDA! LOGS GRAVADOS EM %LOG%.
msg %username% RESTAURACAO CONCLUIDA! LOGS GRAVADOS EM %LOG% - DATA/HORA: %DATE% - %TIME% 
exit

:FIM
cls
echo.
echo.>>%ERRORLOG%
echo ------------------------------------------------------------------------------------ >> %ERRORLOG%
echo ------------------------------------------------------------------------------------ >> %ERRORLOG%
echo %date% - %time%
echo.>>%ERRORLOG%
echo.
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2%>> %ERRORLOG%
echo.>>%ERRORLOG%
echo ERRO: PARAMETROS INVALIDOS!
echo.
echo ERRO: PARAMETROS INVALIDOS! >> %ERRORLOG%
echo.>>%ERRORLOG%
echo ============== PARAMETROS ================ >> %ERRORLOG%
echo SERVER: %HOST% >> %ERRORLOG%
echo PORTA: %PORTA% >> %ERRORLOG%
echo PATHBIN: %PATHBIN% >> %ERRORLOG%
echo PATHBKP: %PATHBKP% >> %ERRORLOG%
echo.>>%ERRORLOG%
echo ESSE SCRIPT DEVE SER EXECUTADO COM OS SEGUINTES PARAMETROS:
echo restore.exe [SERVIDOR] [PORTA] [USUARIO] [SENHA] [PASTABIN] [PASTADESTINO]
echo restore.exe [SERVIDOR] [PORTA] [USUARIO] [SENHA] [PASTABIN] [PASTADESTINO]>> %ERRORLOG%
echo.>>%ERRORLOG%
echo #################################################################################### >> %ERRORLOG%
echo.
pause
exit