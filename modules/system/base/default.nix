# The base configuration for all machines

{ lib, config, pkgs, ... }:

with lib;

let cfg = config.localModules;
in {
  options.localModules = {
    name = mkOption {
      type = types.str;
      default = "dosia";
      description = "Name of the default user";
    };

    hostname = mkOption {
      type = types.str;
      default = "nixos";
      description = "hostname of the current system";
    };

    stateVersion = mkOption {
      type = types.str;
      default = "24.11";
      description = "Initial system to create the nixOS system";
    };

    linuxVersion = mkOption {
      type = types.nullOr types.raw;
      default = null;
      description = "Which linux kernel is run";
    };

    swapSize = mkOption {
      type = types.nullOr types.int;
      default = null;
      description = "size of the swap file";
    };
  };

  config = {
    networking.hostName = cfg.hostname;
    system.stateVersion = cfg.stateVersion;

    boot.kernelPackages = mkIf (cfg.linuxVersion != null) cfg.linuxVersion;

    users.users."${cfg.name}" = {
      isNormalUser = true;
      description = "Theodosia Kalu";
      home = "/home/${config.localModules.name}";
      extraGroups = [ "networkmanager" "wheel" "input" "uinput" "root" ];
    };

    swapDevices = mkIf (cfg.swapSize != null) [{
      device = "/swapfile";
      size = cfg.swapSize;
    }];

    environment.systemPackages = with pkgs; [
      # browsers
      firefox

      # cursors
      google-cursor

      # boot configuration
      efibootmgr

      # nixos configuration applications
      gh
      git
      micro

      # System configurations checkers
      fwupd
      rPackages.pcutils
      wget
      gnupg
      unzip
      usbutils
      home-manager

      # Note taking
      obsidian

      # Boot configuration
      sbctl

      # Communication
      discord

      # Chezmoi configuration
      chezmoi

      oh-my-zsh
      oh-my-posh

      # fonts
      nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono
      nerd-fonts.martian-mono
    ];

    # Bootloader.
    boot = {
      loader = {
        efi.canTouchEfiVariables = true;
        systemd-boot.configurationLimit = 10;
      };
    };

    nix = {
      package = pkgs.nixVersions.latest;
      extraOptions = ''
        experimental-features = nix-command flakes
      '';

      # Perform garbage collection weekly to maintain low disk usage
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
    };

    programs = {
      _1password.enable = true;
      _1password-gui = {
        enable = true;
        polkitPolicyOwners = [ "${config.localModules.name}" ];
      };

      nix-ld = { enable = true; };
    };

    # Optimise storage
    nix.settings.auto-optimise-store = true;

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Europe/London";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_GB.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_GB.UTF-8";
      LC_IDENTIFICATION = "en_GB.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_MONETARY = "en_GB.UTF-8";
      LC_NAME = "en_GB.UTF-8";
      LC_NUMERIC = "en_GB.UTF-8";
      LC_PAPER = "en_GB.UTF-8";
      LC_TELEPHONE = "en_GB.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };

    # Configure keymap in X11
    services = {
      # Enable CUPS to print documents.
      printing.enable = true;

      # Enable sound with pipewire.
      pulseaudio.enable = false;

      xserver.xkb = {
        layout = "gb";
        variant = "";
      };
    };

    # Configure console keymap
    console.keyMap = "uk";

    security.rtkit.enable = true;
    services = {
      syncthing = {
        enable = true;
        openDefaultPorts = true;

        settings = {
          devices = {
            "Zalu" = {
              id =
                "WP5633J-AIXRXZH-ENLB5QU-AU6J7N5-ZW5LWPI-GTPHZEQ-OVBTFL3-CVX3CAC";
            };
            "Pixel 7 Pro" = {
              id =
                "HQXEIYG-EKDJHID-TYTZQFG-LPUFSKU-LBVVPCL-RU42WGY-PV3G3C7-EYUELA6";
            };
            "Mini PC" = {
              id =
                "KVXSXDH-2TKAHJY-YCC47HI-VVDEZIP-3THOPA5-QELCDVX-6ILIKF7-PKVREAY";
            };
            "Leano" = {
              id =
                "HBJCTA7-GZPZE7V-R7VQ4SR-TZQZHB7-R2JTIO5-V4OAYGP-3A4BPL7-3H52HAC";
            };
          };

          folders = {
            "My Vaults" = {
              path = "~/My Vaults";
              devices = [ "Zalu" "Pixel 7 Pro" "Mini PC" "Leano" ];
            };
          };
        };
      };

      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
      };
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Enable the OpenSSH daemon.
    services.openssh.enable = true;

    # Enable tailescale
    services.tailscale.enable = true;

    # Enable bluetooth
    hardware.bluetooth.enable = true;
  };
}
