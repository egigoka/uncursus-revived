# just easier to debug this way, wiping rootfs every time is already driving me nuts
alias i="dpkg -i"
alias frm="dpkg --force-all --remove"

# backup for fuckups
cp /usr/bin/dpkg /usr/bin/dpkg_bak
cp /bin/rm /bin/rm_bak

path_wget = type wget | cut -c 9-100

if [ ! -f $FILE ] 
then
    echo "wget could not be found"
    exit
fi

# download dependencies
DEBS=/var/mobile/procursus_debs_uncompressed
mkdir $DEBS

wget https://github.com/egigoka/uncursus-revived/blob/master/debs/fakesh_0.0.0.1_iphoneos-arm.deb?raw=true -O $DEBS/fakesh_0.0.0.1_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libintl8_0.21-4.0.1_iphoneos-arm.deb?raw=true -O $DEBS/libintl8_0.21-4.0.1_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libiosexec1_1.2.2.0.1_iphoneos-arm.deb?raw=true -O $DEBS/libiosexec1_1.2.2.0.1_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/liblzma5_5.2.5-3.0.1_iphoneos-arm.deb?raw=true -O $DEBS/liblzma5_5.2.5-3.0.1_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libz-ng2_2.0.6.0.1_iphoneos-arm.deb?raw=true -O $DEBS/libz-ng2_2.0.6.0.1_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libmd0_1.0.4.0.1_iphoneos-arm.deb?raw=true -O $DEBS/libmd0_1.0.4.0.1_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/liblz4-1_1.9.3.0.1_iphoneos-arm.deb?raw=true -O $DEBS/liblz4-1_1.9.3.0.1_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/lz4_1.9.3.0.1_iphoneos-arm.deb?raw=true -O $DEBS/lz4_1.9.3.0.1_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/liblzma5_5.2.5-3.0.1_iphoneos-arm.deb?raw=true -O $DEBS/liblzma5_5.2.5-3.0.1_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libzstd1_1.5.2.0.1_iphoneos-arm.deb?raw=true -O $DEBS/libzstd1_1.5.2.0.1_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/dpkg_1.21.9.0.1_iphoneos-arm.deb?raw=true -O $DEBS/dpkg_1.21.9.0.1_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/fakexz_1_0_iphoneos-arm.deb?raw=true -O $DEBS/fakexz_1_0_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/fakelzma_3_0_iphoneos-arm.deb?raw=true -O $DEBS/fakelzma_3_0_iphoneos-arm.deb


# main script
frm xz
i $DEBS/fakexz_1_0_iphoneos-arm.deb
frm lzma
i $DEBS/fakelzma_3_0_iphoneos-arm.deb
frm lz4 
# replaced with newer

i $DEBS/fakesh_0.0.0.1_iphoneos-arm.deb
i $DEBS/libintl8_0.21-4.0.1_iphoneos-arm.deb
i $DEBS/libiosexec1_1.2.2.0.1_iphoneos-arm.deb
i $DEBS/liblzma5_5.2.5-3.0.1_iphoneos-arm.deb
i $DEBS/libz-ng2_2.0.6.0.1_iphoneos-arm.deb
i $DEBS/libmd0_1.0.4.0.1_iphoneos-arm.deb
i $DEBS/liblz4-1_1.9.3.0.1_iphoneos-arm.deb
i $DEBS/lz4_1.9.3.0.1_iphoneos-arm.deb
i $DEBS/liblzma5_5.2.5-3.0.1_iphoneos-arm.deb
i $DEBS/libzstd1_1.5.2.0.1_iphoneos-arm.deb
i $DEBS/dpkg_1.21.9.0.1_iphoneos-arm.deb

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
