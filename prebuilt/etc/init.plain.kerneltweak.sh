#!/system/bin/sh
sysrw
restoreconfig(){
mkdir -p /vendor/overlay/
cat /sdcard/plaintweak > /vendor/overlay/local.prop
}
propcompare(){
if [ ! -e /vendor/overlay/local.prop ]; then
restoreconfig
fi
. /sdcard/plaintweak
echo "IO Scheduler"
if [ ! -z $scheduler ]; then
(if [[ $scheduler != $(getprop scheduler) ]]; then
sed -i '/scheduler/d' /vendor/overlay/local.prop
echo 'scheduler='$scheduler >> /vendor/overlay/local.prop
setprop scheduler $scheduler
fi)
else
setprop scheduler $(getprop stockscheduler)
fi
echo "set for "$(getprop scheduler)

echo "TCP Congestion control"
if [ ! -z $tcpcong ]; then
(if [[ $tcpcong != $(getprop tcpcong) ]]; then
sed -i '/tcpcong/d' /vendor/overlay/local.prop
echo 'tcpcong='$tcpcong >> /vendor/overlay/local.prop
setprop tcpcong $tcpcong
fi)
else
setprop tcpcong $(getprop stocktcpcong)
fi
echo "set for "$(getprop tcpcong)

echo "Minkhz 1st set"
if [ ! -z $minkhz ]; then
(if [[ $minkhz != $(getprop minkhz) ]]; then
sed -i '/minkhz/d' /vendor/overlay/local.prop
echo 'minkhz='$minkhz >> /vendor/overlay/local.prop
setprop minkhz $minkhz
fi)
else
setprop minkhz $(getprop stockminkhz)
fi
echo "set for "$(getprop minkhz)

echo "Minkhz 2nd set"
if [ ! -z $minkhz2 ]; then
(if [[ $minkhz2 != $(getprop minkhz2) ]]; then
sed -i '/minkhz2/d' /vendor/overlay/local.prop
setprop minkhz2 $minkhz2
echo 'minkhz2='$minkhz2 >> /vendor/overlay/local.prop
fi)
else
setprop minkhz2 $(getprop stockminkhz)
fi
echo "set for "$(getprop minkhz2)

echo "Gov 1st set"
if [ ! -z $gov ]; then
(if [[ $gov != $(getprop gov) ]]; then
sed -i '/gov/d' /vendor/overlay/local.prop
echo 'gov='$gov >> /vendor/overlay/local.prop
setprop gov $gov
fi
)
else
setprop gov $(getprop stockgov)
fi
echo "set for "$(getprop gov)

echo "Gov 2nd set"
if [ ! -z $gov2 ]; then
(if [ $gov2 != $(getprop gov2) ]; then
sed -i '/gov2/d' /vendor/overlay/local.prop
echo 'gov2='$gov2 >> /vendor/overlay/local.prop
setprop gov2 $gov2
fi)
else
setprop gov2 $(getprop stockgov)
fi
echo "set for "$(getprop gov2)

echo "Max Khz 1st set"
if [ ! -z $maxkhz ]; then
(if [ $maxkhz != $(getprop maxkhz) ]; then
sed -i '/maxkhz/d' /vendor/overlay/local.prop
echo 'maxkhz='$maxkhz >> /vendor/overlay/local.prop
setprop maxkhz $maxkhz
fi)
else
setprop maxkhz $(getprop stockmaxkhz)
fi
echo "set for "$(getprop maxkhz)

echo "Max Khz 2nd set"
if [ ! -z $maxkhz2 ]; then
(if [ $maxkhz2 != $(getprop maxkhz2) ]; then
sed -i '/maxkhz2/d' /vendor/overlay/local.prop
echo 'maxkhz2='$maxkhz2 >> /vendor/overlay/local.prop
setprop maxkhz2 $maxkhz2
fi)
else
setprop maxkhz2 $(getprop stockmaxkhz)
echo "set for "$(getprop maxkhz2)
fi
}
main(){
echo "Plain-Tweak online; Starting service"
echo $(getprop tcpcong) > /proc/sys/net/ipv4/tcp_congestion_control
echo $(getprop scheduler) > /sys/block/mmcblk0/queue/scheduler
echo $(getprop gov) > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo $(getprop minkhz) > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo $(getprop maxkhz) > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
}
if [ $(getprop enable_plaintweak) == "0" ]; then
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

if [ $(getprop enable_plaintweak) == "1" ]; then
propcompare
main
fi
exit
