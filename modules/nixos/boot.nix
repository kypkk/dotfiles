{ ... }:

{
  # systemd-boot over UEFI — standard for UTM/QEMU on aarch64
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # virtio kernel modules required for QEMU/UTM
  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "virtio_pci"
    "virtio_scsi"
    "usbhid"
    "sr_mod"
  ];
}
