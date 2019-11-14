# Only run on Linux targets not OSX
if [ `uname` == "Linux" ]; then
  # Only run if using i3wm
  if [ $XDG_CURRENT_DESKTOP == "i3" ]; then
    # Alias to open gnome-control-center
    alias gnome_control_center="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"

    # Swap the monitors around so mouse moves across as expected
    xrandr --output HDMI-1 --right-of HDMI-2
  fi
fi
