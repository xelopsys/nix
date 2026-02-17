{pkgs, lib, ...}: {
  programs.fish.enable = true;

  # see: https://wiki.nixos.org/wiki/Fish#:~:text=Setting%20fish%20as%20default%20for,user%20will%20not%20be%20fish).
  dconf = {
      enable = true;
      settings."org/gnome/Console" = {
          shell = [ "fish" ];
      };
  };
}