@Echo off

:Author
color 0F
ECHO	  #################################################################
ECHO      #                                                               #
ECHO	  # Alaa Kesbeh - Timezone Script Jordan                          #
ECHO      #                                                               #
ECHO	  #################################################################
pause
cls

:Title
color 0E
ECHO  ************************************************************																								   
ECHO    -: COMPATIBLE WITH WINDOWS 10 21H2 / 22H2:-                                                                                                                																											  
ECHO  ************************************************************
pause
cls

:TAKEOWNERSHIP 
color 0A
net stop W32Time /y
takeown /f %windir%\System32\tzres.dll 
icacls %windir%\System32\tzres.dll /grant administrators:F
rename %windir%\System32\tzres.dll tzres.backup
@cls


:start
color F1
@ECHO off
ECHO  Pleae select one of the options
ECHO  ----------------------------------------------------------------------------------------------------------------------
ECHO  1 For Windows 10
ECHO  Q Quit (will not work if you choose this option)
ECHO  ----------------------------------------------------------------------------------------------------------------------

SET /p option=Please enter one of the options:

if %option%==1  ( goto :WindowsTen )		else set /a er=1
if %option%==Q  ( goto :ForExit )		else set /a er=er+1


:WindowsTen
Color 0B
xcopy "tzres.dll" %windir%\system32 /z /y
net start W32Time /y
(
ECHO Task Completed Successfully
)
@pause
cls
goto forexit	

:forexit

ECHO    *************************																								   
ECHO      PRESS ANY KEY TO EXIT                                                                                                                																											  
ECHo    *************************
pause
Exit
