{ pkgs, home-manager-modules, ... }: {
  imports = [ ./hardware-configuration.nix ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  hardware.bluetooth.enable = true;

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  localModules = {
    name = "dosia";
    hostname = "zalu";
    stateVersion = "24.11";

    swapSize = 16 * 1024;
    gpu = "none";

    desktopEnvironment = "hyprland";

    apps.steam.enable = true;
    peripherals.kanata.enable = true;

    home-manager = {
      enable = true;
      modules = home-manager-modules;

      packages = with pkgs; [
        jellyfin-media-player
        krita
        vivaldi
        kdePackages.k3b
      ];
      config.localModules = {
        shells.zsh.enable = true;

        cmd = {
          direnv.enable = true;
          oh-my-posh.enable = true;
        };

        apps = {
          git.enable = true;
          neovim.enable = true;
          wezterm.enable = true;
          alacritty.enable = true;
        };

        development = {
          enable = true;
          installOnNixos = true;
          languages = [ "nix" "lua" "java" "golang" "typescript" ];
        };
      };
    };
  };
}
