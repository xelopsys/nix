# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./samba.nix
    ./steam.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "xelopsys-nix";

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Tashkent";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    gh
    bun
    btop
    htop
    pnpm_9
    alejandra
    nodejs_22
    protonup-qt
    home-manager
  ];

  programs.git.enable = true;

  # Configure keymap in X11
  services.xserver.xkb.layout = "us,ru";
  services.xserver.xkb.options = "grp:win_space_toggle";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.xelopsys = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowNonFree = true;
  nixpkgs.config.allowUnfree = true;

  # programs.firefox.enable = true;

  system.stateVersion = "25.11";
}
