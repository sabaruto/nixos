{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.localModules.apps.nvim;
in
{
  options.localModules.apps.nvim.treesitter.enable = mkEnableOption "treesitter";

  config.programs.nixvim = mkIf cfg.treesitter.enable {
    autoCmd = [
      {
        command = "TSBufEnable highlight";
        pattern = [ "*" ];

        event = [
          "BufEnter"
          "BufWinEnter"
        ];
      }
    ];
    plugins.treesitter = {
      enable = true;

      settings = {
        auto_install = true;
        indent.enable = true;

        ensure_installed = [
          "c"
          "lua"
          "vim"
          "bash"
          "regex"
          "vimdoc"
          "query"
          "markdown"
          "markdown_inline"

        ];

        incremental_selection = {
          enable = true;
        };
      };
    };
  };
}
