::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyG8pGyp4ASGDL3KJE6UM5/rv08e+kXwxGcceS7bo74S+D9In1kPre4Io6nhbm8AZHFVdZhfL
::fBE1pAF6MU+EWHreyG8pGyp4ASGDL3KJE6UM5/rv08e+kXwxGcceS7bo74S+D9In1kPre4Io6n1fjNsNHwgWewquDg==
::fBE1pAF6MU+EWHreyG8pGyp4ASGDL3KJE6UM5/rv08e+kXwxGcceS7bo74S+D9In1kPre4Io6ndDi9oAQh5Ae3I=
::fBE1pAF6MU+EWHreyG8pGyp4ASGDL3KJE6UM5/rv08e+kXwxGcceS7bo74S+D9In1kPre4Io6ndDi9oADxNdfRnlaxcxyQ==
::fBE1pAF6MU+EWHreyG8pGyp4ASGDL3KJE6UM5/rv08e+kXwxGcceS7bo74S+D9In1kPre4Io6ndDi9oACA5VblyudgpU
::fBE1pAF6MU+EWHreyG8pGyp4ASGDL3KJE6UM5/rv08e+kXwxGcceS7bo74S+D9In1kPre4Io6mhfi98DHh4WewquDg==
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJHSdx3McZT5VXx2xKXuqCacI1Mv04fyCsFkYRsAeTJvU/4yrHOUA6Vftd5dj33lV+A==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXqZg==
::ZQ05rAF9IAHYFVzEqQIdMShlYETPfE67Fawv/fjr4PiTwg==
::eg0/rx1wNQPfEVWB+kM9LVsJDCmbD1qWRvhczeno9tmSsl0SRvZf
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQIWLQlGTQmHMn+7RqUd+um7/P+XrV8JUaI+d8/Z27qNL6AX7wXgdJIixTp3ofg9IHs=
::dhA7uBVwLU+EWHyX91A5KhoUZQqEM3m3pXQI4ev6jw==
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATE1U41MFtkTQCLMGO7Zg==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJHSdx3McZT5VXx2xKXuqCacI1MXC3Nur72g8Z9sMTb/r9Ya6HM0K2XTIOLMsxWNpjdscAwlMMBeza28=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
color 0e
TITLE --- MYSQL - EASY SUPPORT ---
:MAIN
cls
echo.
echo #################################################
echo #                                               #
echo #            MYSQL - EASY SUPPORT               #
echo #                                               #
echo #    FERRAMENTA DE SUPORTE DE BANCO DE DADOS    #
echo #                                               #
echo # DESENVOLVIDO POR: ALEX PADILHA    VERSION 1.0 #
echo #################################################
echo.
timeout /t 3 /nobreak

:: COLETA DATA ATUAL
FOR /F "tokens=1,2,3 delims=/ " %%a in ("%DATE%") do (

set DIA=%%a

set MES=%%b

set ANO=%%c
)

cls
echo.
set /p CLIENTE=COD. CLIENTE: 


:: SETA LOG
set LOG=logGeral_mysqlsupport_%cliente%_%DIA%_%MES%_%ANO%.log
echo ===========================================================================================================>>%LOG%
echo --- MYSQL - EASY SUPPORT --- CLIENTE ***%CLIENTE%*** - DATA: %DATE% - HORA: %time:~0,2%_%time:~3,2%>>%LOG%
echo WORKSTATION: %COMPUTERNAME%>>%LOG%
echo USER: %USERNAME%>>%LOG%
echo ===========================================================================================================>>%LOG%
echo.
set /p HOST=SERVIDOR: 
echo.
set /p PORT=PORTA: 
cls
echo.
set /p USER=USUARIO: 

:SENHA
cls
set SENHA=null
set RSENHA=null
echo.
echo DIGITE A SENHA E PRESSIONE ENTER:
getpass.exe>%tmp%\passwd
for /f "tokens=1" %%a in (%tmp%\passwd) do set SENHA=%%a
cls
echo.
echo DIGITE A SENHA NOVAMENTE:
getpass.exe>%tmp%\passwd
for /f "tokens=1" %%a in (%tmp%\passwd) do set RSENHA=%%a
del "%tmp%\passwd" /q>nul
IF %senha%==null GOTO SENHA
IF %rsenha%==null GOTO SENHA
IF %senha%==%rsenha% ( GOTO INICIO ) ELSE ( echo SENHAS NAO CONFEREM!&&echo.&&pause&&GOTO SENHA)

:INICIO
TITLE --- MYSQL - EASYSUPPORT --- CLIENTE ***%CLIENTE%*** - %DATE%
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - MENU INICIAL>>%LOG%
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - SERVIDOR: %HOST% - PORTA: %PORT% - USUARIO: %USER%>>%LOG%
cls
echo.
echo AO CONCLUIR, UTILIZE A OPCAO "[0] FINALIZAR"!
set OP=""
echo.
echo [1] CONTAGEM DE REGISTROS
echo [2] VERIFICAR TABELAS DUPLICADAS
echo [3] MYSQLCHECK 
echo [4] COMPARAR REGISTROS
echo [5] BACKUP
echo [6] RESTORE
echo [7] ALTERAR SERVIDOR
echo.
echo [0] FINALIZAR

:OP
echo.
set /p OP=ESCOLHA A OPCAO: 
if %op%==1 call :CONTAR
if %op%==2 call :DOUBLETABLES
if %op%==3 call :MYSQLCHK
if %op%==4 call :COMPARAR
if %op%==5 call :BACKUP
if %op%==6 call :RESTORE
if %op%==7 call :MAIN
if %op%==0 (echo.&&goto FIM)
if %op% GEQ 8 (echo.&&echo OPCAO INVALIDA!&&goto OP)
if "%op%" EQU "" (echo.&&echo OPCAO INVALIDA!&&goto OP)

::OPÇÃO 1
:CONTAR
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - CONTAGEM DE REGISTROS>>%LOG%
cls
:OPTION
set option=0
set TABELA=null
echo.
echo [1] ANTIGO (count_serverantigo)
echo [2] NOVO (count_servernovo)
echo [3] MASTER (count_master)
echo [4] SLAVE (count_slave)
echo [5] VOLTAR
echo.
set /p option=OPCAO DE CONTAGEM: 
if %option%==1 (set TABELA=count_serverantigo)
if %option%==2 (set TABELA=count_servernovo)
if %option%==3 (set TABELA=count_master)
if %option%==4 (set TABELA=count_slave)
if %option%==5 (goto :INICIO)
if %option%==0 (echo.&&echo OPCAO INVALIDA!&&goto OPTION)
if %option% GEQ 6 (echo.&&echo OPCAO INVALIDA!&&goto OPTION)

cls

set NAOCONTAR="mysql information_schema performance_schema sys"
set CREATE-EBACKUP=CREATE DATABASE IF NOT EXISTS `ebackup`; CREATE TABLE IF NOT EXISTS ebackup.dados_cliente (cod_cliente VARCHAR(6) DEFAULT NULL); DELETE FROM ebackup.dados_cliente; INSERT INTO ebackup.dados_cliente (`cod_cliente`) VALUES ('%cliente%'); CREATE TABLE IF NOT EXISTS ebackup.estatus (`id` INT(2) DEFAULT NULL);
set CRT=CREATE TABLE IF NOT EXISTS escriba.%TABELA%(id INT(10) AUTO_INCREMENT PRIMARY KEY, cod_cliente VARCHAR(6), banco VARCHAR(30) NOT NULL, tabela VARCHAR(30) NOT NULL, registros VARCHAR(10), data_hora TIMESTAMP);
set TRT=TRUNCATE TABLE escriba.%TABELA%;
set QCL=SELECT cod_cliente FROM ebackup.dados_cliente;
set SHD=SHOW DATABASES;

mysql -N -u%USER% -p%SENHA% -h%HOST% -P%PORT% --execute="%CREATE-EBACKUP%"
mysql -N -u%USER% -p%SENHA% -h%HOST% -P%PORT% --execute="%CRT%"
mysql -N -u%USER% -p%SENHA% -h%HOST% -P%PORT% --execute="%TRT%"
mysql -N -u%USER% -p%SENHA% -h%HOST% -P%PORT% --execute="%SHD%" | findstr /V %NAOCONTAR% > %tmp%\databases.txt

@echo on
FOR /F %%c IN ('mysql -N -u%USER% -p%SENHA% -h%HOST% -P%PORT% --execute="%QCL%"') DO FOR /F %%i IN ('type %tmp%\databases.txt') DO FOR /F %%j IN ('mysql -N -u%USER% -p%SENHA% -h%HOST% -P%PORT% --execute="show tables from %%i"') DO FOR /F %%r in ('mysql -N -u%USER% -p%SENHA% -h%HOST% -P%PORT% --execute="SELECT COUNT(*) FROM %%i.%%j"') DO mysql -u%USER% -p%SENHA% -h%HOST% -P%PORT% --execute="INSERT INTO escriba.%TABELA% (cod_cliente, banco, tabela, registros, data_hora) VALUES ('%%c','%%i','%%j','%%r',NOW())"
del %tmp%\databases.txt /q>nul
cls
@echo off
echo.
echo A CONTAGEM DE REGISTROS FOI FEITA COM SUCESSO NO SERVIDOR %HOST% E SALVA NA TABELA "escriba.%TABELA%"
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - A CONTAGEM DE REGISTROS FOI FEITA COM SUCESSO NO SERVIDOR %HOST% E SALVA NA TABELA "escriba.%TABELA%">>%LOG%
echo.
pause
GOTO :INICIO

::OPÇÃO 2
:DOUBLETABLES
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - VERIFICACAO DE TABELAS DUPLICADAS>>%LOG%
cls
echo show databases; | mysql -N -u%USER% -p%SENHA% -h%HOST% -P%PORT% > %tmp%\databases.txt
FOR /F %%z IN ('type %tmp%\databases.txt') DO echo show tables from %%z; | mysql -u%USER% -p%SENHA% -h%HOST% -P%PORT% > %tmp%\%%z.tabelas
FOR /F %%i IN ('type %tmp%\databases.txt') DO FOR /F %%j IN ('type %tmp%\%%i.tabelas'); DO (
FOR /F %%l IN ('type %tmp%\%%i.tabelas'); DO (
IF NOT %%j == %%l;(
IF /I %%j == %%l;(
echo %%i.%%j >> tabelasduplicadas_%cliente%_%DIA%_%MES%_%ANO%.log
))))
IF EXIST "tabelasduplicadas_%cliente%_%DIA%_%MES%_%ANO%.log";(
cls
echo.
echo ENCONTRADO TABELAS DUPLICADAS NO BANCO DE DADOS DO CLIENTE "%cliente%"!
echo VERIFIQUE O ARQUIVO "tabelasduplicadas_%cliente%_%DIA%_%MES%_%ANO%.log"
type "tabelasduplicadas_%cliente%_%DIA%_%MES%_%ANO%.log">>%LOG%
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - ENCONTRADO TABELAS DUPLICADAS NO BANCO DE DADOS DO CLIENTE "%cliente%". VERIFIQUE O ARQUIVO "tabelasduplicadas_%cliente%_%DIA%_%MES%_%ANO%.log">>%LOG%
echo.
pause
) ELSE (
cls
echo.
echo NAO FOI ENCONTRADO TABELA DUPLICADA NO BANCO DE DADOS DO CLIENTE "%cliente%"!
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - NAO FOI ENCONTRADO TABELA DUPLICADA NO BANCO DE DADOS DO CLIENTE "%cliente%"!>>%LOG%
echo.
pause
)
del %tmp%\*.tabelas /q>nul
GOTO :INICIO

::OPÇÃO 3
:MYSQLCHK
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - MYSQLCHECK>>%LOG%
cls
mysqlcheck.exe --auto-repair -u%USER% -p%SENHA% -h%HOST% -P%PORT% --all-databases > mysqlcheck_%cliente%_%DIA%_%MES%_%ANO%.log
cls
type mysqlcheck_%cliente%_%DIA%_%MES%_%ANO%.log
type mysqlcheck_%cliente%_%DIA%_%MES%_%ANO%.log>>%LOG%
echo.
echo CHECAGEM DE BANCO DE DADOS CONCLUIDA!
echo VERIFIQUE O ARQUIVO DE LOG "mysqlcheck_%cliente%_%DIA%_%MES%_%ANO%.log"!
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - CHECAGEM DE BANCO DE DADOS CONCLUIDA! VERIFIQUE O ARQUIVO DE LOG "mysqlcheck_%cliente%_%DIA%_%MES%_%ANO%.log"!>>%LOG%
echo.
pause
GOTO :INICIO

::OPÇÃO 4
:COMPARAR
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - COMPARARACAO DAS CONTAGENS DE REGISTROS>>%LOG%
cls

:OPTION_COMPARAR
set option_comparar=0
set TABELA=null
set database1=null
set database_name1=null
set database2=null
set database_name2=null
echo.
echo [1] ANTIGO x NOVO
echo [2] MASTER x SLAVE
echo [3] VOLTAR
echo.
set /p option_comparar=OPCAO PARA COMPARAR: 
if %option_comparar%==1 (set database1=count_serverantigo&&set database2=count_servernovo&&set database_name1=ANTIGO&&set database_name2=NOVO)
if %option_comparar%==2 (set database1=count_master&&set database2=count_slave&&set database_name1=MASTER&&set database_name2=SLAVE)
if %option_comparar%==3 (goto :INICIO)
if %option_comparar%==0 (echo.&&echo OPCAO INVALIDA!&&goto OPTION_COMPARAR)
if %option_comparar% GEQ 4 (echo.&&echo OPCAO INVALIDA!&&goto OPTION_COMPARAR)


set COMPARAR=SELECT CONCAT(m.banco,".",m.tabela) AS 'SERVIDOR %database_name1%', IFNULL(CONCAT(s.banco,".",s.tabela),'TABELA INEXISTENTE') AS 'SERVIDOR %database_name2%', m.registros AS 'REGISTROS SERVIDOR %database_name1%', IFNULL(s.registros,0) AS 'REGISTROS SERVIDOR %database_name2%', IFNULL(m.registros,0) - IFNULL(s.registros,0) AS 'DIFERENCA' FROM escriba.%database1% m LEFT JOIN escriba.%database2% s ON m.banco = s.banco AND m.tabela = s.tabela;
echo %COMPARAR%>%tmp%\query_compare.sql

mysql -u%USER% -p%SENHA% -h%HOST% -P%PORT% -H < %tmp%\query_compare.sql > ValidacaoDados_%database_name1%_x_%database_name2%_%cliente%_%DIA%_%MES%_%ANO%.html
cls
echo.
echo VALIDACAO CONCLUIDA, VERIFIQUE O ARQUIVO "ValidacaoDados_%database_name1%_x_%database_name2%_%cliente%_%DIA%_%MES%_%ANO%.html".
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - VALIDACAO CONCLUIDA, VERIFIQUE O ARQUIVO "ValidacaoDados_%database_name1%_x_%database_name2%_%cliente%_%DIA%_%MES%_%ANO%.html".>>%LOG%
ValidacaoDados_%database_name1%_x_%database_name2%_%cliente%_%DIA%_%MES%_%ANO%.html
echo.
pause
GOTO :INICIO

::OPÇÃO 5
:BACKUP
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - BACKUP>>%LOG%
cls
set SERVIDOR=%HOST%
set PORTA=%PORT%
:CONFIRMASERVIDOR
cls
echo.
echo SERVIDOR: %SERVIDOR% PORTA: %PORTA%
echo.
echo [1]SIM
echo [2]NAO
echo.
set /p OP=DESEJA FAZER BACKUP DO SERVIDOR ACIMA? 
if %op%==1 call :PATHBKP
if %op%==2 call :PARAMETROS
if %op%==0 (echo.&&echo OPCAO INVALIDA!&&echo.&&pause&&goto CONFIRMASERVIDOR)
if %op% GEQ 3 (echo.&&echo OPCAO INVALIDA!&&echo.&&pause&&goto CONFIRMASERVIDOR)

:PARAMETROS
echo.
set /p SERVIDOR=SERVIDOR: 
set /p PORTA=PORTA: 
GOTO :CONFIRMASERVIDOR

:PATHBKP
set PATHBKP=null
echo.
set /p PATHBKP=LOCAL DE DESTINO DO BACKUP (Ex.: c:\backup_escriba): 
IF %PATHBKP%=="null" (echo.&&echo FAVOR INFORMAR O LOCAL PARA SALVAR O BACKUP!&&goto PATHBKP)
IF NOT EXIST %PATHBKP% (echo.&&echo PASTA "%PATHBKP%" NAO ENCONTRADA!&&goto PATHBKP) 
IF NOT EXIST %PATHBKP%\databases.txt (echo.&&echo ARQUIVO "%PATHBKP%\databases.txt" NAO ENCONTRADO, NECESSARIO PARA EXECUTAR O BACKUP!&&goto PATHBKP)


:CONFIRMADATABASES
echo.
echo DATABASES:
echo --------------------------------------------------------
type %PATHBKP%\databases.txt
echo.
echo --------------------------------------------------------
echo.
echo [1]SIM
echo [2]NAO
echo.
set /p OP=DESEJA FAZER BACKUP DAS DATABASES ACIMA? 
if %op%==1 call :GOBACKUP
if %op%==2 call :PATHBKP
if %op%==0 (echo.&&echo OPCAO INVALIDA!&&goto CONFIRMADATABASES)
if %op% GEQ 3 (echo.&&echo OPCAO INVALIDA!&&goto CONFIRMADATABASES)


:GOBACKUP
cd > %tmp%\pathbin
for /f "tokens=1" %%a in (%tmp%\pathbin) do set pathbin=%%a
echo.
echo INICIADO BACKUP!
echo.
echo SERVIDOR: %servidor% - PORTA: %porta% - PASTA DESTINO: %pathbkp%
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - INICIADO BACKUP! SERVIDOR: %servidor% - PORTA: %porta% - PASTA DESTINO: %pathbkp%>>%LOG%
backup.exe %servidor% %porta% %pathbin% %pathbkp% %cliente%
echo.
type %PATHBKP%\BKP_%DIA%_%MES%_%ANO%_%CLIENTE%\log_backup_%DIA%_%MES%_%ANO%.log>>%LOG%
IF EXIST %PATHBKP%\BKP_%DIA%_%MES%_%ANO%_%CLIENTE%\log_backup_%DIA%_%MES%_%ANO%.log copy %PATHBKP%\databases.txt %PATHBKP%\BKP_%DIA%_%MES%_%ANO%_%CLIENTE% /v /y>nul
echo.
pause
GOTO :INICIO

::OPÇÃO 6
:RESTORE
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - RESTORE>>%LOG%
:PARAMETROS_RESTORE
cls
echo. 
set /p SERVIDOR=SERVIDOR: 
echo.
set /p PORTA=PORTA: 
cls
echo. 
set /p USER=USUARIO: 
:SENHA_RESTORE
cls
set SENHA=null
set RSENHA=null
echo.
echo DIGITE A SENHA E PRESSIONE ENTER:
getpass.exe>%tmp%\passwd
for /f "tokens=1" %%a in (%tmp%\passwd) do set SENHA=%%a
cls
echo.
echo DIGITE A SENHA NOVAMENTE:
getpass.exe>%tmp%\passwd
for /f "tokens=1" %%a in (%tmp%\passwd) do set RSENHA=%%a
del "%tmp%\passwd" /q>nul
IF %senha%==null GOTO SENHA_RESTORE
IF %rsenha%==null GOTO SENHA_RESTORE
IF %senha%==%rsenha% ( GOTO PATHBKP_RESTORE ) ELSE ( echo SENHAS NAO CONFEREM!&&echo.&&pause&&GOTO SENHA_RESTORE)

:PATHBKP_RESTORE
cls
set PATHBKP_RESTORE=null
echo.
set /p PATHBKP_RESTORE=LOCAL DO BACKUP (Ex.: c:\backup_escriba\BKP_%DIA%_%MES%_%ANO%): 
IF %PATHBKP_RESTORE%=="null" (echo.&&echo FAVOR INFORMAR O LOCAL DO BACKUP PARA RESTAURAR!&&echo.&&pause&&goto PATHBKP_RESTORE)
IF NOT EXIST %PATHBKP_RESTORE% (echo.&&echo PASTA "%PATHBKP_RESTORE%" NAO ENCONTRADA!&&echo.&&pause&&goto PATHBKP_RESTORE) 
IF NOT EXIST %PATHBKP_RESTORE%\databases.txt (echo.&&echo ARQUIVO "%PATHBKP_RESTORE%\databases.txt" NAO ENCONTRADO, NECESSARIO PARA EXECUTAR O RESTORE!&&echo.&&pause&&goto PATHBKP_RESTORE)

:CONFIRMA_RESTORE
set op=0
echo.
echo SERVIDOR: %SERVIDOR% PORTA: %PORTA%
echo USUARIO: %USER%
echo PASTA DE BACKUP: %PATHBKP_RESTORE%
echo.
echo DATABASES:
echo --------------------------------------------------------
type %PATHBKP_RESTORE%\databases.txt
echo.
echo --------------------------------------------------------
echo.
echo [1]SIM
echo [2]NAO
echo.
set /p OP=DESEJA FAZER RESTORE CONFORME DADOS ACIMA? 
if %op%==1 call :GO_RESTORE
if %op%==2 call :PARAMETROS_RESTORE
if %op%==0 (echo.&&echo OPCAO INVALIDA!&&goto CONFIRMA_RESTORE)
if %op% GEQ 3 (echo.&&echo OPCAO INVALIDA!&&goto CONFIRMA_RESTORE)

:GO_RESTORE
cd > %tmp%\pathbin
for /f "tokens=1" %%a in (%tmp%\pathbin) do set pathbin=%%a
echo.
echo INICIADO RESTORE!
echo.
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - INICIADO RESTORE! SERVIDOR: %servidor% - PORTA: %porta% - PASTA DO BACKUP: %pathbkp_restore%>>%LOG%
type %PATHBKP_RESTORE%\databases.txt>>%LOG%
echo.>>%LOG%
restore.exe %servidor% %porta% %user% %senha% %pathbin% %pathbkp_restore%
type %pathbkp_restore%\log_import_%DIA%_%MES%_%ANO%.log>>%LOG%
echo.
pause
GOTO :INICIO

:FIM
echo %DIA%_%MES%_%ANO%_%time:~0,2%_%time:~3,2% - FINALIZADO!>>%LOG%
echo ###########################################################################################################>>%LOG%
certutil -hashfile %log% MD5>>log_mysqlsupport_%cliente%_%DIA%_%MES%_%ANO%.md5
echo.
echo FINALIZANDO...
echo.
timeout /t 2 /nobreak
exit