# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ lib, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./audioAndPrinting.nix
      ./automatic.nix
      ./localeAndNetworking.nix
      ./users.nix
      ./bootloaderAndDesktopEnvironment.nix
      ./nvidia.nix
      ./hyprland.nix
      <home-manager/nixos>
    ];
  
  # Adds home manager from ./home.nix
  home-manager.users.reass = ./home.nix;
  
  # Enable flakes and nix-command
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    hyprland
    hyprpaper
    waybar
    kitty
    nwg-look
    rofi-wayland
    pavucontrol
    brightnessctl
    swaynotificationcenter
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
    grim
    slurp
    swappy
    swww
    egl-wayland
    nvidia-vaapi-driver
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
