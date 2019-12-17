#!/bin/bash

#set -e
set -x

#IFACE="wlx34e894df1250"
IFACE="wlx9cefd5fb846c"

DRIVER="nl80211"
#DRIVER="wext"

SSID="somethign"
PSK="something_else"

killall wpa_supplicant
killall dhclient

wpa_supplicant -B -D$DRIVER -i$IFACE -c<(wpa_passphrase $SSID $PSK)
dhclient $IFACE

ping google.com
