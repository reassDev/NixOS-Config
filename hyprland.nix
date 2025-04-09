{ config, pkgs, ... }:

{
  programs.hyprland.xwayland.enable = true;

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
    grim
    slurp
    swappy
  ];
  
  

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    XDG_CURRENT_DESKTOP = "Hyprland";
  };

}
