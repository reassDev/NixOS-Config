{ config, pkgs, ... }:

{

  home.username = "reass";
  home.homeDirectory = "/home/reass";
  home.stateVersion = "24.11";
  
  home.file.".bash_profile".text = ''
    if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
      exec Hyprland --config /etc/nixos/configs/hyprland.conf
    fi
  '';

  xdg.configFile."hyprland.conf".source = builtins.path { path = ./configs/hyprland.conf; };
  xdg.configFile."alacritty/alacritty.toml".source = builtins.path { path = ./configs/alacritty.toml; };
  xdg.configFile."fastfetch/config.jsonc".source = builtins.path { path = ./configs/fastfetch.jsonc; };
 }
