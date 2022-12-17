# galaxysoptimize
A simplified way to smart debloat and optimize your galaxy S20, S21 and S22

Extend your battery life - Smart debloat and optimize ONE UI (works too on all S20, S21 and S22, except S22U).

***Works on ONE UI 4, 4.1 and 5 for all versions of s20, s21 and s22 (except for S22U)***

Due to some bad optimizations by Samsung , we are facing a lot of battery issues and a couple of random lags. With this script, I have got something between 7h and 9h of SOT.

In a few tests in Brazil, the users are getting a much better battery life. This script have some things like:

=> Removing items that can sometimes be undesirable according to the user, so you can select wich services will be disabled, such as bixby, AR camera features, microsoft apps, google apps (not the main like gmail and photos, but the secondary ones like bookmar provider, docs), ANT (there are people who don't even know what it is so this is usually useless here in Brazil).

=> Disable the Camera Light Sensor in S20 variant which is a bug on One UI 4.0 and 4.1, galaxy S have a light sensor to calculate the automatic brightness, however, since One UI 4.0 it ends up using the front camera for this, annihilating the screen time of the device. When camera light sensor are disbled, the device will properly use the dedicated light sensor and the automatic brightness be more responsive and battery friendly.

=> Enable the option to disable Ram Plus (only on ONE UI 4, ONE UI 5 has builted in natively), where the 0GB option will appear in the options above 2GB, which you can disable if you want (Recomended only on ONE UI 4, because One UI5 comes with disable RAM Plus option available) .

Throughout the script, it will ask which item you want to be removed, so if you use DEX, just answer "n" when it asks if you want to remove it.

Resetting the device to factory defaults will completely reverse everything the script does, so it is not permanent and does not void your device's warranty. If you want, there are a Revert back script too.

The procedure is simple:

In your cellphone:

1 - Enable Developer options and USB Debug:

Go to Settings > About Phone > Software Information click on "build number" several times until it appears that developer mode is enabled.

2 - Now go to Settings > Developer Options and click enable right at the top of the page and look for the USB Debugging option and enable it too.

3 - Connect your phone to the computer and if a window appears asking for permission, grant it (you will be granting permission for your computer to access your phone in developer mode. If it doesn't appear now, no problem, this window may appear later when we run the script, but it usually appears right here.

On your PC:

4 - Download the script:

ONE UI 4.1+: Debloat and optimize Galaxy S20 S21 AND S22 except S22U v2********

ONE UI 5: Debloat and optimize Galaxy S20 S21 AND S22 for ONE UI 5***********

5 - Extract it and run the "debloat and optimize" file (perhaps at that time the aforementioned window will appear on the cell phone asking for permission).

The script will guide you asking for all possible options which are 10:

Remove Microsoft apps?(You can reinstall the app later from the playstore)[Y/N]?

Remove Netflix?(You can reinstall the app later from playstore)[Y/N]?

Remove Facebook?(You can reinstall the app later from playstore)[Y/N]?

Remove Google Apps?(You can reinstall the app later from playstore)[Y/N]?

Remove DEX?(You will no longer have the DEX function)[Y/N]?

Remove ANT?(If you don't know what it is, you can remove it without fear)[Y/N]?

Remove Bixby?(You will still have the bixby routines, but no longer the voice assistant)[Y/N]?

Remove Augmented Reality Functions from Camera?(You will no longer have AR Sticker in Camera)[Y/N]?

Apply adaptive brightness correction? (by disabling the camera light sensor, improving auto brightness response and increasing battery life)[Y/N]?

Enable Ram Plus extra options? (enable options to increase or disable Ram Plus in Settings, Device and Battery Support, Memory) [Y/N]?

6 - When it finishes, the phone will restart. All options can somehow be reversed by downloading the apps from the Play Store again, except for DEX, Bixby and Sticker AR mode, but which can be reversed with another script that I'm still building or resetting your device to factory defaults.

Any doubt I will be available

My personal options are: ONE UI 4 - Y for all except dex (because I use dex, if you won't use, you can safe remove)

ONE UI 5: Y for all except Dex

After the script you can safe reinstall some apps back like Facebook and Google from Playstore, but now this will comes without Samsung bloatware.

Edit1: the link are updated to a new version fixing one hand mode

Edit2: release of a version to apply on ONE UI5.

Edit3: adding some features to improve wich packages you can remove, fixing some packages about region (some reions use Samsung Wallet, another use Samsung Pay) and adding Media provider bug on S21.

and finaly the link to rollback the script: Rebloat ONE UI 4.1+ and 5 (works on ONE UI 5 too) **************
