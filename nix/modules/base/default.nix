{ pkgs, inputs, ... }:

{
  home = {
    packages = with pkgs; [
      # Music
      spotify
      tidal-hifi

      # Visualise directories
      tree

      neofetch

      # Certificates
      openssl

      # Boot configuration
      pkgs.efibootmgr
    ];
    sessionVariables = { EDITOR = "nvim"; };
  };
}
