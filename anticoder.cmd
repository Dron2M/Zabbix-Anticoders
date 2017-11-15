@rem *******************************************
@rem create HoneyPot checking files on filesystem
@rem create virus epidemic checking files
@rem make in C:\Program Files\Zabbix Agent folder flag file .sys  
@rem for readiness verification to starting  triggers on zabbix server
@rem author: Andrey Margulis
@rem antidecry.cmd
@rem *******************************************

@rem Create Bad rabbit check files
IF NOT EXIST c:\Windows\infpub.dat (
ECHO .>c:\Windows\infpub.dat && attrib +r c:\Windows\infpub.dat 
)
IF NOT EXIST c:\Windows\cscc.dat (
ECHO .>c:\Windows\cscc.dat && attrib +r c:\Windows\cscc.dat 
)

@rem clear old version, if some updatees
 RD /S /Q c:\Ahoney
 RD /S /Q c:\Wfile
 
@rem Is not exist, create Honey folders 
IF NOT EXIST c:\Ahoney GOTO :MakeHoney
IF NOT EXIST c:\Wfile  GOTO :MakeHoney
GOTO :NoMake
:MakeHoney
PUSHD "\\dc-1\ADStore\ZabbixScripts\Honey" && (
 XCOPY * "c:\Ahoney\" /S /C /Q /O /Y
 XCOPY * "c:\Wfile\" /S /C /Q /O /Y)
)
POPD 
:NoMake

@rem if some errors, delete sucess flag file
IF %errorlevel% NEQ 0 (
DEL /F /Q "C:\Program Files\Zabbix Agent\honeyrun.sys"
)ELSE IF %errorlevel% EQU 0 (
@rem if all files created sucessfull, make flag file
IF NOT EXIST "C:\Program Files\Zabbix Agent\honeyrun.sys" ECHO anticoder_Flag>"C:\Program Files\Zabbix Agent\honeyrun.sys"
)
