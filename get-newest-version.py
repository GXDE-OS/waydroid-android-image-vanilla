#!/usr/bin/env python3
import sys
import requests
try:
    arch = sys.argv[1]
    choose = sys.argv[2]
except:
    arch = "x86_64"
    choose = "GAPPS"
gapps = requests.get(f"https://ota.waydro.id/system/lineage/waydroid_{arch}/{choose}.json").json()
with open("/tmp/url.txt", "w") as file:
    file.write(gapps["response"][0]["url"])
with open("/tmp/version.txt", "w") as file:
    file.write(gapps["response"][0]["version"])
# https://ota.waydro.id/vendor/waydroid_x86_64/MAINLINE.json
vendor = requests.get(f"https://ota.waydro.id/vendor/waydroid_{arch}/MAINLINE.json").json()
with open("/tmp/vendorurl.txt", "w") as file:
    file.write(vendor["response"][0]["url"])
with open("/tmp/vendorversion.txt", "w") as file:
    file.write(vendor["response"][0]["version"])
print("System:")
print(gapps["response"][0]["url"])
print(gapps["response"][0]["version"])
print("Vendor:")
print(vendor["response"][0]["url"])
print(vendor["response"][0]["version"])