{ pkgs, outputs, ... }:

{
  imports = [ outputs.homeManagerModules.default ];

  localModules.home-manager = {
    enable = true;
    username = "dosia";

    packages = with pkgs; [
      # browsers
      firefox

      # zoom
      zoom-us

      # cursors
      google-cursor

      # boot configuration
      efibootmgr

      alacritty
      yazi-unwrapped
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
}
