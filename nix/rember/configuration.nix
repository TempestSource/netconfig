{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./disk-config.nix
    ./containers.nix
  ];

  boot.loader.grub.devices = [ "/dev/sda" ];

  environment.systemPackages = [ pkgs.cifs-utils ];
  fileSystems."/mnt/nas" = {
    device = "//192.168.20.5/dock";
    fsType = "cifs";
    options =
      let
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
      in
      [ "${automount_opts},credentials=/etc/nixos/smb-secrets,uid=1000" ];
  };

  users.users.lain = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "docker"
    ];
    # Please change your password, do not use this
    hashedPassword = "$y$j9T$L0Trj2UBzm8QDSss886Br1$Cr0ryWv2rW22jSnGLPkDQh8pNVnDA7gHB2VsH5mwcOB";
  };
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHePl1OrAlw1SFDgTWMd75uOGsQ7BikB0y3di8BiUNGD lain@oblivion"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJC0H3bVsMxxn4Tw2CqXhPkR6rfz1rYRloJz7fLmlnBF lain@oblivion"
  ];

  networking.hostName = "rember";
  networking.firewall.allowedTCPPorts = [
    22
    53
  ];
  networking.firewall.allowedUDPPorts = [ 53 ];

  services.openssh.enable = true;
  virtualisation.docker = {
    enable = true;
  };

  time.timeZone = "US/Central";

  system.stateVersion = "25.05";

}
