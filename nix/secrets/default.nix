{
  config,
  pkgs,
  agenix,
  mysecrets,
  ...
}:

{
  imports = [
    agenix.nixosModules.default
  ];

  age.identityPaths = [
    "/etc/ssh/ssh_host_ed25519_key"
  ];

  age.secrets."smb-secrets" = {
    symlink = true;
    # target path for decrypted file
    path = "/etc/nixos/smb-secrets";
    file = "${mysecrets}/smb-secrets.age";
    mode = "0400";
    owner = "root";
    group = "root";
  };
}
