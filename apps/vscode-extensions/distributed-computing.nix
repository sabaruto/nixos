{ config, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vscode-docker";
          publisher = "ms-azuretools";
          version = "1.29.4";
          sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
        }

        {
          name = "vscode-kubernetes-tools";
          publisher = "ms-azuretools-tools";
          version = "1.3.20";
          sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
        }
      ];
  };
}
