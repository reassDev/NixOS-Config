{ config, pkgs, ... }:

{
  services.xserver.enable = false;
  services.displayManager.gdm.enable = false;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    configFile = ./configs/hyprland.conf;
    extraConfig = ''
      bind = SUPER + RETURN, exec, kitty
      bind = SUPER + Q, exec, killactivewindow
    '';
  };

  services.getty = {
    autoLogin.enable = true;
    autoLogin.user = "reass";
    defaultUser = "reass";
  };

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