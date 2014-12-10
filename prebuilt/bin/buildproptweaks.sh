#!/system/bin/sh
backupbuildprop() {
	cp /system/build.prop /system/.build.prop-original
}

restorebuildprop() {
	cp /system/.build.prop-original /system/build.prop
	rm /system/densitybackup.prop
}
bootanim() {
	case "$setbootanim" in
	enable)
		sed -i -e '/debug.sf.nobootanimation=1/d' /system/build.prop
		echo "Enabled boot animations from Aroma" >> /tmp/recovery.log
	;;
	disable)
		echo "debug.sf.nobootanimation=1" >> /system/build.prop
		echo "Disabled boot animations from Aroma" >> /tmp/recovery.log
	;;
	esac
}

density() {
	case "$setdensity" in
		stock)
		customdensity=$stockdensity
		echo 'customdensity='$customdensity > /sdcard/customdensity
		echo $customdensity" is density obtained from Aroma" >> /tmp/recovery.log
		sed -i -e '/customdensity=/d' /system/build.prop
		sed -i -e '/ro.sf.lcd_density=/d' /system/build.prop
		echo 'ro.sf.lcd_density='$customdensity >> /system/build.prop
		echo 'customdensity='$customdensity >> /system/build.prop
		;;
		180)
		customdensity=180
		echo 'customdensity='$customdensity > /sdcard/customdensity
		echo $customdensity" is density obtained from Aroma" >> /tmp/recovery.log
		sed -i -e '/customdensity=/d' /system/build.prop
		sed -i -e '/ro.sf.lcd_density=/d' /system/build.prop
		echo 'ro.sf.lcd_density='$customdensity >> /system/build.prop
		echo 'customdensity='$customdensity >> /system/build.prop
		;;
		200)
		customdensity=200
		echo 'customdensity='$customdensity > /sdcard/customdensity
		echo $customdensity" is density obtained from Aroma" >> /tmp/recovery.log
		sed -i -e '/customdensity=/d' /system/build.prop
		sed -i -e '/ro.sf.lcd_density=/d' /system/build.prop
		echo 'ro.sf.lcd_density='$customdensity >> /system/build.prop
		echo 'customdensity='$customdensity >> /system/build.prop
		;;
		220)
		customdensity=220
		echo 'customdensity='$customdensity > /sdcard/customdensity
		echo $customdensity" is density obtained from Aroma" >> /tmp/recovery.log
		sed -i -e '/customdensity=/d' /system/build.prop
		sed -i -e '/ro.sf.lcd_density=/d' /system/build.prop
		echo 'ro.sf.lcd_density='$customdensity >> /system/build.prop
		echo 'customdensity='$customdensity >> /system/build.prop
		;;
		240)
		customdensity=240
		echo 'customdensity='$customdensity > /sdcard/customdensity
		echo $customdensity" is density obtained from Aroma" >> /tmp/recovery.log
		sed -i -e '/customdensity=/d' /system/build.prop
		sed -i -e '/ro.sf.lcd_density=/d' /system/build.prop
		echo 'ro.sf.lcd_density='$customdensity >> /system/build.prop
		echo 'customdensity='$customdensity >> /system/build.prop
		;;
		260)
		customdensity=260
		echo 'customdensity='$customdensity > /sdcard/customdensity
		echo $customdensity" is density obtained from Aroma" >> /tmp/recovery.log
		sed -i -e '/customdensity=/d' /system/build.prop
		sed -i -e '/ro.sf.lcd_density=/d' /system/build.prop
		echo 'ro.sf.lcd_density='$customdensity >> /system/build.prop
		echo 'customdensity='$customdensity >> /system/build.prop
		;;
		280)
		customdensity=280
		echo 'customdensity='$customdensity > /sdcard/customdensity
		echo $customdensity" is density obtained from Aroma" >> /tmp/recovery.log
		sed -i -e '/customdensity=/d' /system/build.prop
		sed -i -e '/ro.sf.lcd_density=/d' /system/build.prop
		echo 'ro.sf.lcd_density='$customdensity >> /system/build.prop
		echo 'customdensity='$customdensity >> /system/build.prop
		;;
		300)
		customdensity=300
		echo 'customdensity='$customdensity > /sdcard/customdensity
		echo $customdensity" is density obtained from Aroma" >> /tmp/recovery.log
		sed -i -e '/customdensity=/d' /system/build.prop
		sed -i -e '/ro.sf.lcd_density=/d' /system/build.prop
		echo 'ro.sf.lcd_density='$customdensity >> /system/build.prop
		echo 'customdensity='$customdensity >> /system/build.prop
		;;
		320)
		customdensity=320
		echo 'customdensity='$customdensity > /sdcard/customdensity
		echo $customdensity" is density obtained from Aroma" >> /tmp/recovery.log
		sed -i -e '/customdensity=/d' /system/build.prop
		sed -i -e '/ro.sf.lcd_density=/d' /system/build.prop
		echo 'ro.sf.lcd_density='$customdensity >> /system/build.prop
		echo 'customdensity='$customdensity >> /system/build.prop
		;;
		340)
		customdensity=340
		echo 'customdensity='$customdensity > /sdcard/customdensity
		echo $customdensity" is density obtained from Aroma" >> /tmp/recovery.log
		sed -i -e '/customdensity=/d' /system/build.prop
		sed -i -e '/ro.sf.lcd_density=/d' /system/build.prop
		echo 'ro.sf.lcd_density='$customdensity >> /system/build.prop
		echo 'customdensity='$customdensity >> /system/build.prop
		;;
		360)
		customdensity=360
		echo 'customdensity='$customdensity > /sdcard/customdensity
		echo $customdensity" is density obtained from Aroma" >> /tmp/recovery.log
		sed -i -e '/customdensity=/d' /system/build.prop
		sed -i -e '/ro.sf.lcd_density=/d' /system/build.prop
		echo 'ro.sf.lcd_density='$customdensity >> /system/build.prop
		echo 'customdensity='$customdensity >> /system/build.prop
		;;
		380)
		customdensity=380
		echo 'customdensity='$customdensity > /sdcard/customdensity
		echo $customdensity" is density obtained from Aroma" >> /tmp/recovery.log
		sed -i -e '/customdensity=/d' /system/build.prop
		sed -i -e '/ro.sf.lcd_density=/d' /system/build.prop
		echo 'ro.sf.lcd_density='$customdensity >> /system/build.prop
		echo 'customdensity='$customdensity >> /system/build.prop
		;;
		400)
		customdensity=400
		echo 'customdensity='$customdensity > /sdcard/customdensity
		echo $customdensity" is density obtained from Aroma" >> /tmp/recovery.log
		sed -i -e '/customdensity=/d' /system/build.prop
		sed -i -e '/ro.sf.lcd_density=/d' /system/build.prop
		echo 'ro.sf.lcd_density='$customdensity >> /system/build.prop
		echo 'customdensity='$customdensity >> /system/build.prop
		;;
		420)
		customdensity=420
		echo 'customdensity='$customdensity > /sdcard/customdensity
		echo $customdensity" is density obtained from Aroma" >> /tmp/recovery.log
		sed -i -e '/customdensity=/d' /system/build.prop
		sed -i -e '/ro.sf.lcd_density=/d' /system/build.prop
		echo 'ro.sf.lcd_density='$customdensity >> /system/build.prop
		echo 'customdensity='$customdensity >> /system/build.prop
		;;
		440)
		customdensity=440
		echo 'customdensity='$customdensity > /sdcard/customdensity
		echo $customdensity" is density obtained from Aroma" >> /tmp/recovery.log
		sed -i -e '/customdensity=/d' /system/build.prop
		sed -i -e '/ro.sf.lcd_density=/d' /system/build.prop
		echo 'ro.sf.lcd_density='$customdensity >> /system/build.prop
		echo 'customdensity='$customdensity >> /system/build.prop
		;;
		460)
		customdensity=460
		echo 'customdensity='$customdensity > /sdcard/customdensity
		echo $customdensity" is density obtained from Aroma" >> /tmp/recovery.log
		sed -i -e '/customdensity=/d' /system/build.prop
		sed -i -e '/ro.sf.lcd_density=/d' /system/build.prop
		echo 'ro.sf.lcd_density='$customdensity >> /system/build.prop
		echo 'customdensity='$customdensity >> /system/build.prop
		;;
		480)
		customdensity=480
		echo 'customdensity='$customdensity > /sdcard/customdensity
		echo $customdensity" is density obtained from Aroma" >> /tmp/recovery.log
		sed -i -e '/customdensity=/d' /system/build.prop
		sed -i -e '/ro.sf.lcd_density=/d' /system/build.prop
		echo 'ro.sf.lcd_density='$customdensity >> /system/build.prop
		echo 'customdensity='$customdensity >> /system/build.prop
		;;
	esac
}

if [ ! -e /system/.build.prop-original ]; then
    backupbuildprop
fi
case "$1" in
  density)
    setdensity=$2
    if [ -e /system/densitybackup.prop ]; then
    . /system/densitybackup.prop
    else
    cp /tmp/aroma/currentdensity.prop /system/densitybackup.prop
    . /tmp/aroma/currentdensity.prop
    fi
    sed -i -e '/stockdensity=/d' /system/build.prop
    echo 'stockdensity='$stockdensity >> /system/build.prop
    density
  ;;
  bootanim)
    setbootanim=$2
    bootanim
  ;;
  backupbuildprop)
    backupbuildprop
  ;;
  restorebuildprop)
    restorebuildprop
  ;;
esac
