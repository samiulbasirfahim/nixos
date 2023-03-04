{ lib
, pkgs
, config
, ...
}:


let
  variables = (import ../variables.nix) { inherit config pkgs lib; };
in

{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = rec {
      modifier = "Mod4";
      bars = [ ];
      defaultWorkspace = "1";
      gaps = {
        inner = 10;
        outer = 0;
      };
      floating = {
        border = 3;
        criteria = [
          { window_role = "pop-up"; }
          { window_role = "bubble"; }
          { window_role = "task_dialog"; }
          { window_role = "Preferences"; }
          { window_type = "dialog"; }
          { window_type = "menu"; }
          #{ class = "kitty"; }
          { class = "Pavucontrol"; }
          { class = "Nemo"; }
          { class = "Lxappearance"; }
        ];
      };
      window = {
        border = 3;
      };
      colors = {
        background = "#" + variables.colors.bg;
        focused = {
          background = "#" + variables.colors.bg;
          border = "#" + variables.colors.acc;
          childBorder = "#" + variables.colors.acc;
          indicator = "#" + variables.colors.acc;
          text = "#" + variables.colors.fg;
        };
      };
      fonts = {
        names = [ "Operator Mono Lig" ];
        size = 10 * 1.0;
      };
      keybindings = lib.mkOptionDefault {
        "XF86AudioMute" = "exec pulseaudio-ctl mute &";
        "XF86AudioLowerVolume" = "exec pulseaudio-ctl down +1%";
        "XF86AudioRaiseVolume" = "exec pulseaudio-ctl up +1%";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPrev" = "exec playerctl previous";
        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioStop" = "exec playerctl stop";
        "${modifier}+q" = "kill";
        "Mod1+c" = "exec code";
        "Mod1+b" = "exec firefox";
        "Mod1+v" = "exec pavucontrol";
        "${modifier}+Return" = "exec kitty";
        "${modifier}+b" = "exec polybar-msg cmd toggle";
        "${modifier}+Shift+space" = "focus mode_toggle";
        "${modifier}+space" = "floating toggle";
        "${modifier}+z" = "exec " + variables.applicationMenu;
        "${modifier}+x" = "exec /home/fahim/.config/rofi/powermenu/type-1/powermenu.sh";
        "${modifier}+Tab" = "exec /home/fahim/.config/rofi/launchers/type-1/window.sh";
        "${modifier}+Print" = "exec maim -u ~/Pictures/screenshots/screenshot_$(date +%s).png";
        "Shift+Print" = "exec maim -u -s ~/Pictures/screenshots/screenshot_$(date +%s).png";
      };
      startup = [
        {
          command = "polybar";
          always = true;
          notification = false;
        }
        {
          command = "i3 workspace number 1";
          always = false;
          notification = false;
        }
        {
          command = "xrandr --output HDMI-A-0 --set TearFree on";
          always = false;
          notification = false;
        }
        {
          command = "picom -experimental-backend";
          always = true;
          notification = false;
        }
        {
          command = "dunst";
          always = true;
          notification = false;
        }
        {
          command = "feh --bg-scale .local/share/wallpapers/4.gif";
          always = true;
          notification = false;
        }
      ];
    };
  };
}
