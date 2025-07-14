{
  lib,
  config,
  pkgs,
  inputs,
  system,
  home-manager-modules,
  ...
}:
{
  security.pki = {
    certificateFiles = [
      "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
      ../../secrets/SaltPay_Root_CA_01.pem
    ];
  };

  services.syncthing.enable = lib.mkForce false;

  localModules = {
    name = "t-aaronobelley";
    hostname = "halu";
    stateVersion = "24.11";

    desktopEnvironment = "none";
    gpu = "nvidia";

    system.podman.enable = true;

    home-manager = {
      enable = true;
      username = "${config.localModules.name}";
      modules = home-manager-modules;

      packages = with pkgs; [
        kubectl
        kind
        ctlptl
        helm
        tilt
        postman
        dconf-editor
        jwt-cli
        inputs.agenix.packages."${system}".default
        inputs.local-packages.packages."${system}".kulala-ls
        inputs.local-packages.packages."${system}".java-debug

        xdg-utils-cxx
        weston
      ];

      config.localModules = {
        shells.zsh.enable = true;

        development = {
          enable = true;
          installOnNixos = true;
          languages = [
            "nix"
            "lua"
            "java"
          ];
        };

        cmd = {
          git = {
            enable = true;
            user = "teya";
          };
        };
      };
    };
  };

  wsl = {
    enable = true;
    defaultUser = "t-aaronobelley";

    wrapBinSh = true;

    # USB access
    usbip.enable = true;
    useWindowsDriver = true;
    startMenuLaunchers = true;
    docker-desktop.enable = false;

    interop = {
      register = true;
    };

    wslConf.user.default = "t-aaronobelley";
  };

  age = {
    secretsDir = "/home/t-aaronobelley/agenix";
    identityPaths = [ "/etc/ssh/id_ed25519" ];

    secrets = {
      "SaltPay_Root_CA_01.pem" = {
        file = ../../secrets/SaltPay_Root_CA.age;
      };
    };
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;

    wlr.enable = true;
    lxqt.enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      kdePackages.xdg-desktop-portal-kde
      xdg-desktop-portal-hyprland
    ];

    config = {
      common = {
        default = [
          "lxqt"
        ];
        "org.freedesktop.Notifications" = [

        ];
      };
    };
  };

  programs.zsh.enable = true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  users = {
    defaultUserShell = pkgs.zsh;
  };
}
