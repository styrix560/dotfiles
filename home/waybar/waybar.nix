{
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        height = 24;
        margin = "0";
        reload_style_on_change = true;
        modules-left = [
          "cpu"
          "memory"
          "disk"
          "battery"
        ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [
          "network"
          "clock"
        ];
                "custom/power" = {
            "format" = "";
        };
        disk = {
            "format"= " {used}";
        };
        "battery" = {
            "format" = "{icon} {capacity}%";
            "format-icons" = ["" "" "" "" ""];
        };
        "temperature" = {
            "format" = " {temperatureC}°C";
        };
        "cpu" = {
            "interval" = 3;
            "format" = " {usage}%";
        };
        "memory" = {
            "interval" = 3;
            "format" = " {}%";
        };
        "clock" = {
            "interval" = 1;
            "format" = "{:%a %F %H:%M:%S}";
        };
        "network" = {
            "interval" = 3;
            "format-wifi" = "{essid} {bandwidthUpBytes} {bandwidthDownBytes}";
            "format-disconnected" = "not connected";
        };
        "hyprland/workspaces" = {
            "format" = "{icon}";
            "on-click" = "activate";
            "format-icons" = {
                "1" = "";
                "2" = "";
                "3" = "";
                "4" = "";
                "5" = "";
            };
            "persistent-workspaces" = {
                "1" = [];
                "2" = [];
                "3" = [];
                "4" = [];
                "5" = [];
            };
            "sort-by-number" = true;
        };
    };
  };
  style = ./style.css;
}
