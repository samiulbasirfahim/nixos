{ pkgs, ... }:
{
  programs.firefox =
    let
      userChrome = pkgs.substituteAll {
        src = ./userChrome.css;
      };
    in
    {
      enable = true;
      profiles.default = {
        userChrome = builtins.readFile userChrome;
      };
      package = with pkgs;
      wrapFirefox firefox-beta-bin-unwrapped {
          extraPolicies = {
            CaptivePortal = false;
            DisableFirefoxStudies = true;
            DisablePocket = true;
            DisableTelemetry = true;
            DisplayBookmarksToolbar = true;
            DontCheckDefaultBrowser = true;
            FirefoxHome = {
              Pocket = false;
              Snippets = false;
            };
            PasswordManagerEnabled = true;
            Preferences = {
              "browser.toolbars.bookmarks.visibility" = "never";
              "privacy.webrtc.legacyGlobalIndicator" = false;
              "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            };
          };
        };
    };
}
