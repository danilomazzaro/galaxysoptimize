@echo off

set ADB=files\adb
set FILES=files
set TMP=/data/local/tmp

%ADB% kill-server
%ADB% start-server
%ADB% wait-for-device

for /F "delims=" %%a in ('%ADB% shell getprop ro.product.model') do set DEVICE=%%a
for /F "delims=" %%a in ('%ADB% shell getprop ril.product_code') do set PRODUCT=%%a
for /F "delims=" %%a in ('%ADB% shell getprop ro.build.display.id') do set FW=%%a
for /F "delims=" %%a in ('%ADB% shell getprop ro.oem.key1') do set CSC=%%a

echo.
echo Detected device: %DEVICE% (%PRODUCT%)
echo Firmware: %FW% (%CSC%)

echo.
echo This script will remove the bloatware on ONEUI 5 on any S20, S21 and S22 variant, except S22 Ultra (because this will disable the SPEN features).
echo You can choose wich item the script will remove. Type "y" to REMOVE the selected item, or "n" for DON'T REMOVE.

echo.
pause

echo.
echo Setting some files. . .
%ADB% shell rm -f %TMP%/aapt_arm_pie > NUL 2> NUL
%ADB% shell rm -f %TMP%/debloat_list.sh > NUL 2> NUL
%ADB% push %FILES%/aapt_arm_pie %TMP% > NUL 2> NUL
%ADB% push %FILES%/debloat_list_microsoft.sh %TMP% > NUL 2> NUL
%ADB% push %FILES%/debloat_list_netflix.sh %TMP% > NUL 2> NUL
%ADB% push %FILES%/debloat_list_fb.sh %TMP% > NUL 2> NUL
%ADB% push %FILES%/debloat_list_google.sh %TMP% > NUL 2> NUL
%ADB% push %FILES%/debloat_list_dex.sh %TMP% > NUL 2> NUL
%ADB% push %FILES%/debloat_list_ant.sh %TMP% > NUL 2> NUL
%ADB% push %FILES%/debloat_list_bixby.sh %TMP% > NUL 2> NUL
%ADB% push %FILES%/debloat_list_ar.sh %TMP% > NUL 2> NUL
%ADB% push %FILES%/debloat_list_sammy_junk.sh %TMP% > NUL 2> NUL
%ADB% push %FILES%/debloat_list_junk.sh %TMP% > NUL 2> NUL
%ADB% push %FILES%/debloat_list_game.sh %TMP% > NUL 2> NUL
%ADB% push %FILES%/debloat_list_wellbeing.sh %TMP% > NUL 2> NUL
%ADB% push %FILES%/debloat_list_ledcover.sh %TMP% > NUL 2> NUL
%ADB% shell chmod 0755 %TMP%/aapt_arm_pie
%ADB% shell chmod 0777 %TMP%/debloat_list_microsoft.sh
%ADB% shell chmod 0777 %TMP%/debloat_list_netflix.sh
%ADB% shell chmod 0777 %TMP%/debloat_list_fb.sh
%ADB% shell chmod 0777 %TMP%/debloat_list_google.sh
%ADB% shell chmod 0777 %TMP%/debloat_list_dex.sh
%ADB% shell chmod 0777 %TMP%/debloat_list_ant.sh
%ADB% shell chmod 0777 %TMP%/debloat_list_bixby.sh
%ADB% shell chmod 0777 %TMP%/debloat_list_ar.sh
%ADB% shell chmod 0777 %TMP%/debloat_list_sammy_junk.sh
%ADB% shell chmod 0777 %TMP%/debloat_list_junk.sh
%ADB% shell chmod 0777 %TMP%/debloat_list_game.sh
%ADB% shell chmod 0777 %TMP%/debloat_list_wellbeing.sh
%ADB% shell chmod 0777 %TMP%/debloat_list_ledcover.sh

echo.
echo .
echo.
set /P c1=Remove Microsoft apps, like office?(You can reinstall it from Play Store)[Y/N]?
set /P c2=Remove Netflix app and partner services?(You can reinstall it from Play Store)[Y/N]?
set /P c3=Remove Facebook and bloatware services?(You can reinstall it from Play Store)[Y/N]?
set /P c4=Remove UNUSUAL Google apps like bookmarprovider, docs?(This CANNOT AFFECT your google services like location, accounts and etc)[Y/N]?
set /P c5=Remove DEX?(You cannot have DEX anymore)[Y/N]?
set /P c6=Remove ANT?(If you wont know about it, you can unistall it safely)[Y/N]?
set /P c7=Remove Bixby?(Voce ainda tera a bixby routines, mas nao mais a assistente)[Y/N]?
set /P c8=Remove AR Camera Stickers?(You wont have AR sticker on your camera app)[Y/N]?
set /P c9=Fix Adaptative brightness bug on ONE UI 4.1? (increase autobrightness responsivity and extending SOT)[Y/N]?
set /P c10=Remove Game Launcher and gaming tools (It's high recomended remove if you arent a gamer)[Y/N]?
set /P c11=Remove Digital Wellbeing (You cannot reinstall it over Store)[Y/N]?
set /P c12=Remove Ledcover suport (uninstal if you dont have a Led cover case[Y/N]?

echo.
echo Applying Selected Options. . .
echo.

if /I "%c1%" EQU "Y" %ADB% shell sh %TMP%/debloat_list_microsoft.sh
if /I "%c2%" EQU "Y" %ADB% shell sh %TMP%/debloat_list_netflix.sh
if /I "%c3%" EQU "Y" %ADB% shell sh %TMP%/debloat_list_fb.sh
if /I "%c4%" EQU "Y" %ADB% shell sh %TMP%/debloat_list_google.sh
if /I "%c5%" EQU "Y" %ADB% shell sh %TMP%/debloat_list_dex.sh
if /I "%c6%" EQU "Y" %ADB% shell sh %TMP%/debloat_list_ant.sh
if /I "%c7%" EQU "Y" %ADB% shell sh %TMP%/debloat_list_bixby.sh
if /I "%c8%" EQU "Y" %ADB% shell sh %TMP%/debloat_list_ar.sh
if /I "%c9%" EQU "Y" echo Disabling camera light sensor...
if /I "%c9%" EQU "Y" %ADB% shell pm disable-user --user 0 com.samsung.adaptivebrightnessgo
%ADB% shell sh %TMP%/debloat_list_sammy_junk.sh
%ADB% shell sh %TMP%/debloat_list_junk.sh
if /I "%c10%" EQU "Y" %ADB% shell sh %TMP%/debloat_list_game.sh
if /I "%c11%" EQU "Y" %ADB% shell sh %TMP%/debloat_list_wellbeing.sh
if /I "%c12%" EQU "Y" %ADB% shell sh %TMP%/debloat_list_ledcover.sh
%ADB% shell dumpsys deviceidle whitelist +com.google.android.providers.media.module
%ADB% shell dumpsys deviceidle whitelist +com.google.android.gms

echo.
echo Debloating. . .
%ADB% shell rm -f %TMP%/aapt_arm_pie > NUL 2> NUL
%ADB% shell rm -f %TMP%/debloat_list_microsoft.sh > NUL 2> NUL
%ADB% shell rm -f %TMP%/debloat_list_netflix.sh > NUL 2> NUL
%ADB% shell rm -f %TMP%/debloat_list_fb.sh > NUL 2> NUL
%ADB% shell rm -f %TMP%/debloat_list_google.sh > NUL 2> NUL
%ADB% shell rm -f %TMP%/debloat_list_dex.sh > NUL 2> NUL
%ADB% shell rm -f %TMP%/debloat_list_ant.sh > NUL 2> NUL
%ADB% shell rm -f %TMP%/debloat_list_bixby.sh > NUL 2> NUL
%ADB% shell rm -f %TMP%/debloat_list_ar.sh > NUL 2> NUL
%ADB% shell rm -f %TMP%/debloat_list_sammy_junk.sh > NUL 2> NUL
%ADB% shell rm -f %TMP%/debloat_list_junk.sh > NUL 2> NUL
%ADB% shell rm -f %TMP%/debloat_list_game.sh > NUL 2> NUL
%ADB% shell rm -f %TMP%/debloat_list_wellbeing.sh > NUL 2> NUL
%ADB% shell rm -f %TMP%/debloat_list_ledcover.sh > NUL 2> NUL

if "%DEVICE%"=="%DEVICE:S908=%" ( 
	echo You aren't a S22Ultra user, disabling SPEN integrations
	%ADB% shell pm uninstall -k --user 0 com.samsung.android.aircommandmanager

) else (
    echo You have a S22 Ultra, skiping some packages
)

echo.
echo Finished!

echo.
echo Rebooting your device. . .

echo.
echo Extra tip: If you are a Aways on Display user, disable AOD autobrightness will extend your battery life too. . .

%ADB% reboot
%ADB% kill-server

echo.
pause
