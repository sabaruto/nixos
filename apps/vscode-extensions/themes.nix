{ config, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "theme-monokai-pro-vscode";
        publisher = "monokai";
        version = "2.0.6";
        sha256 = "sha256-Dz5fsDNXr5KX6L4cQNm5NPykEd7HQvK4W4T4ZYNaUQg=";
      }
    ];
  };
}
