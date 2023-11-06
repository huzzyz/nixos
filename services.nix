{ config, pkgs, ... }:

{
  # X11 Windowing System configuration.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbVariant = "";
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Enable CUPS for printing.
  services.printing.enable = true;

  # Enable the libvirt daemon for managing virtual machines
  #virtualisation.libvirtd = {
  #  enable = true;
  #  qemu.package = pkgs.qemu_kvm;
  #};
  networking.firewall.enable = false;

  # Sound settings.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire.enable = true;
  
  systemd.services.NetworkManager-wait-online = {
  wantedBy = [ "multi-user.target" ];
  after = [ "NetworkManager.service" ];
  requires = [ "NetworkManager.service" ];
  };
  # Enable ZSH and Oh My Zsh for the user.
  programs.zsh.enable = true;
  programs.zsh.ohMyZsh = {
    enable = true;
    theme = "powerlevel10k/powerlevel10k";
    plugins = [ "git" "z" ];
  };

  # Networking with NetworkManager
  networking.networkmanager.enable = true;

  # Bluetooth settings.
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
}
