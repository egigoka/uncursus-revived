**UPDATE BACKUP**
 - [ ] Add Shadow
 - [ ] Add Five Icon Dock (iOS 11 - 14)
**install_wget.sh**
- [x] working
**update_dpkg.sh**
- [x] working
**update_shells.sh**
- [x] Not implemented at all
- [x] after update_apt.sh sh is broken
- [ ] bash didnt't survive (/usr/lib/libreadline.8.dylib image not found)
- [ ] ERROR: libncursesw6_6.3-2_iphoneos-arm.deb': No such file or directory
**update_apt.sh**
 - [x] Not rejailbreaking - maybe dummy packages can help?
 - [x] REJAILBREAKING NOW!
 - [ ] ERROR: not replaced with dummy: Removing libidn2 (6.1.2-1) ...
 - [ ] ERROR: dummy get removed further: Removing libunistring (0), to allow configuration of libunistring2 (0.9.10-2)
**update_utils.sh**
 - [ ]
**update_openssh.sh**
- [x] after update_apt.sh ssh is broken (maybe because of sh?)
- [x] ERROR: dpkg-deb: error: paste subprocess was killed by signal (Broken pipe: 13)
**current plans**
- [x] Install update_dpkg.sh
- [x] Try to uninstall bash and install dash

