{
  config,
  pkgs,
  hostName,
  username,
  ...
}: {
  imports = [
    ../../modules/nixos-system.nix

    ./hardware-configuration.nix
  ];

  users.users.${username}.home = "/home/${username}";

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
#  boot.kernelParams = [ "nvidia-drm.modeset=1" ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  networking.hostName = hostName;
  networking.networkmanager.enable = true;

  system.stateVersion = "26.11";
}
