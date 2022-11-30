# just easier to debug this way, wiping rootfs every time is already driving me nuts
alias i="dpkg -i"
alias frm="dpkg --force-all --remove"

# backup for fuckups
cp /usr/bin/dpkg /usr/bin/dpkg_bak
cp /bin/rm /bin/rm_bak

# TODO:
echo I need to store files somewhere
exit

# main script
frm xz
frm lzma
frm lz4
frm xz
frm lzma

i fakesh_0.0.0.1_iphoneos-arm.deb
i libintl8_0.21-4.0.1_iphoneos-arm.deb
i libiosexec1_1.2.2.0.1_iphoneos-arm.deb
i liblzma5_5.2.5-3.0.1_iphoneos-arm.deb
i libz-ng2_2.0.6.0.1_iphoneos-arm.deb
i libmd0_1.0.4.0.1_iphoneos-arm.deb
i liblz4-1_1.9.3.0.1_iphoneos-arm.deb
i lz4_1.9.3.0.1_iphoneos-arm.deb
i liblzma5_5.2.5-3.0.1_iphoneos-arm.deb
i libzstd1_1.5.2.0.1_iphoneos-arm.deb
i dpkg_1.21.9.0.1_iphoneos-arm.deb

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
