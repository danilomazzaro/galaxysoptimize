UNINSTALL="pm uninstall -k --user 0"

 # add a # before the package to dont uninstall it
 
PACKAGES=( 

# these apps can be found in some region firmwares
"com.linkedin.android" 
"com.mygalaxy" 
"com.eterno" 
"com.opera.max.oem" 
"com.opera.max.preinstall" 
"com.aura.oobe.samsung" 
"com.samsung.logwriter" 
"com.samsung.android.easysetup" 
"com.samsung.storyservice" 
"com.samsung.android.airtel.stubapp" 
"com.samsung.android.spaymini" 
"com.sec.android.widgetapp.samsungapps" 
"com.sec.android.widgetapp.webmanual" 
"com.samsung.visionprovider" 
"com.samsung.android.mfi" 
"com.sec.android.app.chromecustomizations" 
"com.samsung.android.uds" 

# sim
"com.android.stk" 
"com.android.stk2" 

# other
"com.android.dreams.basic" 
"com.android.egg" 
"flipboard.boxer.app" 
## keep it - non-root only (will be reinstalled on next boot) - Software update ## "com.wssyncmldm"
## keep it - non-root only (will be reinstalled on next boot) - Work Setup ## "com.android.managedprovisioning"
#"com.spotify.music" 
"co.benx.weverse" 

)

cd /data/local/tmp

for pkg in "${PACKAGES[@]}"
do
	apkpath=`pm path $pkg | cut -b 9-`
	if [ ! -z "$apkpath" -a "$apkpath" != "" ]; then
		label=`./aapt_arm_pie d badging $apkpath | grep application-label: | cut -b 19- | sed -e 's/^.//' -e 's/.$//'`
		if [ "$label" == "" ]; then
			label="NULL OR EMPTY"
		fi
		
		echo "- $label ($pkg)"
		${UNINSTALL} $pkg 2> /dev/null || true
		if [ "$?" == "1" ]; then
			echo "  Successfully uninstalled!"
		else
			echo "  Not installed or already uninstalled!"
		fi
	fi
done

exit 0
