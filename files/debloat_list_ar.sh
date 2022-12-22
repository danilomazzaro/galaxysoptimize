UNINSTALL="pm uninstall -k --user 0"

 # add a # before the package to dont uninstall it
 
PACKAGES=(

# ar
"com.samsung.android.ardrawing" 
"com.samsung.android.arzone" 
"com.google.ar.core" 
"com.samsung.android.aremoji" 
"com.samsung.android.aremojieditor" 
"com.sec.android.mimage.avatarstickers" 
"com.sec.android.autodoodle.service" 
"com.samsung.android.livestickers" 
"com.samsung.android.app.camera.sticker.facearavatar.preload"
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
