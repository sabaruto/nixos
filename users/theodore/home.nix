{
  pkgs,
  outputs,
  ...
}:

{
  imports = [
    outputs.homeManagerModules.default
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
    EDITOR = "nvim";
  };

  localModules = {
    apps = {
      zen.enable = true;
      tmux.enable = true;
      neovim.enable = true;
    };

    development = {
      enable = true;
      languages = [
        "nix"
        "python"
        "lua"
        "golang"
      ];
    };
  };

  targets.genericLinux.enable = true;
  programs.home-manager.enable = true;
}
