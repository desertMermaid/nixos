{ pkgs, config, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Jenny Housh";
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
