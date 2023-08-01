#!/usr/bin/env python3
import sys
import datetime
with open(sys.argv[1], "r") as file:
    control = file.read()
newControl = ""
for i in control.splitlines():
    if i[:8].lower() == "version:":
        newControl += f"Version: {i[9:].strip()}-{datetime.datetime.now().year}{datetime.datetime.now().month}{datetime.datetime.now().day}{datetime.datetime.now().hour}{datetime.datetime.now().minute}{datetime.datetime.now().second}\n"
        continue
    if i[:11].lower() == "maintainer:":
        newControl += f"{i}, gfdgd xi<3025613752@qq.com>\n"
        continue
    if i[:8].lower() == "depends:":
        newControl += f"{i}, waydroid-android-image-gapps | waydroid-android-image-vanilla"
        continue
    newControl += f"{i}\n"
print(newControl)
with open(sys.argv[1], "w") as file:
    file.write(newControl)