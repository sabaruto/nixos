{ pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.local-nixos.nixosModules.default
    inputs.local-home-manager.nixosModules.default
  ];

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

    desktopEnvironment = "kde";

    swapSize = 32 * 1024;
    gpu = "nvidia";

    apps.steam.enable = true;
    home-manager = {
      enable = true;
      modules = [ inputs.local-home-manager.nixosModules.all ];

      packages = with pkgs; [
        # Music w/ code
        supercollider
        rtorrent
        lms
        serviio
        vlc
      ];

      config = {

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
