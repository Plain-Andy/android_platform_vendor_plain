#!/system/bin/sh
if [ -e /sdcard/plaintweak ]
then
cp /sdcard/plaintweak /data/local/tmp/plaintweak
chmod 0775 /data/local/tmp/plaintweak
. /data/local/tmp/plaintweak

#Define them twice for compatibility with older plain-tweak files and settings->about 
if [ -z $tcpcong ]
then
tcpcong=$(cat /proc/sys/net/ipv4/tcp_congestion_control)
else
setprop tcpcong $tcpcong
fi

if [ -z $scheduler ]
then
scheduler=$(cat /sys/block/mmcblk0/queue/scheduler | sed 's/.*[[]//g' | sed 's/[]].*//g')
else
setprop scheduler $scheduler
fi

if [ -z $gov ]
then
gov=$(ls /sys/devices/system/cpu/cpufreq)
else
setprop gov $gov
fi

if [ -z $minkhz ]
then
minkhz=$(cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq)
else
setprop minkhz $minkhz
fi

if [ -z $maxkhz ]
then
maxkhz=$(cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq)
else
setprop maxkhz $maxkhz
fi

echo $tcpcong > /proc/sys/net/ipv4/tcp_congestion_control
echo $scheduler > /sys/block/mmcblk0/queue/scheduler
echo $gov > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo $minkhz > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo $maxkhz > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq

if [ -d "/sys/devices/system/cpu/cpu1/" ]; then
echo $gov > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo $minkhz > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
echo $maxkhz > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
fi

if [ -d "/sys/devices/system/cpu/cpu2/" ]; then
echo $gov > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo $minkhz > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
echo $maxkhz > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
fi

if [ -d "/sys/devices/system/cpu/cpu3/" ]; then
echo $gov > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo $minkhz > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
echo $maxkhz > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
fi

else
setprop tcpcong $(cat /proc/sys/net/ipv4/tcp_congestion_control)
setprop scheduler $(cat /sys/block/mmcblk0/queue/scheduler | sed 's/.*[[]//g' | sed 's/[]].*//g')
setprop gov $(ls /sys/devices/system/cpu/cpufreq)
setprop minkhz $(cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq)
setprop maxkhz $(cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq)
fi
