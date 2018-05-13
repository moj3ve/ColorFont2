export ARCHS = armv7 armv7s arm64
DEBUG = 0
export TARGET = iphone:clang:9.3

PACKAGE_VERSION = 10.0-6

export SYSROOT = $(THEOS)/sdks/iPhoneOS9.3.sdk

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ColorFont2
ColorFont2_FILES = Tweak.xm
ColorFont2_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += colorfont2
include $(THEOS_MAKE_PATH)/aggregate.mk
