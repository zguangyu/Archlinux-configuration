#!/bin/sh
# Default acpi script that takes an entry for all actions

# NOTE: This is a 2.6-centric script.  If you use 2.4.x, you'll have to
#       modify it to not use /sys

minspeed=`cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq`
maxspeed=`cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq`
setspeed="/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed"
pcieaspm="/sys/module/pcie_aspm/parameters/policy"
set $*

case "$1" in
    button/power)
        #echo "PowerButton pressed!">/dev/tty5
        case "$2" in
            PWRF)   pm-suspend;;
            *)      logger "ACPI action undefined: $2" ;;
        esac
        ;;
    button/sleep)
        case "$2" in
            SLPB)   echo -n mem >/sys/power/state ;;
            *)      logger "ACPI action undefined: $2" ;;
        esac
        ;;
    ac_adapter)
        case "$2" in
            ADP1)
                case "$4" in
                    00000000)
			logger 'On Battery'
                        echo -n $minspeed >$setspeed
			echo -n 'powersave' >$pcieaspm
			systemctl isolate battery.target
                        #/etc/laptop-mode/laptop-mode start
                    ;;
                    00000001)
			logger 'On AC'
                        echo -n $maxspeed >$setspeed
			echo -n 'performance' >$pcieaspm
			systemctl isolate default.target
                        #/etc/laptop-mode/laptop-mode stop
                    ;;
                esac
                ;;
            *)  logger "ACPI action undefined: $2" ;;
        esac
        ;;
    battery)
        case "$2" in
            BAT0)
                case "$4" in
                    00000000)   #echo "offline $4" >/dev/tty5
                    ;;
                    00000001)   #echo "online $4"  >/dev/tty5
                    ;;
                esac
                ;;
            CPU0)	
                ;;
            *)  logger "ACPI action undefined: $2" ;;
        esac
        ;;
    button/lid)
        #echo "LID switched! $2">/dev/tty5
	#cat "/proc/acpi/button/lid/$2/state" > /dev/tty5
	if [[ `cat /proc/acpi/button/lid/$2/state | awk '{print $2}'` = "closed" ]]
        then
		if [[ `cat /proc/acpi/battery/BAT0/state | grep 'discharging'` != "" ]]
		then
            		pm-suspend
		fi
        fi
        ;;
    *)
        logger "ACPI group/action undefined: $1 / $2"
        ;;
esac
