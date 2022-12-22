UNINSTALL="pm uninstall -k --user 0"

 # add a # before the package to dont uninstall it
 
PACKAGES=(

# google
"com.google.android.partnersetup" 
"com.android.printspooler" 
"com.android.calllogbackup" 
"com.google.android.tts" 
"com.google.android.feedback" 
"com.google.android.printservice.recommendation" 
"com.google.android.googlequicksearchbox" 
"com.android.bips" 
"com.android.providers.partnerbookmarks" 
"com.android.bookmarkprovider" 
"com.google.android.music" 
"com.google.android.videos" 
"com.google.android.projection.gearhead" 
## keep it - Duo ## "com.google.android.apps.tachyon"
"com.google.android.apps.turbo" 
## keep it - Maps ## "com.google.android.apps.maps"
"com.google.audio.hearing.visualization.accessibility.scribe" 
#"com.google.android.gm" GMAIL
#"com.google.android.apps.docs" DRIVE
#"com.google.android.apps.photos" PHOTOS

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
