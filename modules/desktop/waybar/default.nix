{ pkgs
, ...
}: {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
    style = ''
        * {
          font-family: FiraCode Nerd Font;
          font-weight: normal;
          font-size: 13px;
          min-height: 0;
          transition-property: background-color;
          transition-duration: 0.5s;
      }
      window#waybar {
        background-color: transparent;
      }
      window > box {
        margin-left: 5px;
        margin-right: 5px;
        margin-top: 5px;
        background-color: rgb(30, 30, 46);
      }
      #workspaces {
        padding-left: 0px;
        padding-right: 4px;
      }
      #workspaces button {
        padding-top: 5px;
        padding-bottom: 5px;
        padding-left: 6px;
        padding-right: 6px;
      }
      #workspaces button.active {
        background-color: rgb(181, 232, 224);
        color: rgb(26, 24, 38);
      }
      #workspaces button.urgent {
        color: rgb(26, 24, 38);
      }
      tooltip {
        background: rgb(48, 45, 65);
      }
      tooltip label {
        color: rgb(217, 224, 238);
      }
      #custom-launcher {
        font-size: 20px;
        padding-left: 8px;
        padding-right: 6px;
        color: #7ebae4;
      }
      #clock, 
      #memory, 
      #temperature,
      #cpu,
      #mpd, 
      #custom-wall, 
      #temperature, 
      #backlight, 
      #pulseaudio, 
      #network, 
      #battery, 
      #custom-powermenu, 
      #custom-cava-internal 
      {
        padding-left: 10px;
        padding-right: 10px;
      }
      #mode {
        margin-left: 10px;
        background-color: rgb(248, 189, 150);
        color: rgb(26, 24, 38);
      }
      #memory {
        color: rgb(181, 232, 224);
      }
      #cpu {
        color: rgb(245, 194, 231);
      }
      #clock {
        color: rgb(217, 224, 238);
      }
      #custom-wall {
        color: rgb(221, 182, 242);
      }
      #temperature {
        color: rgb(150, 205, 251);
      }
      #pulseaudio.microphone {
        color: rgb(248, 189, 150);
      }
      #pulseaudio {
        color: rgb(245, 224, 220);
      }
      #network {
        color: #ABE9B3;
      }
      #network.disconnected {
        color: rgb(255, 255, 255);
      }
      #custom-powermenu {
        color: rgb(242, 143, 173);
      }
      #tray {
        padding-right: 8px;
        padding-left: 10px;
      }
    '';
    settings = [{
      "layer" = "top";
      "position" = "top";
      modules-left = [
        "custom/launcher"
        "wlr/workspaces"
        "temperature"
      ];
      modules-center = [
        "clock"
      ];
      modules-right = [
        "pulseaudio"
        "pulseaudio#microphone"
        "memory"
        "cpu"
        "network"
        "custom/powermenu"
        "tray"
      ];
      "custom/launcher" = {
        "format" = " ";
        "on-click" = "pkill wofi || wofi";
        "tooltip" = false;
      };
      "custom/wall" = {
        "on-click" = "wallpaper_random";
        "on-click-middle" = "default_wall";
        "on-click-right" = "killall dynamic_wallpaper || dynamic_wallpaper &";
        "format" = " ﴔ ";
        "tooltip" = false;
      };
      "wlr/workspaces" = {
        "format" = "{icon}";
        "on-click" = "activate";
      };
      "pulseaudio" = {
        "scroll-step" = 5;
        "format" = "{icon} {volume}%";
        "format-muted" = "婢 Muted";
        "format-icons" = {
          "default" = [ "" "" "" ];
        };
        "on-click" = "pamixer -t";
        "tooltip" = false;
      };
      "pulseaudio#microphone" = {
        "format" = "{format_source}";
        "format-source" = " {volume}%";
        "format-source-muted" = " Muted";
        "on-click" = "pamixer --default-source -t";
        "on-scroll-up" = "pamixer --default-source -i 5";
        "on-scroll-down" = "pamixer --default-source -d 5";
        "scroll-step" = 5;
      };
      "clock" = {
        "interval" = 1;
        "format" = "{:%I:%M %p  %A %b %d}";
        "tooltip" = true;
        "tooltip-format" = "<tt>{calendar}</tt>";
      };
      "memory" = {
        "interval" = 1;
        "format" = "﬙ {percentage}%";
        "states" = {
          "warning" = 85;
        };
      };
      "cpu" = {
        "interval" = 1;
        "format" = " {usage}%";
      };
      "network" = {
        "interval" = 1;
        "format" = "說 Connected";
        "format-alt" = "說 {ifname} ({ipaddr})";
        "format-disconnected" = "說 Disconnected";
        "tooltip" = false;
      };
      "temperature" = {
        "tooltip" = false;
        "thermal-zone" = 2;
        "hwmon-path" = "/sys/class/hwmon/hwmon2/temp1_input";
        "format" = " {temperatureC}°C";
      };
      "custom/powermenu" = {
        "format" = "";
        "on-click" = "pkill wlogout || wlogout";
        "tooltip" = false;
      };
      "tray" = {
        "icon-size" = 15;
        "spacing" = 10;
      };
    }];
  };
  programs.waybar.package = pkgs.waybar.overrideAttrs (oa: {
    mesonFlags = (oa.mesonFlags or  [ ]) ++ [ "-Dexperimental=true" ];
  });
}
