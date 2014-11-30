#!/system/bin/sh
if [ -e /sdcard/plaintweak ]
then
cp /sdcard/plaintweak /data/local/tmp/plaintweak
chmod 0775 /data/local/tmp/plaintweak
. /data/local/tmp/plaintweak
getprop tcpcong > /proc/sys/net/ipv4/tcp_congestion_control
getprop scheduler > /sys/block/mmcblk0/queue/scheduler
getprop gov > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
getprop minkhz > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
getprop maxkhz > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
if [ -d "/sys/devices/system/cpu/cpu1/" ]; then
getprop gov > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
getprop minkhz > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
getprop maxkhz > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
fi
if [ -d "/sys/devices/system/cpu/cpu2/" ]; then
getprop gov > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
getprop minkhz > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
getprop maxkhz > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
fi
if [ -d "/sys/devices/system/cpu/cpu3/" ]; then
getprop gov > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
getprop minkhz > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
getprop maxkhz > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
fi
fi
