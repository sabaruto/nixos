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
  imports = [ ./hardware-configuration.nix ];
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

    desktopEnvironment = "gnome";
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
        yazi

        xdg-utils-cxx
        weston

        stylua
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

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;

    wlr.enable = true;
    lxqt.enable = true;

    configPackages = with pkgs; [
      gnome-session
      uwsm
    ];

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      kdePackages.xdg-desktop-portal-kde
      xdg-desktop-portal-hyprland
    ];

  };

  programs.zsh.enable = true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  users = {
    defaultUserShell = pkgs.zsh;
  };
}
