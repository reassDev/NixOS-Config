{ config, pkgs, ... }:

{
  services.xserver.enable = false;
  services.displayManager.gdm.enable = false;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.getty.autoLogin.enable = true;
  services.getty.autoLogin.user = "reass";
  services.getty.defaultUser = "reass";

  environment.systemPackages = with pkgs; [
    hyprland
    hyprpaper
    waybar
    kitty
    wofi
    dunst
    nwg-look
    rofi-wayland
    pavucontrol
    brightnessctl
    wl-clipboard
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
    grim slurp swappy
  ];

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
}