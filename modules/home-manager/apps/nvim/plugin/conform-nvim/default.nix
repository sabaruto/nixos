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
  options.localModules.apps.nvim.conform-nvim.enable = mkEnableOption "conform-nvim";

  config.programs.nixvim.plugins.conform-nvim = mkIf cfg.conform-nvim.enable {
    enable = true;

    settings = {
      formatters_by_ft = {
        lua = [ "stylua" ];

        go = [ "gofmt" ];

        python = [
          "isort"
          "black"
        ];
      };

      "*" = [ "codespell" ];

      format_on_save = {
        timeout_ms = 500;
        lsp_fallback = true;
      };

      default_format_opts = {
        lsp_format = "fallback";
      };
    };
  };
}
