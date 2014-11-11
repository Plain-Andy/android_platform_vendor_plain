#!/system/bin/sh
if [ -e /sdcard/plaintweak ]
then
cp /sdcard/plaintweak /data/local/tmp/plaintweak
chmod 0775 /data/local/tmp/plaintweak
. /data/local/tmp/plaintweak
echo $tcpcong > /proc/sys/net/ipv4/tcp_congestion_control
echo $scheduler > /sys/block/mmcblk0/queue/scheduler
echo $gov > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo $minkhz > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo $maxkhz > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
if [ -d "/sys/devices/system/cpu/cpu1/" ]; then
echo $gov > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo $minkhz > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
echo $maxkhz > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
fi
if [ -d "/sys/devices/system/cpu/cpu2/" ]; then
echo $gov > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo $minkhz > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
echo $maxkhz > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
fi
if [ -d "/sys/devices/system/cpu/cpu3/" ]; then
echo $gov > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
echo $minkhz > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
echo $maxkhz > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
fi
fi

if [ -e /sdcard/bootani/bootanimation.zip ]; then
if [ ! -e /system/media/bootanimation-original ]; then
cp /system/media/bootanimation.zip /system/media/bootanimation-original
fi
cp /sdcard/bootani/bootanimation.zip /system/media/bootanimation.zip
else
if [ -e /system/media/bootanimation-original ]; then
cp  /system/media/bootanimation-original /system/media/bootanimation.zip
else
rm  /system/media/bootanimation.zip
fi
fi
