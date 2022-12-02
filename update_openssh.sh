# just easier to debug this way, wiping rootfs every time is already driving me nuts
alias i="dpkg -i"
alias fin="dpkg --force-all -i"
alias cfg="dpkg --configure"
alias frm="dpkg --force-all --remove"

# backup for fuckups
cp /usr/bin/dpkg /usr/bin/dpkg_bak
cp /bin/rm /bin/rm_bak

path_wget=$(type wget | cut -c 9-100)

if [ ! -f $path_wget ] 
then
    echo "wget could not be found"
    exit
fi

# download dependencies
DEBS=/var/mobile/procursus_debs_saved
mkdir $DEBS

wget https://github.com/egigoka/uncursus-revived/blob/master/debs/openssh_8.8p1_iphoneos-arm.deb?raw=true -O $DEBS/openssh_8.8p1_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/openssh-client_8.8p1_iphoneos-arm.deb?raw=true -O $DEBS/openssh-client_8.8p1_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/openssh-server_8.8p1_iphoneos-arm.deb?raw=true -O $DEBS/openssh-server_8.8p1_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/openssh-sftp-server_8.8p1_iphoneos-arm.deb?raw=true -O $DEBS/openssh-sftp-server_8.8p1_iphoneos-arm.deb

# updating openssh
i $DEBS/openssh-client_8.8p1_iphoneos-arm.deb # ok
frm openssh-server
i $DEBS/openssh-sftp-server_8.8p1_iphoneos-arm.deb # ok
frm openssh-global-listener
i $DEBS/openssh-server_8.8p1_iphoneos-arm.deb
i $DEBS/openssh_8.8p1_iphoneos-arm.deb

# fuckups
FILE=/bin/rm
BAK=_bak
if [ ! -f $FILE ]; then
    echo "fuck! $FILE got deleted. I'll try to apply backup."
    cp $FILE$BAK $FILE
    echo "successfull, i guess."
fi

if [ ! -x $FILE ]; then 
    echo "fuck! $FILE isn't executable. I'll try to fix that."
    cp $FILE$BAK $FILE
    echo "successfull, i guess."
fi

FILE=/usr/bin/dpkg
if [ ! -f $FILE ]; then
    echo "fuck! $FILE got deleted. I'll try to apply backup."
    cp $FILE$BAK $FILE
    echo "successfull, i guess."
fi

if [ ! -x $FILE ]; then 
    echo "fuck! $FILE isn't executable. I'll try to fix that."
    cp $FILE$BAK $FILE
    echo "successfull, i guess."
fi

# cleanup

rm -rfv $DEBS
