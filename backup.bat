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
::ZQ05rAF9IAHYFVzEqQIdMShlYESgPWixE6V8
::eg0/rx1wNQPfEVWB+kM9LVsJDCmbD1qWRpcd6+Pu/4o=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQIWLQlGTQmHMn+7RqUd+um76vKCoVi+k0H8d8/f3/SMIeMY/1WqFQ==
::dhA7uBVwLU+EWHyX91A5Kho0
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATE1U41MFtkTQCLMGO7Zg==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJHSdx3McZT5VXx2xKXuqCacI1MXC3Nur72g8Z9sMTb/r9Ya6HOYc5FHhSZQs1XFPiIUJFB44
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
color 0e
set USUARIO=dump
set MYSQL_PWD=123456
set HOST=%1
set PORTA=%2
set PATHBIN=%3
set PATHBKP=%4
set CLIENTE=%5

FOR /F "tokens=1,2,3 delims=/ " %%a in ("%DATE%") do (

set DIA=%%a

set MES=%%b

set ANO=%%c
)

set ERRORLOG=backup_error_%DIA%_%MES%_%ANO%.log

IF "%HOST%" EQU "" GOTO ERROPARAMETROS
IF "%PORTA%" EQU "" GOTO ERROPARAMETROS
IF "%PATHBIN%" EQU "" GOTO ERROPARAMETROS
IF "%PATHBKP%" EQU "" GOTO ERROPARAMETROS
IF NOT EXIST "%PATHBIN%\mysqldump.exe" GOTO ERROBIN
IF NOT EXIST "%PATHBKP%\databases.txt" GOTO ERRODATABASES

set PASTABKP=%PATHBKP%\BKP_%DIA%_%MES%_%ANO%_%CLIENTE%
set LOG=%PASTABKP%\log_backup_%DIA%_%MES%_%ANO%.log

:CRIARPASTA
IF NOT EXIST "%PASTABKP%" md "%PASTABKP%"

echo ============== PARAMETROS ================================================ >> %LOG%
echo SERVER: %HOST% >> %LOG%
echo PORTA: %PORTA% >> %LOG%
echo PATHBIN: %PATHBIN% >> %LOG%
echo PATHBKP: %PATHBKP% >> %LOG%
echo ========================================================================== >> %LOG%

msg %username% BACKUP DOS SISTEMAS ESCRIBA INICIADO! DATA/HORA: %DATE% - %TIME%  
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - Backup Iniciado >> %LOG%
FOR /F %%z IN ('type %PATHBKP%\databases.txt') DO echo show tables from %%z; | %PATHBIN%\mysql -N -u%USUARIO% -h%HOST% -P%PORTA% > %PASTABKP%\%%z.tabelas 2>> %LOG%
@echo on
FOR /F %%i IN ('type %PATHBKP%\databases.txt') DO FOR /F %%j IN ('type %PASTABKP%\%%i.tabelas'); DO (
IF EXIST "%PASTABKP%\%%i.%%j.sql";(
@echo %PATHBIN%\mysqldump --quick --single-transaction --verbose --max_allowed_packet=1024M -u%USUARIO% -h%HOST% -P%PORTA% -r %PASTABKP%\%%i.%%j_1.sql %%i %%j >> %LOG%
%PATHBIN%\mysqldump --quick --single-transaction --verbose --max_allowed_packet=1024M -u%USUARIO% -h%HOST% -P%PORTA% -r %PASTABKP%\%%i.%%j_1.sql %%i %%j 2>> %LOG%
) ELSE (
@echo %PATHBIN%\mysqldump --quick --single-transaction --verbose --max_allowed_packet=1024M -u%USUARIO% -h%HOST% -P%PORTA% -r %PASTABKP%\%%i.%%j.sql %%i %%j >> %LOG%
%PATHBIN%\mysqldump --quick --single-transaction --verbose --max_allowed_packet=1024M -u%USUARIO% -h%HOST% -P%PORTA% -r %PASTABKP%\%%i.%%j.sql %%i %%j 2>> %LOG%)
)

@echo. >> %LOG%
@echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - Fazendo backup de Procedures se existir >> %LOG%
@echo. >> %LOG%
FOR /F %%b IN ('type %PATHBKP%\databases.txt') DO (
@echo %PATHBIN%\mysqldump --quick --single-transaction --verbose --max_allowed_packet=1024M --skip-triggers  --no-data --no-create-db --no-create-info --routines --events -u%USUARIO% -h%HOST% -P%PORTA% -r %PASTABKP%\%%b.routines.sql %%b >> %LOG%
%PATHBIN%\mysqldump --quick --single-transaction --verbose --max_allowed_packet=1024M --skip-triggers  --no-data --no-create-db --no-create-info --routines --events -u%USUARIO% -h%HOST% -P%PORTA% -r %PASTABKP%\%%b.routines.sql %%b 2>> %LOG%)

@echo off
@echo. >> %LOG%
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - Backup Finalizado >> %LOG%
find /c "mysqldump:" %LOG% || find /c "Unknown" %LOG% || find /c "HY000" %LOG%
cls
if %errorlevel% equ 1;(
@echo.
@echo. >> %LOG%
@echo BACKUP CONCLUIDO COM SUCESSO! LOGS GRAVADOS EM %LOG% - DATA/HORA: %DATE% - %TIME%
@echo BACKUP CONCLUIDO COM SUCESSO! >> %LOG%
msg %username% BACKUP DOS SISTEMAS ESCRIBA CONCLUIDO COM SUCESSO! DATA/HORA: %DATE% - %TIME%  
exit
@echo.)ELSE (
@echo.
@echo. >> %LOG%
echo BACKUP CONCLUIDO COM ERROS, && echo LOGS GRAVADOS EM %LOG%!
@echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - BACKUP CONCLUIDO COM ERROS! >> %LOG%
msg %username% BACKUP DOS SISTEMAS ESCRIBA CONCLUIDO COM ERROS! LOGS GRAVADOS EM %LOG% - DATA/HORA: %DATE% - %TIME% 
@echo.)
exit

:ERROPARAMETROS
cls
echo.
echo.>>%ERRORLOG%
echo ------------------------------------------------------------------------------------ >> %ERRORLOG%
echo ------------------------------------------------------------------------------------ >> %ERRORLOG%
echo %date% - %time%
echo.>>%ERRORLOG%
echo.
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% >> %ERRORLOG%
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
echo backup.exe [SERVIDOR] [PORTA] [PATH-MYSQL-BIN] [PATH-BKP-DESTINO]
echo backup.exe [SERVIDOR] [PORTA] [PATH-MYSQL-BIN] [PATH-BKP-DESTINO]>> %ERRORLOG%
echo.>>%ERRORLOG%
echo #################################################################################### >> %ERRORLOG%
echo.
pause
exit

:ERROBIN
cls
echo.
echo.
echo.>>%ERRORLOG%
echo ------------------------------------------------------------------- >> %ERRORLOG%
echo ------------------------------------------------------------------- >> %ERRORLOG%
echo %date% - %time%
echo.>>%ERRORLOG%
echo.
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2%>> %ERRORLOG%
echo.>>%ERRORLOG%
echo ERRO: ARQUIVO BIN NAO ENCONTRADO!
echo.
echo %PATHBIN%\mysqldump.exe
echo ERRO: ARQUIVO BIN NAO ENCONTRADO! >> %ERRORLOG%
echo.>>%ERRORLOG%
echo.
echo %PATHBIN%\mysqldump.exe >> %ERRORLOG%
echo.>>%ERRORLOG%
echo ################################################################### >> %ERRORLOG%
echo.
pause
exit

:ERRODATABASES
cls
echo.
echo.
echo.>>%ERRORLOG%
echo ------------------------------------------------------------------- >> %ERRORLOG%
echo ------------------------------------------------------------------- >> %ERRORLOG%
echo %date% - %time%
echo.>>%ERRORLOG%
echo.
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2%>> %ERRORLOG%
echo.>>%ERRORLOG%
echo ERRO: ARQUIVO DATABASES NAO ENCONTRADO!
echo.
echo %PATHBKP%\databases.txt
echo ERRO: ARQUIVO DATABASES NAO ENCONTRADO! >> %ERRORLOG%
echo.>>%ERRORLOG%
echo.
echo %PATHBKP%\databases.txt >> %ERRORLOG%
echo.>>%ERRORLOG%
echo ################################################################### >> %ERRORLOG%
echo.
pause
exit
