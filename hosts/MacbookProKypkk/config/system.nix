{ pkgs, ... }:

{
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.kangkang = {
    home = "/Users/kangkang";
  };

  system.primaryUser = "kangkang";

  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  # Touch ID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  # Password cached for the whole session — only asked once
  security.sudo.extraConfig = ''
    Defaults timestamp_timeout=-1
  '';

  fonts.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.fira-code
  ];

  system.defaults = {
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.2;
      show-recents = true;
      tilesize = 28;
      orientation = "bottom";
      minimize-to-application = false;
      expose-group-apps = false;

      # Hot corners: 2=Mission Control, 4=Desktop, 11=Launchpad, 14=Quick Note
      wvous-tl-corner = 2;    # top-left     → Mission Control
      wvous-tr-corner = 11;   # top-right    → Launchpad
      wvous-bl-corner = 4;    # bottom-left  → Desktop
      wvous-br-corner = 14;   # bottom-right → Quick Note
    };

    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = false;
      ShowStatusBar = false;
      FXPreferredViewStyle = "icnv";
      FXDefaultSearchScope = "SCcf";
      AppleShowAllFiles = false;
      FXEnableExtensionChangeWarning = false;
    };

    NSGlobalDomain = {
      AppleShowScrollBars = "Automatic";
      NSAutomaticCapitalizationEnabled = true;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSNavPanelExpandedStateForSaveMode = true;
      PMPrintingExpandedStateForPrint = true;
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
      ApplePressAndHoldEnabled = false;
    };

    screencapture = {
      type = "png";
      disable-shadow = true;
      target = "clipboard";
    };

    trackpad = {
      Clicking = true;
      TrackpadThreeFingerDrag = false;
    };

    ActivityMonitor.IconType = 5;

    spaces.spans-displays = false;

    # Screensaver / Security
    screensaver = {
      askForPassword = true;
      askForPasswordDelay = 0;
    };
  };

  # Firewall
  networking.applicationFirewall.enable = true;

  system.stateVersion = 6;
}
