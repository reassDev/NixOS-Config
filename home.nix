{ config, pkgs, ... }:

{

  home.username = "reass";
  home.homeDirectory = "/home/reass";
  home.stateVersion = "24.11";
  
  home.file.".bash_profile".text = ''
    if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
      exec Hyprland
    fi
  '';

  xdg.configFile."hyprland.conf".source = ./configs/hyprland.conf;
}
