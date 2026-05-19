{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./claude
    ./neovim
    ./git
  ];
}
