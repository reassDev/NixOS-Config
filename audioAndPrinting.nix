{  lib, config, pkgs, ... }:

{
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pulseaudio.
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };
  security.rtkit.enable = true;
  services.pipewire.enable = lib.mkForce false;
  # services.pipewire = {
    # enable = true;
    # alsa.enable = true;
    # alsa.support32Bit = true;
    # pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    # media-session.enable = true;
  # };
}
