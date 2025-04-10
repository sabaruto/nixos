{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.localModules.apps.nvim;
  langcfg = config.localModules.development;
  helpers = config.lib.nixvim;
in
{
  options.localModules.apps.nvim.lsp.enable = mkEnableOption "lsp";
  config.programs.nixvim.plugins = {

    lsp = mkIf cfg.lsp.enable {

      enable = true;

      servers = {
        # CI
        gitlab_ci_ls.enable = true;

        # Typescript
        ts_ls = mkIf (elem "typescript" langcfg.languages) { enable = true; };

        # Nix
        nixd = mkIf (elem "nix" langcfg.languages) { enable = true; };

        # python
        basedpyright = mkIf (elem "python" langcfg.languages) { enable = true; };

        # lua
        lua_ls.enable = true;

        # jsonls
        jsonls.enable = true;

        # golang
        gopls = mkIf (elem "golang" langcfg.languages) { enable = true; };
      };
    };

    lint = {
      enable = true;
      lintersByFt = mkIf (elem "golang" langcfg.languages) { go = [ "golangcilint" ]; };

      autoCmd = {
        callback = helpers.mkRaw ''
          function()
              require('lint').try_lint()
          end
        '';
        pattern = [ "*" ];
        event = [
          "bufwritepost"
        ];
      };
    };
  };
}
