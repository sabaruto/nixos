{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userEmail = "theodoreaaronobelley@hotmail.co.uk";
    userName = "sabaruto";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
