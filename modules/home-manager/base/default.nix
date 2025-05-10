{
  lib,
  pkgs,
  outputs,
  ...
}:

{
  home = {
    packages =
      with pkgs;
      lib.mkMerge [
        ([
          # Password Manager
          _1password-cli
          _1password-gui

          # Music
          spotify

          # Visualise directories
          tree

          # Certificates
          openssl
        ])
        (lib.mkIf (false) [
          # Boot configuration
          pkgs.efibootmgr
          tidal-hifi
        ])
      ];
    sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
