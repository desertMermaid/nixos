{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./carapace
    ./nushell
    ./starship
  ];
}
