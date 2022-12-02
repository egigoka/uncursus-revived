from commands import *

pkgs = ['readline']
version = "9:0"

control_text = """Package: {package_name}
Essental: yes
Version: {version}
Architecture: iphoneos-arm
Maintainer: Fake pkg <none@example.com>
Section: System
Homepage: http://example.com
Description: empty package
Installed-Size: 0
"""
control_text = control_text.replace("{version}", version)
version_safe = version.replace(":", "_")

for pkg in pkgs:
    text = control_text.replace("{package_name}", pkg)
    File.write("./fakepkg/DEBIAN/control", text, mode="w")
    Console.get_output(["dpkg-deb", "-b", "fakepkg", f"debs/fake{pkg}_{version_safe}_iphoneos-arm.deb"], print_std=True)

print("done")
