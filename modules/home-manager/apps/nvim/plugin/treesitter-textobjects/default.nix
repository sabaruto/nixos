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
  options.localModules.apps.nvim.treesitter-textobjects.enable =
    mkEnableOption "treesitter-textobjects";

  config.programs.nixvim.plugins.treesitter-textobjects = mkIf cfg.treesitter-textobjects.enable {
    enable = true;

    select = {
      enable = true;

      keymaps = {
        "af" = "@function.outer";
        "if" = "@function.inner";
        "ac" = "@class.outer";
        "ic" = "@class.inner";
        "as" = "@local.scope";
      };
    };

    swap = {
      enable = true;

      swapNext."<leader>a" = "@parameter.inner";
      swapPrevious."<leader>A" = "@parameter.inner";
    };

    move = {
      enable = true;

      gotoNext."]d" = "@conditional.outer";
      gotoPrevious."[d" = "@conditional.outer";

      gotoNextStart = {
        "]m" = "@function.outer";
        "]]" = "@class.outer";
        "]o" = "@loop.*";

        "]s" = {
          query = "@local.scope";
          queryGroup = "locals";
          desc = "Next scope";
        };

        "]z" = {
          query = "@fold";
          queryGroup = "folds";
          desc = "Next fold";
        };
      };

      gotoNextEnd = {
        "]M" = "@function.outer";
        "][" = "@function.outer";
      };

      gotoPreviousStart = {
        "[m" = "@function.outer";
        "[[" = "@class.outer";
      };
    };

    lspInterop = {
      enable = true;

      peekDefinitionCode = {
        "<leader>df" = "@function.outer";
        "<leader>dF" = "@class.outer";
      };
    };
  };
}
