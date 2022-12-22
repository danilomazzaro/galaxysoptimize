UNINSTALL="pm uninstall -k --user 0"

 # add a # before the package to dont uninstall it
 
PACKAGES=(

# knox
## keep it - non-root only - "com.sec.enterprise.knox.attestation" 
## keep it - non-root only - "com.sec.enterprise.knox.cloudmdm.smdms" 
## keep it - non-root only - "com.samsung.android.knox.containercore" 
## keep it - non-root only - "com.knox.vpn.proxyhandler" 
## keep it - non-root only - "com.samsung.android.knox.analytics.uploader" 
## keep it - non-root only - "com.samsung.knox.keychain" 
## keep it - non-root only - "com.samsung.knox.securefolder" 
## keep it - non-root only - "com.samsung.android.knox.attestation" 


)

# keep apps bellow installed to prevent "ExecutionCriteria: Package unavailable for Task" error
# triggered by: com.google.android.gms/com.google.android.gms.persistent (Google Play Services)
# ---------------------------------------------------------------------------------------------
# "com.google.android.youtube" (YouTube)
# "com.google.android.apps.tachyon" (Duo)
# "com.google.android.apps.maps" (Maps)
# ---------------------------------------------------------------------------------------------

cd /data/local/tmp

# traverse all the packages in
# the list and uninstall them!
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
