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

wget https://github.com/egigoka/uncursus-revived/blob/master/debs/ncurses-term_6.3-2_all.deb?raw=true -O $DEBS/ncurses-term_6.3-2_all.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/havoc-keyring_2022.06.03_all.deb?raw=true -O $DEBS/havoc-keyring_2022.06.03_all.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/chariz-keyring_2021.07.18_all.deb?raw=true -O $DEBS/chariz-keyring_2021.07.18_all.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/odyssey-keyring_2021.07.20_all.deb?raw=true -O $DEBS/odyssey-keyring_2021.07.20_all.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/procursus-keyring_2020.05.09-3_all.deb?raw=true -O $DEBS/procursus-keyring_2020.05.09-3_all.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libnpth0_1.6-2_iphoneos-arm.deb?raw=true -O $DEBS/libnpth0_1.6-2_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libgpg-error0_1.45_iphoneos-arm.deb?raw=true -O $DEBS/libgpg-error0_1.45_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libassuan0_2.5.5_iphoneos-arm.deb?raw=true -O $DEBS/libassuan0_2.5.5_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/pinentry_1.2.0_iphoneos-arm.deb?raw=true -O $DEBS/pinentry_1.2.0_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libbrotli1_1.0.9_iphoneos-arm.deb?raw=true -O $DEBS/libbrotli1_1.0.9_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libtasn1-6_4.18.0_iphoneos-arm.deb?raw=true -O $DEBS/libtasn1-6_4.18.0_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libffi8_3.4.2_iphoneos-arm.deb?raw=true -O $DEBS/libffi8_3.4.2_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libp11-kit0_0.24.0_iphoneos-arm.deb?raw=true -O $DEBS/libp11-kit0_0.24.0_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libnettle8_3.7.3_iphoneos-arm.deb?raw=true -O $DEBS/libnettle8_3.7.3_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libhogweed6_3.7.3_iphoneos-arm.deb?raw=true -O $DEBS/libhogweed6_3.7.3_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libunistring2_0.9.10-2_iphoneos-arm.deb?raw=true -O $DEBS/libunistring2_0.9.10-2_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libidn2-0_2.3.2_iphoneos-arm.deb?raw=true -O $DEBS/libidn2-0_2.3.2_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libgnutls30_3.7.6-1_iphoneos-arm.deb?raw=true -O $DEBS/libgnutls30_3.7.6-1_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libxxhash0_0.8.1_iphoneos-arm.deb?raw=true -O $DEBS/libxxhash0_0.8.1_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/liblz4-1_1.9.3.0.1_iphoneos-arm.deb?raw=true -O $DEBS/liblz4-1_1.9.3_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libgcrypt20_1.10.1_iphoneos-arm.deb?raw=true -O $DEBS/libgcrypt20_1.10.1_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libapt-pkg6.0_2.5.2_iphoneos-arm.deb?raw=true -O $DEBS/libapt-pkg6.0_2.5.2_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libpam2_20190224_iphoneos-arm.deb?raw=true -O $DEBS/libpam2_20190224_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libpam-modules_186.60.1-1_iphoneos-arm.deb?raw=true -O $DEBS/libpam-modules_186.60.1-1_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libcrypt2_4.4.28_iphoneos-arm.deb?raw=true -O $DEBS/libcrypt2_4.4.28_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/file-cmds_400-1_iphoneos-arm.deb?raw=true -O $DEBS/file-cmds_400-1_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/system-cmds_880.60.2_iphoneos-arm.deb?raw=true -O $DEBS/system-cmds_880.60.2_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/gpgv_2.3.6_iphoneos-arm.deb?raw=true -O $DEBS/gpgv_2.3.6_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/apt_2.5.2_iphoneos-arm.deb?raw=true -O $DEBS/apt_2.5.2_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libncursesw6_6.3-2_iphoneos-arm.deb?raw=true -O $DEBS/libncursesw6_6.3-2_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/tar_1.34_iphoneos-arm.deb?raw=true -O $DEBS/tar_1.34_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/fakeapt-key_1_0_iphoneos-arm.deb?raw=true -O $DEBS/fakeapt-key_1_0_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/fakelibapt_1_0_iphoneos-arm.deb?raw=true -O $DEBS/fakelibapt_1_0_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/fakelibapt-pkg5.0_1_0_iphoneos-arm.deb?raw=true -O $DEBS/fakelibapt-pkg5.0_1_0_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/fakelibgpg-error_1_0_iphoneos-arm.deb?raw=true -O $DEBS/fakelibgpg-error_1_0_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/fakelibassuan_2_0_iphoneos-arm.deb?raw=true -O $DEBS/fakelibassuan_2_0_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/fakegnutls_3_0_iphoneos-arm.deb?raw=true -O $DEBS/fakegnutls_3_0_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/fakegcrypt_1_0_iphoneos-arm.deb?raw=true -O $DEBS/fakegcrypt_1_0_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/fakegnupg_2_0_iphoneos-arm.deb?raw=true -O $DEBS/fakegnupg_2_0_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/fakelibunistring_1_0_iphoneos-arm.deb?raw=true -O $DEBS/fakelibunistring_1_0_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/p11-kit_0.24.0_iphoneos-arm.deb?raw=true -O $DEBS/p11-kit_0.24.0_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/p11-kit-modules_0.24.0_iphoneos-arm.deb?raw=true -O $DEBS/p11-kit-modules_0.24.0_iphoneos-arm.deb


# updating apt
frm apt
# replaced with newer
frm apt-key
i $DEBS/fakeapt-key_1_0_iphoneos-arm.deb
frm libapt
i $DEBS/fakelibapt_1_0_iphoneos-arm.deb
frm libapt-pkg5.0
i $DEBS/fakelibapt-pkg5.0_1_0_iphoneos-arm.deb
i $DEBS/tar_1.34_iphoneos-arm.deb
fin $DEBS/ncurses-term_6.3-2_all.deb 
i $DEBS/libncursesw6_6.3-2_iphoneos-arm.deb
cfg ncurses-term
i $DEBS/havoc-keyring_2022.06.03_all.deb
i $DEBS/chariz-keyring_2021.07.18_all.deb
i $DEBS/odyssey-keyring_2021.07.20_all.deb
i $DEBS/procursus-keyring_2020.05.09-3_all.deb
i $DEBS/libnpth0_1.6-2_iphoneos-arm.deb
frm libgpg-error
i $DEBS/fakelibgpg-error_1_0_iphoneos-arm.deb
i $DEBS/libgpg-error0_1.45_iphoneos-arm.deb
frm libassuan
i $DEBS/fakelibassuan_2_0_iphoneos-arm.deb
i $DEBS/libassuan0_2.5.5_iphoneos-arm.deb
i $DEBS/pinentry_1.2.0_iphoneos-arm.deb
i $DEBS/libbrotli1_1.0.9_iphoneos-arm.deb
frm libtasn1
# replaced with newer
i $DEBS/libtasn1-6_4.18.0_iphoneos-arm.deb
i $DEBS/libffi8_3.4.2_iphoneos-arm.deb
frm p11-kit
# replaced with newer
i $DEBS/p11-kit-modules_0.24.0_iphoneos-arm.deb
i $DEBS/libp11-kit0_0.24.0_iphoneos-arm.deb
cfg p11-kit-modules
i $DEBS/p11-kit_0.24.0_iphoneos-arm.deb
i $DEBS/libnettle8_3.7.3_iphoneos-arm.deb
i $DEBS/libhogweed6_3.7.3_iphoneos-arm.deb
frm libunistring
i $DEBS/fakelibunistring_1_0_iphoneos-arm.deb
i $DEBS/libunistring2_0.9.10-2_iphoneos-arm.deb
frm libidn2
# replaced with newer
i $DEBS/libidn2-0_2.3.2_iphoneos-arm.deb
frm gnutls
i $DEBS/fakegnutls_3_0_iphoneos-arm.deb
i $DEBS/libgnutls30_3.7.6-1_iphoneos-arm.deb
i $DEBS/libxxhash0_0.8.1_iphoneos-arm.deb
i $DEBS/liblz4-1_1.9.3_iphoneos-arm.deb
frm gcrypt
i $DEBS/fakegcrypt_1_0_iphoneos-arm.deb
i $DEBS/libgcrypt20_1.10.1_iphoneos-arm.deb
i $DEBS/libapt-pkg6.0_2.5.2_iphoneos-arm.deb
fin $DEBS/libpam2_20190224_iphoneos-arm.deb 
i $DEBS/libpam-modules_186.60.1-1_iphoneos-arm.deb
cfg libpam2
i $DEBS/libcrypt2_4.4.28_iphoneos-arm.deb
i $DEBS/file-cmds_400-1_iphoneos-arm.deb
i $DEBS/system-cmds_880.60.2_iphoneos-arm.deb
frm gnupg
i $DEBS/fakegnupg_2_0_iphoneos-arm.deb
i $DEBS/gpgv_2.3.6_iphoneos-arm.deb
i $DEBS/apt_2.5.2_iphoneos-arm.deb

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
