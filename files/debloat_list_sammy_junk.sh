UNINSTALL="pm uninstall -k --user 0"

 # add a # before the package to dont uninstall it
 
PACKAGES=(


# samsung
## keep it - non-root only (will be reinstalled on next boot) - Game Optimizing Service ## "com.samsung.android.game.gos"
#"com.samsung.android.app.simplesharing" 
#android car "com.samsung.android.drivelink.stub"  
#watch "com.samsung.android.app.watchmanagerstub"
#watch "com.samsung.android.app.watchmanager"
#samsung pass "com.samsung.android.samsungpassautofill" 
#samsung pass "com.samsung.android.samsungpass"
#Spay "com.samsung.android.spayfw" 
#Spay "com.samsung.android.spay" 
#panel edge "com.samsung.android.app.sbrowseredge" 
#apk update "com.sec.android.soagent" 
#nearby devices "com.samsung.android.allshare.service.fileshare" 
#camera extra "com.samsung.android.stickercenter" 
#AR "com.samsung.android.visionarapps" 
#dual messenger "com.samsung.android.da.daagent" 
#Samsung pass "com.samsung.android.tapack.authfw" 
## keep it - non-root only (will be reinstalled on next boot) - Samsung Experience Svc ## "com.samsung.android.mobileservice"
#forget password "com.sec.android.app.parser"
#ledcover "com.sec.android.cover.ledcover"
#ledcover "com.samsung.android.app.ledbackcover"
#find my device "com.samsung.android.fmm" 
"com.samsung.android.service.livedrawing" 
"com.samsung.android.app.spage" 
"com.samsung.android.kidsinstaller" 
#"com.sec.phone" 
"com.sec.android.app.setupwizardlegalprovider" 
#"com.samsung.android.app.reminder" 
"com.samsung.android.authfw" 
#"com.samsung.android.game.gamehome" 
#"com.samsung.android.game.gametools" 
"com.samsung.android.mateagent" 
"com.sec.android.preloadinstaller" 
#"com.samsung.android.scloud"  
"com.samsung.android.app.social"
"com.sec.spp.push" 
"com.samsung.android.svoiceime" 
"com.samsung.android.app.tips" 
"com.samsung.android.emojiupdater" 
#"com.samsung.android.smartfitting" 
"com.enhance.gameservice" 
"com.monotype.android.font.foundation" 
"com.sec.android.app.billing" 
"com.samsung.android.beaconmanager" 
"com.samsung.android.app.omcagent" 
"com.samsung.android.mdecservice" 
"com.samsung.android.allshare.service.mediashare" 
"com.sec.android.app.DataCreate"  
#"com.sec.android.easyonehand" 
"com.sec.factory.camera" 
"com.sec.android.service.health"   
"com.sec.location.nsflp2" 
#"com.samsung.android.coldwalletservice" 
"com.samsung.ucs.agent.ese" 
#"com.samsung.android.icecone" 
"com.samsung.safetyinformation" 
"com.samsung.android.net.wifi.wifiguider" 
"com.samsung.android.forest" 
#"com.samsung.android.mdx" 
"com.samsung.android.rubin.app" 
#"com.samsung.android.aircommandmanager" 
#"com.samsung.android.mdm" 
"com.samsung.android.securitylogagent" 
"com.sec.android.diagmonagent" 
"com.samsung.klmsagent" 
"com.samsung.android.bbc.bbcagent" 
"com.sec.android.usermanual" 
"com.sec.android.app.sbrowser"  
"com.samsung.sree" 
"com.sec.android.app.shealth" 
"com.samsung.android.voc" 
"com.samsung.android.oneconnect" 
"com.samsung.nasb.bts" 
"com.samsung.android.videolist" 
"com.samsung.aasaservice"
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
