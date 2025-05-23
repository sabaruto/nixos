{
  pkgs,
  outputs,
  ...
}:

{
  imports = [
    outputs.homeManagerModules.default
  ];

  home = {
    username = "theodore";
    homeDirectory = "/home/theodore";
    stateVersion = "24.11";
    packages = with pkgs; [
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
