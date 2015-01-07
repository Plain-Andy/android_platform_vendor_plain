#!/system/bin/sh
if [ -e /sdcard/plaintweak ]
then
cp /sdcard/plaintweak /data/local/tmp/plaintweak
chmod 0775 /data/local/tmp/plaintweak
. /data/local/tmp/plaintweak
if [ -z $tcpcong ]
then
setprop tcpcong $(getprop stocktcpcong)
else
setprop tcpcong $tcpcong
echo $tcpcong > /proc/sys/net/ipv4/tcp_congestion_control
fi

if [ -z $scheduler ]
then
setprop scheduler $(getprop stockscheduler)
else
setprop scheduler $scheduler
echo $scheduler > /sys/block/mmcblk0/queue/scheduler
fi

if [ ! -z $gov2 ]
then
setprop gov2 $gov2
else
setprop gov2 $(getprop stockgov)
fi

if [ -z $gov ]
then
setprop gov $(getprop stockgov)
else
setprop gov $gov
echo $gov > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
fi

if [ -z $minkhz ]
then
setprop minkhz $(getprop stockminkhz)
else
setprop minkhz $minkhz
echo $minkhz > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
fi

if [ -z $maxkhz ]
then
setprop maxkhz $(getprop stockmaxkhz)
else
setprop maxkhz $maxkhz
echo $maxkhz > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
fi

if [ ! -z $maxkhz2 ]
then
setprop maxkhz2 $maxkhz2
else
setprop maxkhz2 $(getprop stockmaxkhz)
fi

if [ ! -z $minkhz2 ]
then
setprop minkhz2 $minkhz2
else
setprop minkhz2 $(getprop stockminkhz)
fi

if [ ! -z $updateinterval ]
then
setprop updateinterval $updateinterval
fi

else
setprop tcpcong $(getprop stocktcpcong)
setprop scheduler $(getprop stockscheduler)
setprop gov $(getprop stockgov)
setprop minkhz $(getprop stockminkhz)
setprop maxkhz $(getprop stockmaxkhz)
if [ ! -z $maxkhz2 ]
then
setprop maxkhz2 $maxkhz2
else
setprop maxkhz2 $(getprop stockmaxkhz)
fi

if [ ! -z $minkhz2 ]
then
setprop minkhz2 $minkhz2
else
setprop minkhz2 $(getprop stockminkhz)
fi
if [ ! -z $gov2 ]
then
setprop gov2 $gov2
else
setprop gov2 $(getprop stockgov)
fi
echo $(getprop stocktcpcong) > /proc/sys/net/ipv4/tcp_congestion_control
echo $(getprop stockscheduler) > /sys/block/mmcblk0/queue/scheduler
echo $(getprop stockgov) > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo $(getprop stockminkhz) > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo $(getprop stockmaxkhz) > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
fi
echo -n '\03 Plain-Tweak\0 LCD Density is '$(getprop customdensity)'\0' > /dev/log/main
echo -n '\03 Plain-Tweak\0 Update interval is '$(getprop updateinterval)'\0' > /dev/log/main
echo -n '\03 Plain-Tweak\0 TCP Cong is '$(getprop tcpcong)'\0' > /dev/log/main
echo -n '\03 Plain-Tweak\0 Scheduler is '$(getprop scheduler)'\0' > /dev/log/main
echo -n '\03 Plain-Tweak\0 Governor is '$(getprop gov)'\0' > /dev/log/main
echo -n '\03 Plain-Tweak\0 Minkhz is '$(getprop minkhz)'\0' > /dev/log/main
echo -n '\03 Plain-Tweak\0 Maxkhz is '$(getprop maxkhz)'\0' > /dev/log/main
if [ ! -z $(getprop minkhz2) ]
then
echo -n '\03 Plain-Tweak\0 Minkhz cores 3/4 is '$(getprop minkhz2)'\0' > /dev/log/main
fi
if [ ! -z $(getprop maxkhz2) ]
then
echo -n '\03 Plain-Tweak\0 Maxkhz cores 3/4 is '$(getprop maxkhz2)'\0' > /dev/log/main
fi
if [ ! -z $(getprop gov2) ]
then
echo -n '\03 Plain-Tweak\0 Governor2 for cores 3/4 is '$(getprop gov2)'\0' > /dev/log/main
fi
