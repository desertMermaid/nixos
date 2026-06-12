{
  pkgs,
  lib,
  hostName,
  username,
...
};

{
users.users.${username} = {
  isNormalUser = ture;
  description = username;
  extraGroups = [
    "wheel"
    "networkmanager"
    "video"
  ];
    shell = pkgs.nushell;
};

hardware.graphics = {
  enable = true;
  enablie32Bit = true;
};

environment.sessionVaribale = {
  GMB_BACKEND = "nvidia-drm";
  __GLX_VENDOR_LIBRARY_NAME = "nvidia";
};

nix.settings.trusted-users = [ username ];

nix.settings = {
  experimental-features = [
    "nix-command"
    "flakes"
  ];

  substituters = [
    "https://cache.nixos.org"
  ];

  builders-use-substitutes = true;
};

nix.gc = {
  automatic = lib.mkDefault true;
  dates = lib.mkDefault "weekly";
  options = lib.mkDefault " --delete-older-than 7d";
};

nixpkgs.config.allowUnfree = true;

il8n.defaultLocale = "en_US.UTF-8";

fonts = {
  packages = with pkgs; [
    material-design-icons

    noto-fonts
    noto-fonts-djk-sans
    noto-fonts-color-emoji

    nerd-fonts.symbols-only
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  fontconfig.defaultFonts = {
    serif = [
      "Noto Serif"
      "Noto Color Emoji"
    ];
    sansSerif = [
      "Noto Sans"
      "Noto Color Emoji"
    ];
    monospace = [
      "JetBrainsMono Nerd Font"
      "Noto Color Emoji"
    ];
    emoji = [ "Noto Color Emoji" ];
  };
};

services = {
  desktopManager.plasma6.enable = true;
  displayManager.sddm.enable = false;

  pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
};

time.timeZone = "America/Phoenix";

programs.steam = {
  enable = true;
  gamescopeSession.enable = true;
  extraCompatPackages = with pkgs; [
    proton-ge-bin
  ];
};

programs.gamemode.enable = true;
}
