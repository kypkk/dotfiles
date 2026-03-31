{ lib, modulesPath, ... }:

{
  imports = [ ];

  boot.initrd.availableKernelModules = [
    "ehci_pci"
    "xhci_pci"
    "usbhid"
    "sr_mod"
  ];

  boot.initrd.kernelModules = [];
  boot.kernelModules = [];
  boot.extraModulePackages = [];

  # Root filesystem — label set during NixOS installation
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/1f157571-654d-4002-bd99-6b24073d6e48";
    fsType = "ext4";
  };

  # EFI boot partition
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/18B6-BC00";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  swapDevices = [];

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
  hardware.parallels.enable = true;
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "prl-tools" ];
}
