#!/usr/bin/env python3
import requests
gapps = requests.get("https://ota.waydro.id/system/lineage/waydroid_x86_64/GAPPS.json").json()
with open("/tmp/url.txt", "w") as file:
    file.write(gapps["response"][0]["url"])
with open("/tmp/version.txt", "w") as file:
    file.write(gapps["response"][0]["version"])
# https://ota.waydro.id/vendor/waydroid_x86_64/MAINLINE.json
vendor = requests.get("https://ota.waydro.id/vendor/waydroid_x86_64/MAINLINE.json").json()
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