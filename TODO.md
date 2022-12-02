**UPDATE BACKUP**
 - [ ] Add Shadow
 - [ ] Add Five Icon Dock (iOS 11 - 14)
**DUMMY PACKAGES**
 - [x] Get list
 - [x] Create debs
 - [x] Update scripts
 - [x] liblzma5 conflicts with xz, well, fuck, do I really need to change packets from Procursus? nah, just right version for dummy package fixed that
**update_apt.sh**
 - [x] Not rejailbreaking - maybe dummy packages can help?
 - [x] REJAILBREAKING NOW!
**update_openssh.sh**
- [ ] Not implemented fully
- [x] after update_apt.sh ssh is broken (maybe because of sh?)
**update_shell.sh**
- [x] Not implemented at all
- [x] after update_apt.sh sh is broken
- [ ] bash didnt't survive (/usr/lib/libreadline.8.dylib image not found)
- [ ] 
**current plans**
- [x] Install update_dpkg.sh
- [x] Try to uninstall bash and install dash

