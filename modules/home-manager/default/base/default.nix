{ pkgs, inputs, ... }:

{
  home = {
    packages = with pkgs; [
      # Password Manager
      _1password-cli
      _1password-gui

      # Music
      spotify

      # Visualise directories
      tree

      neofetch

      # Certificates
      openssl

      # Boot configuration
      pkgs.efibootmgr
      tidal-hifi
    ];
    sessionVariables = { EDITOR = "nvim"; };
  };
}
