BG="#002b36"
FG="#073642"

# Check what we have to work with...
TINT2=$(which tint2)
COMPTON=$(which compton)
HSETROOT=$(which hsetroot)
LIGHT_LOCKER=$(which light-locker)
NOTIFICATION_DAEMON="/usr/lib/notification-daemon/notification-daemon"

# Set input settings and defaults.
xrdb -merge .Xdefaults
setxkbmap -layout us -option caps:none
#synclient TouchpadOff=1

# Apply screen layout.
if [ -e $HOME/.screenlayout/default ]; then
    $HOME/.screenlayout/default
fi

# Start notification daemon.
if [ -e $NOTIFICATION_DAEMON ]; then
    $NOTIFICATION_DAEMON &
fi

# Start screen locker.
if [ -e $LIGHT_LOCKER ]; then
    $LIGHT_LOCKER --lock-on-lid --lock-on-suspend &
fi

# Start compositor.
#if [ -e $COMPTON ]; then
#    $COMPTON --dbus -C -b
#fi

# Set a background.
if [ -f $HOME/.fehbg ]; then
    echo "Using .fehbg"
    $HOME/.fehbg &
elif [ -e $HSETROOT ]; then
    echo "Using hsetroot"
    $HSETROOT -solid $BG
else;
    echo "Using xsetroot"
    xsetroot -bg #BG    
    #xsetroot -fg \#073642 -bg \#002b36 -mod 8 8
fi


# Start taskbar.
if [ -e $TINT2 ]; then
    $TINT2 &
fi

# Start window manager.
openbox
