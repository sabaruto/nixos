{ config, pkgs, ... }:

{
   users.users.dosia.packages = with pkgs; [
     vscode
      
     (vscode-with-extensions.override {
       vscodeExtensions = with vscode-extensions; [
         # Interpreters
         golang.go
         b4dm4n.vscode-nixpkgs-fmt
         bierner.github-markdown-preview
         bierner.markdown-mermaid
    
         # Systems tools
         ms-kubernetes-tools.vscode-kubernetes-tools
         ms-azuretools.vscode-docker

         # Themes
         emroussel.atomize-atom-one-dark-theme
         teabyii.ayu
       ];
    })
  ];
}
