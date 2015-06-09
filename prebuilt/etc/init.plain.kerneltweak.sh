#!/system/bin/sh
sysrw
restoreconfig(){
cat /sdcard/plaintweak > /vendor/build.prop
}
propcompare(){
if [ ! -e /vendor/build.prop ]; then
restoreconfig
fi
. /sdcard/plaintweak
echo "IO Scheduler"
sed -i '/scheduler/d' /vendor/build.prop
if [ ! -z $scheduler ]; then
setprop scheduler $scheduler
else
setprop scheduler $(getprop stockscheduler)
fi
echo 'scheduler='$(getprop scheduler) >> /vendor/build.prop
echo "set for "$(getprop scheduler)

echo "TCP Congestion control"
sed -i '/tcpcong/d' /vendor/build.prop
if [ ! -z $tcpcong ]; then
setprop tcpcong $tcpcong
else
setprop tcpcong $(getprop stocktcpcong)
fi
echo 'tcpcong='$(getprop tcpcong) >> /vendor/build.prop
echo "set for "$(getprop tcpcong)

echo "Minkhz 1st set"
sed -i '/minkhz/d' /vendor/build.prop
if [ ! -z $minkhz ]; then
setprop minkhz $minkhz
else
setprop minkhz $(getprop stockminkhz)
fi
echo 'minkhz='$(getprop minkhz) >> /vendor/build.prop
echo "set for "$(getprop minkhz)

echo "Minkhz 2nd set"
sed -i '/minkhz2/d' /vendor/build.prop
if [ ! -z $minkhz2 ]; then
setprop minkhz2 $minkhz2
else
setprop minkhz2 $(getprop stockminkhz)
fi
echo 'minkhz2='$(getprop minkhz2) >> /vendor/build.prop
echo "set for "$(getprop minkhz2)

echo "Gov 1st set"
sed -i '/gov/d' /vendor/build.prop
if [ ! -z $gov ]; then
setprop gov $gov
else
setprop gov $(getprop stockgov)
fi
echo 'gov='$(getprop gov) >> /vendor/build.prop
echo "set for "$(getprop gov)

echo "Gov 2nd set"
sed -i '/gov2/d' /vendor/build.prop
if [ ! -z $gov2 ]; then
setprop gov2 $gov2
else
setprop gov2 $(getprop stockgov)
fi
echo 'gov2='$(getprop gov2) >> /vendor/build.prop
echo "set for "$(getprop gov2)

echo "Max Khz 1st set"
sed -i '/maxkhz/d' /vendor/build.prop
if [ ! -z $maxkhz ]; then
setprop maxkhz $maxkhz
else
setprop maxkhz $(getprop stockmaxkhz)
fi
echo 'maxkhz='$(getprop maxkhz) >> /vendor/build.prop
echo "set for "$(getprop maxkhz)

echo "Max Khz 2nd set"
sed -i '/maxkhz2/d' /vendor/build.prop
if [ ! -z $maxkhz2 ]; then
setprop maxkhz2 $maxkhz2
else
setprop maxkhz2 $(getprop stockmaxkhz)
fi
echo 'maxkhz2='$(getprop maxkhz2) >> /vendor/build.prop
echo "set for "$(getprop maxkhz2)
}
main(){
echo "Plain-Tweak online; Starting service"
echo $(getprop tcpcong) > /proc/sys/net/ipv4/tcp_congestion_control
echo $(getprop scheduler) > /sys/block/mmcblk0/queue/scheduler
echo $(getprop gov) > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo $(getprop minkhz) > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo $(getprop maxkhz) > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
}
if [[ $(getprop enable_plaintweak) == "1" ]]; then
propcompare
main
else
setprop tcpcong $(getprop stocktcpcong)
setprop scheduler $(getprop stockscheduler)
setprop gov $(getprop stockgov)
setprop minkhz $(getprop stockminkhz)
setprop maxkhz $(getprop stockmaxkhz)
setprop maxkhz2 $(getprop stockmaxkhz)
setprop minkhz2 $(getprop stockminkhz)
setprop gov2 $(getprop stockgov)
main
fi
exit
