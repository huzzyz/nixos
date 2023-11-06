{ config, pkgs, lib, ... }:

let
  # Shared mount options
  commonMountOptions = [
    "credentials=/home/huzzyz/.smbcred"
    "uid=1000"
    "gid=100"
    "iocharset=utf8"
    "sec=ntlmssp"
    "noperm"
    "file_mode=0700"
    "dir_mode=0700"
    "_netdev"
    "x-systemd.automount"
    "noauto"
    "x-systemd.idle-timeout=60"
    "x-systemd.device-timeout=5s"
    "x-systemd.mount-timeout=5s"
  ];

in
{
  # Ensure cifs-utils is available for mounting CIFS shares
  environment.systemPackages = [ pkgs.cifs-utils ];

  # Define file systems with systemd automount for network shares
  fileSystems = {
    "/mnt/networkshares/Drive" = {
      device = "//Solitude/Drive";
      fsType = "cifs";
      options = lib.mkForce (commonMountOptions ++ ["x-gvfs-name=drive"]);
    };

    "/mnt/networkshares/Media" = {
      device = "//Solitude/data";
      fsType = "cifs";
      options = lib.mkForce (commonMountOptions ++ ["x-gvfs-name=media"]);
    };

    "/mnt/networkshares/home" = {
      device = "//Solitude/home";
      fsType = "cifs";
      options = lib.mkForce (commonMountOptions ++ ["x-gvfs-name=home"]);
    };

    "/mnt/networkshares/Software" = {
      device = "//Solitude/Software";
      fsType = "cifs";
      options = lib.mkForce (commonMountOptions ++ ["x-gvfs-name=software"]);
    };

    "/mnt/networkshares/mystuff" = {
      device = "//Solitude/mystuff";
      fsType = "cifs";
      options = lib.mkForce (commonMountOptions ++ ["x-gvfs-name=mystuff"]);
    };

    # ... Add additional mounts if necessary
  };
    # Networking Hosts
  networking.hosts = {
    "192.168.53.53" = [ "Solitude" ];
  };
}
