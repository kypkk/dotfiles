{ pkgs, ... }:

{
  # GNOME + GDM
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # GPU support for virtio display in UTM
  hardware.graphics.enable = true;

  # Useful GNOME extras
  environment.systemPackages = with pkgs; [
    gnome-tweaks
  ];

  # Enable sound via PipeWire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
}
