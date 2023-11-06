{ config, pkgs, ... }:

{
  # Global configuration for Kitty using environment.etc
  environment.etc."kitty/kitty.conf".source = pkgs.writeText "kitty.conf" ''
    # Kitty Configuration
    font_family FiraCode Nerd Font Reg
    bold_font auto
    italic_font auto
    bold_italic_font auto
    cursor_shape block
    scrollback_lines 2000
    detect_urls yes
    open_url_with default
    show_hyperlink_targets no
    copy_on_select yes
    enable_audio_bell no
    background_opacity 0.8
    # ... include any other configuration options you need ...
  '';

  # Ensure the configuration directory exists in huzzyz's home directory.
  # This is only needed if you want to symlink the global config to user's local config directory.
  systemd.tmpfiles.rules = [
    "L+ /home/huzzyz/.config/kitty/kitty.conf - - - - /etc/kitty/kitty.conf"
    "d /home/huzzyz/.config/kitty 0755 huzzyz users - -"
  ];

  # Further customization can go here.
}
