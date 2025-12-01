# Author: Wk19-hub
#!/bin/bash
#
# Dell BIOS Configuration Script for OptiPlex 3020
# This script applies BIOS settings using CCTK (Dell Client Configuration Toolkit)
# Author: Wk19-hub
#
# Requirements: Supported Linux installation with CCTK and srv-admin RPMs installed
# Run as root or with sudo privileges

SCRIPTNAME=`basename $0`
LOG=`basename $0`.log
CCTKPATH=/opt/dell/toolkit/bin
CCTKEXE=cctk
CCTKWHICH=`which cctk 2> /dev/null`


function err {
	echo "Error: ${SCRIPTNAME} : $1"
	exit $2
}


function hlp {
	echo "Help : ${SCRIPTNAME}"
	echo "Applies BIOS config exported from a host system"
	echo "A valid cctk installation is expected"
	echo "Should be run by the root user, or using a 'sudo' command"
	echo "Arguments:"
	echo "-h|--help    this help message"
}


# Handle arguments
if [ "x$2" != "x" ]; then
	hlp
	exit 0
fi

# Check cctk installation presence
if [ "x${CCTKWHICH}" != "x" -a -f "${CCTKWHICH}" -a -x "${CCTKWHICH}" ]; then
	CCTK="${CCTKWHICH}"
elif [ -f "${CCTKPATH}/${CCTKEXE}" -a -x "${CCTKPATH}/${CCTKEXE}" ];  then
	CCTK="${CCTKPATH}/${CCTKEXE}"
else
	err "cctk installation not found" -1
fi


TMPINI=.tmp.cctk.config.ini
if [ -f ${TMPINI} ]; then
	rm -f ${TMPINI}
fi

cat > ${TMPINI} <<HERE
[cctk]
valsetuppwd=securepassword
valsyspwd=securepassword
acpower=off
admsetuplockout=enable
advbatterychargecfg=disable
asset=
autoon=everyday
autoonhr=11
autoonmn=55
biosver=A08
blocks3=disable
bootorder=legacytype,-floppy,+hdd,-cdrom,-usbdev,-embnic
chasintrusion=silentenable
clearsel=yes
cpucore=all
cpuxdsupport=enable
cstatesctrl=enable
deepsleepctrl=s4ands5
embnic1=onnopxe
embsataraid=ahci
energystarlogo=disable
fanctrlovrd=disable
forcepxeonnextboot=disable
hddprotection=off
integratedaudio=enable
intlsmartconnect=disable
keyboardclick=disable
legacyorom=enable
limitcpuidvalue=off
numlock=on
passwordbypass=off
peakshiftcfg=disable
propowntag=
pwdlock=unlock
rptkeyerr=enable
sata0=auto
sata1=off
sata2=off
serial1=disable
serrdmimsg=on
sfuenabled=yes
smarterrors=disable
speedstep=automatic
strongpwd=disable
svctag=33FFC72
sysid=612
sysname=OptiPlex 3020
tpm=on
tpmactivation=activate
tpmppiacpi=enable
tpmppidpo=disable
tpmppipo=enable
turbomode=enable
uefinwstack=disable
usb30=enable
usbemu=enable
usbportsfront=enable
usbreardual=on
usbreardual2stack=on
usbwake=enable
virtualization=enable
wakeonlan=enable
advsm=VOLTAGE_1:NA,NA
advsm=TEMPERATURE_1:NA,NA
;chassisintrustatus=tripped
HERE


if [ "$(id -u)" != "0" ]; then
   err "Permission Denied - Insufficient priviliges" -1
fi
"${CCTK}" -i ${TMPINI} > ${LOG}
if [ $? == 0 ]; then
	echo "BIOS settings applied successfully"
else
	echo "Error applying BIOS settings."
fi
echo "Details in ${LOG}"
exit $rtn


