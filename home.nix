{ config, pkgs, ... }:

{
  home.file.".bash_profile".text = ''
    if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
      exec Hyprland
    fi
  '';

  programs.hyprland.enable = true;

  home.file.".config/hypr/hyprpaper.conf".text = ''
  
'';

  home.file.".config/hypr/hyprland.conf".text = ''
    monitor=,preferred,auto,1.0

    input {
      kb_layout = dk
    }

    general {
      gaps_in = 5
      gaps_out = 10
      border_size = 2
      col.active_border = rgba(89b4faee)
      col.inactive_border = rgba(1e1e2e88)
    }

    decoration {
      rounding = 10
      blur {
        enabled = true
        size = 5
        passes = 3
      }
      drop_shadow = true
    }

    animations {
      enabled = yes
    }

    preload = /etc/nixos/background.png
    wallpaper = ,/etc/nixos/background.png
    ipc = off

    exec-once = waybar
    exec-once = hyprpaper
    exec-once = dunst
  '';
}