{ pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    inputs.local-nixos.nixosModules.default
    inputs.local-home-manager.nixosModules.default
  ];

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
      modules = [ inputs.local-home-manager.nixosModules.all ];

      packages = with pkgs; [ docker docker-compose ];

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
