{
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$mainmod" = "SUPER";
    monitor = ",preferred,auto,auto";

    exec-once = [
      "mako"
      "waybar -c ~/dotfiles/waybar/waybar.conf"
      "swayidle timeout 900 swaylock"
    ];

    # programs
    "$terminal" = "alacritty";
    "$browser" = "firefox";
    "$menu" = "fuzzel";
    "$screen_locker" = "swaylock";
    "$file_manager" = "thunar";

    "$nixpkgs" = "https://search.nixos.org/packages";
    # default env vars
    env = ["XCURSOR_SIZE,24" "QT_QPA_PLATFORMTHEME,qt5ct"];

    xwayland = {
      force_zero_scaling = true;
    };

    input = {
      kb_layout = "us";
      kb_variant = "intl";
      kb_options = "caps:swapescape";

      follow_mouse = 1;

      touchpad = {
        natural_scroll = true;
        scroll_factor = 0.7;
        tap-to-click = true;
      };
    };

    general = {
      gaps_in = 1;
      gaps_out = 0;
      border_size = 2;
      "col.active_border" = "rgba(3eb022ff)";
      "col.inactive_border" = "rgba(5b5b5bff)";

      layout = "dwindle";

      resize_on_border = true;

      allow_tearing = true;
    };

    decoration = {
      rounding = true;

      blur = {
        enabled = false;
      };

      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;
      "col.shadow" = "rgba(1a1a1aee)";
    };

    animations = {
      enabled = false;
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    misc = {
      force_default_wallpaper = 0;
    };

    # example binds, see https://wiki.hyprland.org/configuring/binds/ for more
    bind = [
      "$mainmod, return, exec, $terminal"
      "$mainmod, a, exec, $menu"
      "$mainmod, b, exec, $browser"
      "$mainmod, f, fullscreen"
      "$mainmod, m, exec, $screen_locker"
      "$mainmod, p, exec, $browser $nixpkgs"
      "$mainmod, q, killactive,"
      "$mainmod, t, exec, $file_manager"
      "$mainmod, v, togglefloating,"
      "$mainmod shift, e, exit,"

      # brightness
      "$mainmod, i, exec, brightnessctl set 5%+"
      "$mainmod shift, i, exec, brightnessctl set 5%-"

      # move focus with mainmod + arrow keys
      "$mainmod, h, movefocus, l"
      "$mainmod, l, movefocus, r"
      "$mainmod, k, movefocus, u"
      "$mainmod, j, movefocus, d"

      # move focus with mainmod + arrow keys
      "$mainmod shift, h, movewindow, l"
      "$mainmod shift, l, movewindow, r"
      "$mainmod shift, k, movewindow, u"
      "$mainmod shift, j, movewindow, d"

      # switch workspaces with mainmod + [0-9]
      "$mainmod, 1, workspace, 1"
      "$mainmod, 2, workspace, 2"
      "$mainmod, 3, workspace, 3"
      "$mainmod, 4, workspace, 4"
      "$mainmod, 5, workspace, 5"
      "$mainmod, 6, workspace, 6"
      "$mainmod, 7, workspace, 7"
      "$mainmod, 8, workspace, 8"
      "$mainmod, 9, workspace, 9"
      "$mainmod, 0, workspace, 10"

      # move active window to a workspace with mainmod + shift + [0-9]
      "$mainmod shift, 1, movetoworkspace, 1"
      "$mainmod shift, 2, movetoworkspace, 2"
      "$mainmod shift, 3, movetoworkspace, 3"
      "$mainmod shift, 4, movetoworkspace, 4"
      "$mainmod shift, 5, movetoworkspace, 5"
      "$mainmod shift, 6, movetoworkspace, 6"
      "$mainmod shift, 7, movetoworkspace, 7"
      "$mainmod shift, 8, movetoworkspace, 8"
      "$mainmod shift, 9, movetoworkspace, 9"
      "$mainmod shift, 0, movetoworkspace, 10"
    ];
    bindm = [
      "$mainmod, mouse:272, movewindow"
      "$mainmod, mouse:273, resizewindow"
    ];
  };
}
