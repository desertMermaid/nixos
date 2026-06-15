{ config, pkgs, ... }:
{
  imports = [
    ./development/bambu-studio
    ./environment/kde
    ./environment/fcitx5
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
  };

  home.packages = with pkgs; [
    wl-clipboard
    xdg-utils
  ];

  services.gpg-agent = {
    enable = true;

    defaultCacheTtl = 3600;
    pinentry.package = pkgs.pinentry-qt;
  };
}
