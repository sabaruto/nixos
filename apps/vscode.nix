{ config, home, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;

    # Useful extensions for all 
    extensions = with pkgs.vscode-extensions; [
      # General Helpers
      usernamehw.errorlens
      formulahendry.auto-rename-tag
      streetsidesoftware.code-spell-checker

      # Formatter
      esbenp.prettier-vscode

      # NixOS IDE
      jnoortheen.nix-ide

      # Markdown
      yzhang.markdown-all-in-one
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      # Password Manager
      {
        name = "op-vscode";
        publisher = "1password";
        version = "1.0.5";
        sha256 = "sha256-J7vAK2t6fSjm5i6y3+88aO84ipFwekQkJMD7W3EIWrc=";
      }

      # Markdown
      {
        name = "mermaid-markdown-syntax-highlighting";
        publisher = "bpruitt-goddard";
        version = "1.7.0";
        sha256 = "sha256-Vjmc9tlHSFdhhcSopUG3MnyBSi//B6cpnavqFLhVRho=";
      }

      # API Testing
      {
        name = "postman-for-vscode";
        publisher = "postman";
        version = "1.7.0";
        sha256 = "sha256-JZ5zaA2r7kc3KJg+dbimA/2mVaOILiEIwD/6w/36ebU=";
      }
    ];
  };
}
