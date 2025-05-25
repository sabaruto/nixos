{ inputs, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    inputs.local-nixos.nixosModules.default
    inputs.local-home-manager.nixosModules.default
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  localModules = {
    name = "dosia";
    hostname = "zalu";
    stateVersion = "24.11";

    swapSize = 16 * 1024;
    gpu = "none";

    desktopEnvironment = "kde";

    shells.zsh.enable = true;

    apps = { steam.enable = true; };

    dotfiles.kde.enable = true;

    home-manager = {
      enable = true;
      modules = [ inputs.local-home-manager.nixosModules.all ];

      packages = with pkgs; [
        # browsers
        firefox

        # zoom
        zoom-us

        # cursors
        google-cursor

        # boot configuration
        efibootmgr

        # miracast
        gnome-network-displays
        openh264
        x264
        faac
        dnsmasq

        syncthing
      ];

      config = {
        cmd = {
          direnv.enable = true;
          oh-my-posh.enable = true;
        };

        apps = {
          git.enable = true;
          neovim.enable = true;
          ghostty.enable = true;
        };

        development = {
          enable = true;
          installOnNixos = true;
          languages = [ "nix" "lua" "java" "golang" "typescript" ];
        };
      };
    };
  };

  users.defaultUserShell = pkgs.zsh;

  hardware.bluetooth.enable = true;
}
