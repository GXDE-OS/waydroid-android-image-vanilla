build:
	bash download-image.sh

install:
	mkdir -pv $(DESTDIR)/usr/share/waydroid-extra/images
	mkdir -pv $(DESTDIR)/var/lib/waydroid/overlay/system
	#cp -rv config/* $(DESTDIR)/var/lib/waydroid/waydroid.cfg
	if [ $(shell dpkg --print-architecture) = i386 ]; then cp -rv config/waydroid-x86.cfg $(DESTDIR)/var/lib/waydroid/waydroid.cfg; fi
	if [ $(shell dpkg --print-architecture) = amd64 ]; then cp -rv config/waydroid-x86_64.cfg $(DESTDIR)/var/lib/waydroid/waydroid.cfg; fi
	if [ $(shell dpkg --print-architecture) = armhf ]; then cp -rv config/waydroid-arm.cfg $(DESTDIR)/var/lib/waydroid/waydroid.cfg; fi
	if [ $(shell dpkg --print-architecture) = arm64 ]; then cp -rv config/waydroid-arm64.cfg $(DESTDIR)/var/lib/waydroid/waydroid.cfg; fi
	
	if [ $(shell dpkg --print-architecture) = amd64 ]; then cp -rv config/libhoudini/* $(DESTDIR)/var/lib/waydroid/overlay/system; fi
	cp -rv config/priv-app $(DESTDIR)/var/lib/waydroid/overlay/system
	cp -rv system.img $(DESTDIR)/usr/share/waydroid-extra/images 
	cp -rv vendor.img $(DESTDIR)/usr/share/waydroid-extra/images