# plumOS-jz47xx
custom firmware based on opendingux  
[Click here for the English version of the explanation page](./README_EN.md)
  
   <img src="./docs/website/images/plumOS-jz47xx.png" width="240">
  
## ●Acknowledgments
- We would like to express our gratitude and respect to the original OPENDINGUX development team.
- Original plumOS logo & splash image provider [X account: JL @JL_0w0] Thank you!

## ●Download
You can download it from "Releases" in the menu on the right side of the screen.
 
## ●Features
- plumOS-jz47xx is made based on OpenDingux (VERSION_ID=2023.11)
     - Works with Anbernic RG300X and RG350 and RG280V and RG350M
- retroarch uses the latest version "1.17.0"
     - 98 cores available
- Features of RG300X, RG350 and RG350M
     - USB-DAC and Bluetooth-Audio devices can be used with OTG port
         - Bluetooth-Audio whose operation has been confirmed
             - Creative BT-W2
             - GuliKit ROUTE AIRBluetooth Audio USB Transmitter
         - Note! If you insert or remove a USB device while the game is running, the game may hang up, so please insert or remove the device while the gmenu2x screen is displayed.
         - Operation of all USB devices is not guaranteed.
     - Wifi devices can be used on OTG port
         - Compatible driver is rtl8192cu
         - For instructions on how to use it, please refer to "How to connect to wifi" at the bottom of the page.
     - USB network (RNDIS) available
         - For instructions on how to use it, please refer to "USB network (RNDIS) connection method" at the bottom of the page.
- Features of RG280V
     - USB-DAC, Bluetooth-Audio, and Wifi are not available at this time
     - USB network (RNDIS) available
         - For instructions on how to use it, please refer to "USB network (RNDIS) connection method" at the bottom of the page.

## ●Specifications
- The exFAT area on the SD1 side and the area on the SD2 side are mounted under the "/media/data" directory.
     - The name of the mounted directory will be the "label name" given to the SD card.
- Operation may become unstable if the CPU clock is set to 1200MHz
- If you connect or disconnect a USB device while the game is running, it may hang up, so please connect or disconnect the device while the gmenu2x screen is displayed.

## ●Known issues
- Some applications built with toolchains for GCW0 are not available
     - Commander, gmu, ffplay, etc.
- Operation of all emulators has not been confirmed.

## ●USB network (cdc/RNDIS) connection method
- Maximum transfer speed is approximately 3MB/s (24Mbps)
- Connect the USB port (not the OTG port) to Windows or MacOS using a USB cable that supports data communication.
  - Please restart plumOS-jz47xx after connecting the USB cable
     - Note! Depending on the version of Windows, you may need to install the RNDIS driver.
- Connection information
     - The IP address of the device is "10.1.1.2"
     - Port number is "22"
     - Username is "od"
     - Leave the password blank (do not enter it)
- It is also possible to connect via SSH
     - After logging in as the od user, execute the "sudo su -" command, leave the password blank and press the enter key.
- If you want to transfer files, please use an app such as winSCP or FileZilla

## ●wifi connection method
- Compatible driver is rtl8192cu
     - USB transfer speed is limited to 11Mbps due to jz47xx specifications (execution speed is approximately 5Mbps)
     - Please prepare a wifi router that supports IEEE802.11n/g/b
- Connect to plumOS with RNDIS and open the "/media/data/wlan/wlan.txt" file
- Enter your SSID and passphrase and save
````
example)
# Please set the SSID and passphrase.
SSID="hogehoge-AccessPoint"
PASS="fugafuga-password"
````
- Run "WlanON" in the "settings" section of gmenu2x after connecting the wifi device
     - If the LED light on the wifi device turns on, the device is recognized.
     - You can check the Wifi IP address by running "System info" in the "settings" section


## ●OS side hotkey list
| Button Combo | Action |
|:------------|------------:|
| POW+Y | Sleep |
| POW+X | Screenshot (saved in /media/data/local/home/screenshots/ directory) |
| POW+B | Mouse mode? (The cross key will no longer work, so if you want to restore it, press POW+B again.) |
| POW+ Left and right arrow keys | Change screen brightness |


## ●Retroarch hotkeys
| Button Combo | Action |
|:------------|------------:|
| POW | Menu display |
| SELECT＋DOWN | End of retroarch |
| SELECT+R | Save state |
| SELECT+L | State load |
| SELECT+R2 | fastforward |
| SELECT+L2 | Slow motion |


## ●picoarch hotkeys

Please configure from Oprion → Emulator controls and run save config

| Button Combo | Action |
|:------------|------------:|
| SELECT+START | Menu display |
| SELECT＋X | Not set |
| SELECT+R | Not set |
| SELECT+L | Not set |
| SELECT+R2 | Not set |
| SELECT+L2 | Not set |

## ●Directory information

| emulator | path |
|:------------|------------:|
| retroarch | /media/data/local/home/.retroarch/system |
| picoarch | /media/data/picoarch/bios |
| standalone emu | emu directory under /media/data/local/home |


that's all