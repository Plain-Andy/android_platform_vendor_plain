#!/system/bin/sh
backupbuildprop() {
	cp /system/build.prop /system/.build.prop-original
}

restorebuildprop() {
	cp /system/.build.prop-original /system/build.prop
}
bootanim() {
	case "$setbootanim" in
	enable)
		sed -i -e '/debug.sf.nobootanimation=1/d' /system/build.prop
		if [ -e /tmp/recovery.log ]; then
		echo "Enabled boot animations from Aroma" >> /tmp/recovery.log
		else
		echo -n '\03 Build-Prop Tweaks\0 Enabled boot animations\0' > /dev/log/main
		sysro
		fi
		echo "Enabled boot animations"
	;;
	disable)
		echo "debug.sf.nobootanimation=1" >> /system/build.prop
		if [ -e /tmp/recovery.log ]; then
		echo "Disabled boot animations from Aroma" >> /tmp/recovery.log
		else
		echo -n '\03 Build-Prop Tweaks\0 Disabled boot animations\0' > /dev/log/main
		sysro
		fi
		echo "Disabled boot animations"
	;;
	esac
}

density() {
	case "$setdensity" in
		stock)
		rm /sdcard/customdensity
		if [ -e /tmp/recovery.log ]; then
		echo $setdensity" is density obtained from Aroma" >> /tmp/recovery.log
		else
		echo -n '\03 Build-Prop Tweaks\0 Set '$customdensity' as new custom density\0' > /dev/log/main
		fi
		if [ ! -e /tmp/recovery.log ]; then
		sysro
		fi
		;;
		*)
		echo 'customdensity='$setdensity > /sdcard/customdensity
		if [ -e /tmp/recovery.log ]; then
		echo $setdensity" is density obtained from Aroma" >> /tmp/recovery.log
		else
		echo -n '\03 Build-Prop Tweaks\0 Set '$customdensity' as new custom density\0' > /dev/log/main
		fi
		if [ ! -e /tmp/recovery.log ]; then
		sysro
		fi
		;;
	esac
}
if [ ! -e /tmp/recovery.log ]; then
sysrw
fi
case "$1" in
  density)
    setdensity=$2
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
