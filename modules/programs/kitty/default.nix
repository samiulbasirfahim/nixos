{...} : 
{
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = "0.95";
      font_family = "Operator Mono";
      font_size = 13;
      disable_ligatures = "never";
      cursor_shape = "underline";
      cursor_blink_interval = "0.5";
      cursor_stop_blinking_after = "15.0";
      scrollback_lines = 10000;
      click_interval = "0.5";
      select_by_word_characters = ":@-./_~?&=%+#";
      remember_window_size = false;
      allow_remote_control = true;
      initial_window_width = 640;
      initial_window_height = 400;
      repaint_delay = 15;
      input_delay = 3;
      visual_bell_duration = "0.0";
      url_style = "double";
      open_url_with = "default";
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      window_padding_width = 3;
      window_margin_width = 3;
      foreground = "#CAD3F5";
      background = "#24273A";
      selection_foreground = "#24273A";
      selection_background = "#F4DBD6";
    };
  };
}