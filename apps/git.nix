username:
  { config, pkgs, ... }:
  {
    users.users.${username}.packages = with pkgs; [
      git
      git-lfs
    ];

    programs.git = {
      enable = true;
      config = [
        { init.defaultBranch = "main"; }
        { user.name = "sabaruto"; }
        { user.email = "theodoreaaronobelley@hotmail.co.uk"; }
      ];
    };
  }
