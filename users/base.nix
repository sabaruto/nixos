{ pkgs, ... }:
{
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # Password Manager
    _1password-cli

    # Music
    tidal-hifi
    spotify

    # Boot configuring
    efibootmgr

    # Visualise directories
    tree

    # Certificates
    openssl
  ];
  
  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
}
