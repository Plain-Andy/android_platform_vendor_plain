#!/system/bin/sh
if [ -e /sdcard/plaintweak ]
then
cp /sdcard/plaintweak /data/local/tmp/plaintweak
chmod 0775 /data/local/tmp/plaintweak
. /data/local/tmp/plaintweak

if [ -z $tcpcong ]
then
setprop tcpcong $(cat /proc/sys/net/ipv4/tcp_congestion_control)
else
setprop tcpcong $tcpcong
echo $tcpcong > /proc/sys/net/ipv4/tcp_congestion_control
fi

if [ -z $scheduler ]
then
setprop scheduler $(cat /sys/block/mmcblk0/queue/scheduler | sed 's/.*[[]//g' | sed 's/[]].*//g')
else
setprop scheduler $scheduler
echo $scheduler > /sys/block/mmcblk0/queue/scheduler
fi

if [ -z $gov ]
then
setprop gov $(ls /sys/devices/system/cpu/cpufreq)
else
setprop gov $gov
echo $gov > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
if [ -d "/sys/devices/system/cpu/cpu1/" ]; then
echo $gov > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
fi
if [ -d "/sys/devices/system/cpu/cpu2/" ]; then
echo $gov > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
fi
if [ -d "/sys/devices/system/cpu/cpu3/" ]; then
echo $gov > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
fi
fi

if [ -z $minkhz ]
then
setprop minkhz $(cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq)
else
setprop minkhz $minkhz
echo $minkhz > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
if [ -d "/sys/devices/system/cpu/cpu1/" ]; then
echo $minkhz > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
fi
if [ -d "/sys/devices/system/cpu/cpu2/" ]; then
echo $minkhz > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
fi
if [ -d "/sys/devices/system/cpu/cpu3/" ]; then
echo $minkhz > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
fi
fi

if [ -z $maxkhz ]
then
setprop maxkhz $(cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq)
else
setprop maxkhz $maxkhz
echo $maxkhz > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
if [ -d "/sys/devices/system/cpu/cpu1/" ]; then
echo $maxkhz > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
fi
if [ -d "/sys/devices/system/cpu/cpu2/" ]; then
echo $maxkhz > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
fi
if [ -d "/sys/devices/system/cpu/cpu3/" ]; then
echo $maxkhz > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
fi
fi

else
setprop tcpcong $(cat /proc/sys/net/ipv4/tcp_congestion_control)
setprop scheduler $(cat /sys/block/mmcblk0/queue/scheduler | sed 's/.*[[]//g' | sed 's/[]].*//g')
setprop gov $(ls /sys/devices/system/cpu/cpufreq)
setprop minkhz $(cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq)
setprop maxkhz $(cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq)
fi
echo "TCP Cong is"$(getprop tcpcong) > /data/local/tmp/plaintweak.log 
echo "Scheduler is"$(getprop scheduler) >> /data/local/tmp/plaintweak.log
echo "Governor is"$(getprop gov) >> /data/local/tmp/plaintweak.log
echo "Minkhz is"$(getprop minkhz) >> /data/local/tmp/plaintweak.log
echo "Maxkhz is"$(getprop maxkhz) >> /data/local/tmp/plaintweak.log
