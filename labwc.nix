{ config, lib, pkgs, ... }:

{
  xdg.configFile = {
    "labwc/rc.xml".text = ''
      <?xml version="1.0" ?>
      <labwc_config>

        <keyboard>
          <default />
          <!-- Use a different terminal emulator -->
          <keybind key="W-Return">
            <action name="Execute" command="foot" />
          </keybind>
          <keybind key="W-q"> <!-- Quit -->
            <action name="Close" />
          </keybind>
          <keybind key="W-b"> <!-- oBliterate -->
            <action name="Close" />
          </keybind>
          <keybind key="W-n">
            <action name="ToggleMaximize" />
          </keybind>
          <keybind key="W-Tab">
            <action name="ToggleMaximize" />
          </keybind>
          <keybind key="W-x">
            <action name="Iconify" />
          </keybind>
          <keybind key="W-S-Tab">
            <action name="Iconify" />
          </keybind>
          <keybind key="A-F3">
            <action name="Execute" command="fuzzel" />
          </keybind>
          <keybind key="W-t">
            <action name="Execute" command="fuzzel" />
          </keybind>
          <keybind key="W-s">
            <action name="Execute" command="fuzzel" />
          </keybind>
          <keybind key="W-f">
            <action name="ToggleFullscreen" />
          </keybind>
          <keybind key="XF86_AudioLowerVolume">
            <action name="Execute" command="wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-" />
          </keybind>
          <keybind key="XF86_AudioRaiseVolume">
            <action name="Execute" command="wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+ -l 1.5" />
          </keybind>
          <keybind key="XF86_AudioMute">
            <action name="Execute" command="wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle" />
          </keybind>
          <keybind key="XF86_AudioMicMute">
            <action name="Execute" command="wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle" />
          </keybind>
          <keybind key="XF86_MonBrightnessUp">
            <action name="Execute" command="brightnessctl set +5%" />
          </keybind>
          <keybind key="XF86_MonBrightnessDown">
            <action name="Execute" command="brightnessctl set 5%-" />
          </keybind>
          <!-- Remove default keybinds -->
          <keybind key="W-a" />
        </keyboard>

        <libinput>
          <device category="non-touch">
            <accelProfile>flat</accelProfile>
          </device>
          <device category="touchpad">
            <naturalScroll>yes</naturalScroll>
          </device>
        </libinput>

      </labwc_config>
    '';
    "labwc/autostart".text = ''
      swaybg -i ~/.local/share/background >/dev/null 2>&1 &
      waybar >/dev/null 2>&1 &
      mako >/dev/null 2>&1 &
      # I'm not sure why I have to do this manually
      systemctl --user restart gammastep
    '';
    "labwc/environment".text = ''
      XKB_DEFAULT_LAYOUT=tangent-gallium
    '';
  };
}
