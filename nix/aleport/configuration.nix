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
  ];

  boot.loader.grub.devices = [ "/dev/sda" ];

  users.users.lain = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    # Please change your password, do not use this
    hashedPassword = "$y$j9T$L0Trj2UBzm8QDSss886Br1$Cr0ryWv2rW22jSnGLPkDQh8pNVnDA7gHB2VsH5mwcOB";
  };

  networking.hostName = "aleport";
  networking.firewall.allowedTCPPorts = [ 22 ];
  services.openssh.enable = true;

  time.timeZone = "US/Central";

  system.stateVersion = "25.05";

}
