# Steps to make

- note: This build route does not generate an SD card image file.

1. make od_gcw0_defconfig
2. make BR2_EXTERNAL=./board/opendingux/ menuconfig
  - External options -> OpenDingux packages (Put a checkmark in everything)
  - External options -> OpenDingux packages -> UBIBoot board name (Fill in "gcw0")
  - Save and Exit
3. make
4. When "A ready-to-use update OPK can be found here" is displayed, a "gcw0-update-2024-04-18.opk" file will be generated in the output/images directory. (The name is named after the build date)
By copying this opk file to the "/media/data/apps" directory in the SD card, an "update" icon will be displayed in the "applications" section of gmenu2x.


# Saving buildroot settings
- When changing the settings, the settings file will be saved in the preset location by executing the command below.
```
make savedefconfig
make linux-savedefconfig
make linux-update-defconfig
make busybox-update-config
make uclibc-update-config
```

- If you want to execute the above commands all at once, please run the script below.
````
sh -x ./saveconfig.sh
````
