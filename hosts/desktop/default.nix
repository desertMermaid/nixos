{
  config,
  pkgs,
  hostName,
  username,
  ...
}: {
  imports = [
    ../../modules/nixos-system.nix
  ];

  users.users.${username}.home = "/home/${username}";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = hostName;
  networking.networkmanager.enable = true;

  system.stateVersion = "26.11";
}
