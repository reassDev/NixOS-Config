{  config, pkgs, ... }:

{
  # Bootloader.
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };

  # Enable the X11 windowing system.
  services.xserver.enable = false;
  
  # Enables Hyprland
  programs.hyprland.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = false;
  services.xserver.desktopManager.gnome.enable = true;
}
