{pkgs, lib, ...}: {
  programs.steam = {
    enable = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession = {
      enable = true;
    };
  };

  programs.gamemode.enable = true;

  programs.steam.extraCompatPackages = with pkgs; [
    proton-ge-bin
  ];

  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    samba                  # Provides ntlm_auth
    krb5                   # Provides Kerberos support libraries
    winetricks             # Useful for further troubleshooting
  ];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        mesa
        libvdpau
        libva-vdpau-driver
        libva
        vulkan-loader
        vulkan-validation-layers
      ];
    };
  };

  programs.nix-ld = {
    enable = lib.mkDefault true;
    libraries = with pkgs; [
      acl
      attr
      bzip2
      curl
      libglvnd
      libsodium
      libssh
      libxml2
      mesa
      openssl
      stdenv.cc.cc
      systemd
      util-linux
      vulkan-loader
      xz
      zlib
      zstd
    ];
  };
}
