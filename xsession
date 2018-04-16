#eval $(cat ~/.fehbg)
xrdb -merge .Xdefaults
light-locker --lock-on-lid --lock-on-suspend &
setxkbmap -layout us -option caps:none
xsetroot -fg \#333344 -bg \#222233 -mod 8 8
synclient TouchpadOff=1
openbox
