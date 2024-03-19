# Edit this configuration file to define what should be installed on histor
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # vscode options
    ./vscode/config.nix

    # home manager
    inputs.home-manager.nixosModules.default
  ];

  environment.pathsToLink = ["/share/zsh"];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  security.sudo = {
    enable = true;
    extraRules = [
      {
        commands = [
          {
            command = "${pkgs.systemd}/bin/reboot";
            options = ["NOPASSWD"];
          }
          {
            command = "${pkgs.systemd}/bin/shutdown";
            options = ["NOPASSWD"];
          }
          {
            command = "/home/admin/.local/bin/cleanup";
            options = ["NOPASSWD"];
          }
        ];
        groups = ["wheel"];
      }
    ];
  };

  systemd.timers."cleanup" = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
      Unit = "cleanup.service";
    };
  };

  systemd.services."cleanup" = {
    script = ''
      /run/current-system/bin/switch-to-configuration boot

      nix-collect-garbage -d
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  nix.optimise.automatic = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.admin = {
    isNormalUser = true;
    description = "admin";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [];
  };

  users.defaultUserShell = pkgs.zsh;
  users.users.root.ignoreShellProgramCheck = true;
  users.users.admin.ignoreShellProgramCheck = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged
    # programs here, NOT in environment.systemPackages
  ];

  environment.localBinInPath = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  programs.hyprland.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session.command = ''
        ${pkgs.greetd.tuigreet}/bin/tuigreet \
                    --time \
               --asterisks \
               --user-menu \
               --cmd 'Hyprland'
      '';
    };
  };

  environment.etc."greetd/environments".text = ''
    Hyprland
  '';
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "admin" = import ./home.nix;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  environment.systemPackages = with pkgs; [
    # neofetch
    neofetch

    # formatting .nix files
    pkgs.alejandra

    # alertdialogs
    pkgs.libnotify
    pkgs.mako

    # program starter
    pkgs.fuzzel

    # appbar
    pkgs.waybar

    # spotify
    pkgs.spotify

    # rustup
    pkgs.rustup

    # perf
    # pkgs.perf-tools
    pkgs.linuxPackages_latest.perf

    # resource monitor
    pkgs.btop

    # file manager
    pkgs.xfce.thunar

    # screen locking
    pkgs.swayidle

    # calculator
    pkgs.bc

    # npm
    pkgs.nodejs_21

    # brightness
    pkgs.brightnessctl

    # flutter
    pkgs.flutter

    # android
    pkgs.android-studio
    pkgs.android-tools
  ];

  fonts.packages = with pkgs; [
    pkgs.font-awesome
    pkgs.jetbrains-mono
  ];
}
