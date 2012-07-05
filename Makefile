run: debian_mips.qcow2 initrd.gz vmlinux-2.6.32-5-4kc-malta installed-stamp
	 qemu-system-mips -hda debian_mips.qcow2 -kernel vmlinux-2.6.32-5-4kc-malta -append "root=/dev/sda1 console=ttyS0" -nographic

debian_mips.qcow2:
	qemu-img create -f qcow2 debian_mips.qcow2 2G

initrd.gz:
	wget http://ftp.de.debian.org/debian/dists/squeeze/main/installer-mips/current/images/malta/netboot/initrd.gz

vmlinux-2.6.32-5-4kc-malta:
	wget http://ftp.de.debian.org/debian/dists/squeeze/main/installer-mips/current/images/malta/netboot/vmlinux-2.6.32-5-4kc-malta

installed-stamp:
	qemu-system-mips -hda debian_mips.qcow2 -kernel vmlinux-2.6.32-5-4kc-malta -initrd initrd.gz -append "root=/dev/ram console=ttyS0" -nographic
	touch installed-stamp
