#eval $(cat ~/.fehbg)
xrdb -merge .Xdefaults
/usr/lib/notification-daemon/notification-daemon &
light-locker --lock-on-lid --lock-on-suspend &
setxkbmap -layout us -option caps:none

xsetroot -fg \#073642 -bg \#002b36 -mod 8 8

#synclient TouchpadOff=1

# Apply screen layout - this might not be available
if [ -e $HOME/.screenlayout/default ]; then
    $HOME/.screenlayout/default
fi

# Turn off power management for display because radeon driver doesn't like to
# come back after turning off.
#xset -display :0 -dpms

# Start wm
openbox
