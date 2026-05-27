{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./claude
    ./git
    ./neovim
    ./postman
  ];
}
