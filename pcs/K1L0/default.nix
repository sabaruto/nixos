{ pkgs, home-manager-modules, ... }: {
  imports = [ ./hardware-configuration.nix ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  hardware.bluetooth.enable = true;

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  localModules = {
    name = "dosia";
    hostname = "K1L0";
    stateVersion = "25.05";

    swapSize = 32 * 1024;
    gpu = "nvidia";

    desktopEnvironment = "hyprland";

    apps.steam.enable = true;
    peripherals.kanata.enable = true;

    home-manager = {
      enable = true;
      modules = home-manager-modules;

      packages = with pkgs; [
        # Music w/ code
        supercollider
        kdePackages.k3b
        chromium
        vivaldi
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
