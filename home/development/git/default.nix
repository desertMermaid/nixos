{ pkgs, config, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Jenny Cruz";
        email = "jennifer.ylee01@gmail.com";
      };
      push = {
        autoSetupRemote = true;
      };
      pull = {
        rebase = false;
      };
    };
  };
}
