#eval $(cat ~/.fehbg)
xrdb -merge .Xdefaults
/usr/lib/notification-daemon/notification-daemon &
light-locker --lock-on-lid --lock-on-suspend &
setxkbmap -layout us -option caps:none
xsetroot -fg \#073642 -bg \#002b36 -mod 8 8
synclient TouchpadOff=1
openbox
