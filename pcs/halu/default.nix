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
        inputs.local-packages.packages."${system}".kulala-ls
        inputs.openaws-vpn.packages."${system}".default
        #        inputs.local-packages.packages."${system}".java-debug
        yazi
        openvpn3

        xdg-utils-cxx
        weston

        stylua

        slack
        teams-for-linux
        update-resolv-conf
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
  services.resolved = {
    enable = true;

  };

  services.tailscale.enable = lib.mkForce false;

  users = {
    defaultUserShell = pkgs.zsh;
  };
}
