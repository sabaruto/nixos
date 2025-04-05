{
  pkgs,
  outputs,
  ...
}:

{
  imports = [
    outputs.homeManagerModules
  ];

  home.username = "theodore";
  home.homeDirectory = "/home/theodore";
  home.stateVersion = "24.11";
  home.packages = with pkgs; [
    # Password manager
    bitwarden-desktop
    bitwarden-cli

    # music services
    tidal-hifi
    spotify

    # zoom
    zoom-us

    # cli apps
    tree
    openssl
  ];
  home.file = {
  };

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  localModules = {
    apps = {
      # kitty.enable = true;
      zsh.enable = true;
      zen.enable = true;
      tmux.enable = true;

      nvim = {
        enable = true;

        obsidian.workspaces = [
          {
            path = "~/docs/";
            name = "general";
          }
        ];
      };
    };
  };

  targets.genericLinux.enable = true;
  programs.home-manager.enable = true;
}
