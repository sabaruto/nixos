{ config, pkgs, inputs, home-manager-modules, ... }: {
  imports = [ ./hardware-configuration.nix ];

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  programs.nix-ld.enable = true;

  localModules = {
    name = "saiki";
    hostname = "mini-pc";
    stateVersion = "25.11";

    desktopEnvironment = "none";

    swapSize = 8 * 1024;
    gpu = "none";

    home-manager = {
      enable = true;
      username = config.localModules.name;
      modules = home-manager-modules;

      packages = with pkgs; [
        docker
        docker-compose
        transmission_4
        rtorrent
        jellyfin
      ];

      config = {
        cmd.direnv.enable = true;

        apps = {
          neovim.enable = true;
          tmux.enable = true;
          git.enable = true;
        };

        development.enable = true;
      };
    };
  };
}
