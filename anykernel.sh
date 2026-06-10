#!/sbin/sh
### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers
## Adapted for Motorola Cuscoi by HELLINFIX

### AnyKernel setup
# global properties
properties() { '
kernel.string=Nebula Prime Kernel for Motorola Cuscoi by HELLINFIX
do.devicecheck=1
do.modules=1
do.systemless=1
do.cleanup=1
do.cleanuponabort=1
device.name1=cuscoi
device.name2=Cuscoi
device.name3=moto_parrot_cuscoi
device.name4=
device.name5=
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties


### AnyKernel install
## boot files attributes
boot_attributes() {
set_perm_recursive 0 0 755 644 $RAMDISK/*;
set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin;
} # end attributes

# boot shell variables
BLOCK=boot;
IS_SLOT_DEVICE=1;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# boot install
dump_boot;

# Begin Device Flash Sequence
write_boot;
## end boot install


## vendor_boot files attributes
#vendor_boot_attributes() {
#set_perm_recursive 0 0 755 644 $RAMDISK/*;
#set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin;
#} # end attributes

# vendor_boot shell variables
BLOCK=vendor_boot;
IS_SLOT_DEVICE=1;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# reset for vendor_boot patching
reset_ak;

# vendor_boot install
dump_boot;

# If you compiled external DTBs, AnyKernel3 will automatically inject them here
write_boot;
## end vendor_boot install