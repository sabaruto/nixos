{ config, pkgs, inputs, home-manager-modules, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      jdk21
      jdk24

      python3Full
    ];
  };

  localModules = {
    name = "dosia";
    hostname = "leano";
    stateVersion = "24.11";

    desktopEnvironment = "gnome";

    swapSize = 32 * 1024;
    gpu = "nvidia";

    secrets.enable = true;

    apps.steam.enable = true;
    home-manager = {
      enable = true;
      username = config.localModules.name;
      modules = home-manager-modules;

      packages = with pkgs; [
        # Music w/ code
        supercollider
        kdePackages.k3b
        chromium
        vivaldi
      ];

      config.localModules = {
        secrets.enable = true;

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
