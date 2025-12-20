{
  pkgs,
  lib,
  ...
}:

{

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "plexmediaserver"
    ];

  services.plex = {
    enable = true;
    openFirewall = true;
    user = "lain";
  };

}
