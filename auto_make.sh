#! /bin/sh
source /opt/fsl-imx-fb/4.1.15-2.1.0/environment-setup-cortexa9hf-neon-poky-linux-gnueabi 
make myimx6a9_defconfig
make zImage
make myimx6ek314-6q-2g.dtb
cp arch/arm/boot/dts/myimx6ek314-6q-2g.dtb /home/shared_file/arm_build_4.1.15/myimx6ek314-6q-2g.dtb

make modules
mkdir modules
make modules_install INSTALL_MOD_PATH=./modules
tar cjf kernel-modules.tar.bz2 -C modules lib

cp kernel-modules.tar.bz2 /home/shared_file/arm_build_4.1.15/kernel-modules-myimx6a9.tar.bz2

cp ./arch/arm/boot/zImage /home/shared_file/arm_build_4.1.15/zImage-myimx6a9
