from commands import *

pkgs = ['cydia', 'xz', 'lzma', 'libapt-pkg5.0', 'tar']

control_text = """Package: {package_name}
Essental: yes
Version: 99.9.9.9
Architecture: iphoneos-arm
Maintainer: Fake pkg <none@example.com>
Section: System
Homepage: http://example.com
Description: empty package
Installed-Size: 0
"""

for pkg in pkgs:
    text = control_text.replace("{package_name}", pkg)
    File.write("./fakepkg/DEBIAN/control", text, mode="w")
    Console.get_output(["dpkg-deb", "-b", "fakepkg", f"debs/fake{pkg}_99.9.9.9_iphoneos-arm.deb"], print_std=True)

print("done")
