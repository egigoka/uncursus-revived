openssh+
-openssh-client+
--libssl3+
--libcrypt2+
--libmd0+
-openssh-server+
--libssl3+
--openssh-client+
--openssh-sftp-server+
--libcrypt2+
--libpam2+
-openssh-sftp-server+
--libssl3+
--openssh-client+
--libcrypt2+
--libmd0+

wget https://github.com/egigoka/uncursus-revived/blob/master/debs/libssl3_3.0.7_iphoneos-arm.deb?raw=true -O $DEBS/libssl3_3.0.7_iphoneos-arm.deb

i $DEBS/libssl3_3.0.7_iphoneos-arm.deb
