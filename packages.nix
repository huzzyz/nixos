{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # List your packages here
    wget
    git
    vim
    cifs-utils
    microsoft-edge
    neofetch
    pfetch
    kitty
    zsh
    kdeconnect
    #libsForQt5.kdeconnect-kde
    kate
    flatpak
    libreoffice-fresh
    synology-drive-client
    #zsh-powerlevel10k
    #oh-my-zsh
    vlc
    # ... and so on
  ];
}
