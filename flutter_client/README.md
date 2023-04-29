# yingshaoxo's voice chat room

## Youtube
<p align="center">
 <img src="readme/youtube.png" width='1024'/>
</p>

## Build
```bash
flutter pub get -v

flutter build
```

## Dev
### set up dev proxy
```bash
v2ray run -c v2ray_config.json
```

In android device, use `Kitsunebi`(a v2ray core wrapper) to import the `v2ray_config_for_mobile.json` config and start the VPN.

### replace hosts
```bash
cd /Users/yingshaoxo/Library/Android/sdk/tools/emulator

./emulator -list-avds

./emulator -avd A_Pixel_5 -writable-system

adb root
adb remount

adb push hosts /system/etc/hosts

# reboot
```

### root the android simulator
```bash
cd /Users/yingshaoxo/Library/Android/sdk/tools/emulator

./emulator -list-avds
./emulator -avd A_Pixel_5 -writable-system -selinux disabled

adb root
adb remount

git clone https://github.com/newbit1/rootAVD.git

./rootAVD.sh ~/Library/Android/sdk/system-images/android-31/default/arm64-v8a/ramdisk.img

# adb root
# adb shell avbctl disable-verification
# adb disable-verity
# adb reboot

#close the simulator
./emulator -avd A_Pixel_5 -writable-system
# emulator -avd A_Pixel_5 -writable-system -no-snapshot-load -no-snapshot-save -no-snapshot -no-snapstorage 
```

## build
```bash
flutter build apk --release --obfuscate --split-debug-info=/tmp/weloveparty
#or
flutter build appbundle --release --obfuscate --split-debug-info=/tmp/weloveparty
```