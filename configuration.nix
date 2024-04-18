# Edit this configuration file to define what should be installed on histor
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: let
  unstable = import <nixos-unstable> {config = {allowUnfree = true;};};
in {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # vscode options
    ./nixos/vscode/config.nix

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

  security.pam.services.swaylock = {};

  security.sudo = {
    enable = true;
<<<<<<< HEAD
    wheelNeedsPassword = false;
  };
=======
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

>>>>>>> e448dfb0f070ceb4bc05f87f249322b7feecba20
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
      /run/current-system/sw/bin/nix-env --profile nix/var/nix/profiles/system --delete-generations 7d

      /run/current-system/sw/bin/nix-collect-garbage -d

      /run/current-system/sw/bin/nix-store --optimise
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

<<<<<<< HEAD
  # start of window manager

  services.xserver = {
    enable = true;

    desktopManager = {
      xfce.enable = true;
      xterm.enable = false;
    };
    displayManager.defaultSession = "xfce";
  };

  # end of window manager

  programs.thunar.enable = true;
=======
  programs.hyprland.enable = true;
>>>>>>> e448dfb0f070ceb4bc05f87f249322b7feecba20

  services.greetd = {
    enable = true;
    settings = {
      default_session.command = ''
        ${pkgs.greetd.tuigreet}/bin/tuigreet \
                    --time \
               --asterisks \
               --user-menu \
<<<<<<< HEAD
               --cmd 'startxfce4'
=======
               --cmd 'Hyprland'
>>>>>>> e448dfb0f070ceb4bc05f87f249322b7feecba20
      '';
    };
  };

  environment.etc."greetd/environments".text = ''
    Hyprland
    awesome
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

<<<<<<< HEAD
=======
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

>>>>>>> e448dfb0f070ceb4bc05f87f249322b7feecba20
  fonts.packages = with pkgs; [
    pkgs.font-awesome
    pkgs.jetbrains-mono
  ];
<<<<<<< HEAD

  environment.systemPackages = with pkgs;
    [
      # neofetch
      neofetch

      # formatting .nix files
      alejandra

      # alertdialogs
      libnotify
      mako

      # program starter
      fuzzel
      wofi

      # appbar
      waybar

      # spotify
      spotify

      # rustup
      rustup

      # perf
      linuxPackages_latest.perf

      # resource monitor
      btop

      # screen locking
      swayidle
      hyprlock

      # python
      python3

      # npm
      nodejs_21

      # brightness
      brightnessctl

      # flutter
      flutter

      # android
      #pkgs.android-studio
      #pkgs.android-tools

      # c tools
      # gcc9
      # cmakeMinimal
      # gnumake
      jetbrains.clion

      # whatsapp
      whatsapp-for-linux

      # file manager
      # libsForQt5.dolphin
      libsForQt5.filelight

      xorg.xinit
    ]
    ++ (with unstable; []);
=======
>>>>>>> e448dfb0f070ceb4bc05f87f249322b7feecba20
}
