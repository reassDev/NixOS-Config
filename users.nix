{  config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.reass = {
    isNormalUser = true;
    description = "reass";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      git
      gh
      vivaldi
      discord
      spotify
      kando
      jetbrains-toolbox
      vscodium
      prismlauncher
      obsidian
      home-manager
      fastfetch
      playerctl
      nvtopPackages.full
      alacritty
    ];
  };
}
