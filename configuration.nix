# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, pkgs-unstable ? import <nixos-unstable> {},... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Configure keymap in X11
  # services.xserver.xkb = {
  #   layout = "eu";
  #   # variant = "intl";
  # };

  # Configure console keymap
  console.keyMap = "us";

  # Define a user account. Don't forget to set a password with ‘passwd’.

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  security.sudo.wheelNeedsPassword = false;

  programs.hyprland.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    alejandra
    brightnessctl
    btop
    cmake
    dolphin
    dunst
    firefox
    gcc
    git
    github-desktop
    greetd.tuigreet
    grim
    nushell
    postman
    pulseaudio
    qemu
    qemu
    ripgrep
    rustup 
    slurp
    spotify
    stockfish
    swayidle
    swaylock-effects
    unzip
    valgrind
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    vscode
    wabt
    waybar
    wl-clipboard
    wofi
    zip
    zsh
  ];
  fonts.packages = with pkgs; [
    font-awesome
  ];
  programs.zsh.enable = true;

    environment.pathsToLink = [ "/share/zsh" ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.logind = {
    # lidSwitch = "suspend";
    # lidSwitchDocked = "suspend";
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd 'Hyprland -c ~/.dotfiles/hypr/hyprland.conf'";
        user = "work";
      };
    };
    # vt = 2;
  };

  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs

    # here, NOT in environment.systemPackages
  ];

  # systemd.services."cleanup" = {
  #   # This is terrible. Change this if possible
  #   path = ["/run/current-system/sw"];
  #   script = ''
  #     bash ~/.dotfiles/scripts/cleanup
  #   '';
  #   serviceConfig = {
  #     Type = "oneshot";
  #     User = "work";
  #   };
  # };
  # systemd.timers."cleanup" = {
  #   wantedBy = [ "timers.target" ];
  #     timerConfig = {
  #       OnCalendar = "daily";
  #       Persistent = true;
  #     };
  # };

  # systemd.services."backup" = {
  #   # This is terrible. Change this if possible
  #   script = ''
  #     bash ~/.dotfiles/scripts/backup
  #   '';
  #   serviceConfig = {
  #     Type = "oneshot";
  #     User = "work";
  #   };
  # };
  # systemd.timers."backup" = {
  #   wantedBy = [ "timers.target" ];
  #     timerConfig = {
  #       OnCalendar = "daily";
  #       Persistent = true;
  #     };
  # };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
