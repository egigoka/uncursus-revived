# just easier to debug this way, wiping rootfs every time is already driving me nuts
alias i="dpkg -i"
alias frm="dpkg --force-all --remove"

# backup for fuckups
cp /usr/bin/dpkg /usr/bin/dpkg_bak
cp /bin/rm /bin/rm_bak

# TODO:
echo I need to store files somewhere
exit

# updating apt
frm apt
frm apt-key
frm libapt
frm libapt-pkg5.0
i ncurses-term_6.3-2_all.deb libncursesw6_6.3-2_iphoneos-arm.deb
i havoc-keyring_2022.06.03_all.deb
i chariz-keyring_2021.07.18_all.deb
i odyssey-keyring_2021.07.20_all.deb
i procursus-keyring_2020.05.09-3_all.deb
i libnpth0_1.6-2_iphoneos-arm.deb
frm libgpg-error
i libgpg-error0_1.45_iphoneos-arm.deb
frm libassuan
i libassuan0_2.5.5_iphoneos-arm.deb
i pinentry_1.2.0_iphoneos-arm.deb
i libbrotli1_1.0.9_iphoneos-arm.deb
frm libtasn1
i libtasn1-6_4.18.0_iphoneos-arm.deb
i libffi8_3.4.2_iphoneos-arm.deb
frm p11-kit
i libp11-kit0_0.24.0_iphoneos-arm.deb
i libnettle8_3.7.3_iphoneos-arm.deb
i libhogweed6_3.7.3_iphoneos-arm.deb
frm libunistring
i libunistring2_0.9.10-2_iphoneos-arm.deb
frm libidn2
i libidn2-0_2.3.2_iphoneos-arm.deb
frm gnutls
i libgnutls30_3.7.6-1_iphoneos-arm.deb
i libxxhash0_0.8.1_iphoneos-arm.deb
frm lz4
i liblz4-1_1.9.3_iphoneos-arm.deb
frm gcrypt
i libgcrypt20_1.10.1_iphoneos-arm.deb
i libapt-pkg6.0_2.5.2_iphoneos-arm.deb
i libpam2_20190224_iphoneos-arm.deb libpam-modules_186.60.1-1_iphoneos-arm.deb
i libcrypt2_4.4.28_iphoneos-arm.deb
i file-cmds_400-1_iphoneos-arm.deb
i system-cmds_880.60.2_iphoneos-arm.deb
i gpgv_2.3.6_iphoneos-arm.deb
i apt_2.5.2_iphoneos-arm.deb

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
