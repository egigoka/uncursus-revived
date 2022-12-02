# just easier to debug this way, wiping rootfs every time is already driving me nuts
alias i="dpkg -i"
alias fin="dpkg --force-all -i"
alias cfg="dpkg --configure"
alias frm="dpkg --force-all --remove"
alias ddrm="dpkg-divert --remove"

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

LIBS=/var/mobile/elucubratus_libs_temp
mkdir $LIBS

wget https://github.com/egigoka/uncursus-revived/blob/master/debs/ncurses-term_6.3-2_all.deb?raw=true -O $DEBS/ncurses-term_6.3-2_all.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libncursesw6_6.3-2_iphoneos-arm.deb?raw=true -O $DEBS/libncursesw6_6.3-2_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libedit0_3.1-20210910_iphoneos-arm.deb?raw=true -O $DEBS/libedit0_3.1-20210910_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/debianutils_5.5-1_iphoneos-arm.deb?raw=true -O $DEBS/debianutils_5.5-1_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/dash_0.5.11.4_iphoneos-arm.deb?raw=true -O $DEBS/dash_0.5.11.4_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libreadline8_8.2.0_iphoneos-arm.deb?raw=true -O $DEBS/libreadline8_8.2.0_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libpam2_20190224_iphoneos-arm.deb?raw=true -O $DEBS/libpam2_20190224_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libpam-modules_186.60.1-1_iphoneos-arm.deb?raw=true -O $DEBS/libpam-modules_186.60.1-1_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libcrypt2_4.4.28_iphoneos-arm.deb?raw=true -O $DEBS/libcrypt2_4.4.28_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/file-cmds_400-1_iphoneos-arm.deb?raw=true -O $DEBS/file-cmds_400-1_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/firmware-sbin_0-2_all.deb?raw=true -O $DEBS/firmware-sbin_0-2_all.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/system-cmds_880.60.2_iphoneos-arm.deb?raw=true -O $DEBS/system-cmds_880.60.2_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/profile.d_0-7_iphoneos-arm.deb?raw=true -O $DEBS/profile.d_0-7_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libpcre1_8.45-1_iphoneos-arm.deb?raw=true -O $DEBS/libpcre1_8.45-1_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/zsh_5.9_iphoneos-arm.deb?raw=true -O $DEBS/zsh_5.9_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/grep_3.7_iphoneos-arm.deb?raw=true -O $DEBS/grep_3.7_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/sed_4.8-2_iphoneos-arm.deb?raw=true -O $DEBS/sed_4.8-2_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/bash_5.2.0_iphoneos-arm.deb?raw=true -O $DEBS/bash_5.2.0_iphoneos-arm.deb
wget https://github.com/egigoka/uncursus-revived/blob/master/libs/libncurses.6.dylib?raw=true -O $LIBS/libncurses.6.dylib
wget https://github.com/egigoka/uncursus-revived/blob/master/debs/fakediskdev-cmds_593_0_iphoneos-arm.deb?raw=true -O $DEBS/fakediskdev-cmds_593_0_iphoneos-arm.deb

# updating bash
i $DEBS/debianutils_5.5-1_iphoneos-arm.deb
ddrm /bin/sh
fin $DEBS/ncurses-term_6.3-2_all.deb
i $DEBS/libncursesw6_6.3-2_iphoneos-arm.deb
cfg ncurses-term
i $DEBS/libedit0_3.1-20210910_iphoneos-arm.deb
# fuuuck this
cp $LIBS/libncurses.6.dylib /usr/lib/libncurses.6.dylib
i $DEBS/dash_0.5.11.4_iphoneos-arm.deb
i $DEBS/libreadline8_8.2.0_iphoneos-arm.deb
fin $DEBS/libpam-modules_186.60.1-1_iphoneos-arm.deb
i $DEBS/libpam2_20190224_iphoneos-arm.deb
cfg libpam-modules
i $DEBS/libcrypt2_4.4.28_iphoneos-arm.deb
i $DEBS/file-cmds_400-1_iphoneos-arm.deb
frm diskdev-cmds
i $DEBS/fakediskdev-cmds_593_0_iphoneos-arm.deb
i $DEBS/firmware-sbin_0-2_all.deb
i $DEBS/system-cmds_880.60.2_iphoneos-arm.deb
i $DEBS/libpcre1_8.45-1_iphoneos-arm.deb
i $DEBS/zsh_5.9_iphoneos-arm.deb
cfg zsh
i $DEBS/profile.d_0-7_iphoneos-arm.deb
i $DEBS/grep_3.7_iphoneos-arm.deb
i $DEBS/sed_4.8-2_iphoneos-arm.deb
cfg debianutils
i $DEBS/bash_5.2.0_iphoneos-arm.deb
# fuuuck this
rm /usr/lib/libncurses.6.dylib


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
rm -rfv $LIBS
