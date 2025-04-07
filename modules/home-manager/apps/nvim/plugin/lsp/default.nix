{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.localModules.apps.nvim;
in
{
  options.localModules.apps.nvim.lsp.enable = mkEnableOption "lsp";

  config.programs.nixvim.plugins.lsp = mkIf cfg.lsp.enable {
    enable = true;

    servers = {
      # Typescript
      ts_ls.enable = true;

      # Nix
      nixd.enable = true;

      # python
      basedpyright.enable = true;

      # lua
      lua_ls.enable = true;

      # jsonls
      jsonls.enable = true;

      # golang
      gopls.enable = true;
    };
  };
}
