{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./development
    ./environment
    ./shell
  ];

  home.packages = with pkgs; [
    vim
    git

    nnn

    zip
    xz
    unzip

    ripgrep
    jq
    fzf
    eza

    file
    watch
    tree
    zstd

    btop

    lsof
  ];

  programs.bash.enable = true;

  programs.gpg = {
    enable = true;

    mutableKeys = true;
    mutableTrust = true;
  };
}
