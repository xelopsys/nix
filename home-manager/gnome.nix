{
  pkgs,
  lib,
  wallpaper,
  ...
}: let
  extensions = with pkgs.gnomeExtensions; [
    appindicator
    bluetooth-quick-connect
    clipboard-indicator
    dash-to-dock
    easyScreenCast
    pomodoro-timer
    system-monitor
    transparent-window-moving
  ];
in {
  home.packages = with pkgs;
    [
      dconf-editor
      bibata-cursors
      gnome-extension-manager
    ]
    ++ extensions;

  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = map (ext: ext.extensionUuid) extensions;
      };

      "org/gnome/shell/extensions/dash-to-dock" = {
        dash-max-icon-size = 30;
      };

      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        clock-format = "24h";
        # clock-show-seconds = true;
        toolbar-icons-size = "small";
        window-scaling-factor = 0;
        text-scaling-factor = 1;
      };

      "org/gnome/desktop/input-sources" = with lib.hm.gvariant; {
        sources = [
          (mkTuple [
            "xkb"
            "us"
          ])
          (mkTuple [
            "xkb"
            "ru"
          ])
        ];
        xkb-options = ["grp:win_space_toggle"];
      };

      "org/gnome/settings-daemon/plugins/power" = {
        power-button-action = "interactive";
        sleep-inactive-ac-timeout = 0;
        sleep-inactive-ac-type = "nothing";
        sleep-inactive-battery-type = "nothing";
      };

      "org/gnome/desktop/background" = {
        picture-uri = wallpaper;
        picture-uri-dark = wallpaper;
      };

      "org/gnome/mutter" = {
        experimental-features = ["variable-refresh-rate"];
      };
    };
  };
}
