#!/usr/bin/perl
use strict;
use warnings;

sub tag {
    my ($tag_name, $value, @attributes) = @_;

    my $guts = "";

    if (@attributes % 2 == 0) {
        for (my $i = 0; $i < @attributes; $i+=2) {
            $guts .= " $attributes[$i]=\"" .$attributes[$i+1] ."\"";
        }
    }

    $guts .= $value ? " >$value</$tag_name" : " /";

    return "<$tag_name $guts>"
}

sub separator {
    my ($label) = @_;
    if ($label) {
        return tag("separator", "", "label", $label)
    }
    return tag("separator", "")
}

sub item {
    my ($label, $value) = @_;
        return tag("item", $value, "label", $label)
}

sub item_exec {
    my ($label, $command) = @_;
    return item($label, tag(
            "action", tag("command", $command), "name", "execute"
        ));
}

sub battery_status {
    my $acpi_data = scalar `acpi`;

    #Battery 0: Discharging, 51%, 03:38:24 remaining
    #Battery 0: Charging, 48%, 01:11:41 until charged
    #Battery 0: Charging, 48%, charging at zero rate - will never fully charge
    # no battery -> no message
    if ($acpi_data !~ m/Battery 0: (\w+), (\d+)%i*(, ((..:..:..)?.*))?/) {
        return item("Cannot get battery status", "");
    }

    my $msg;

    $msg = item("Battery status: $1", "");
    $msg .= item("Power remaining: $2%", "");

    if ($5) {
        my $for_what = $1 eq "Charging" ? "to charge" : "remaining";
        return $msg . item("Time $for_what: $5", "");
    }

    if ($4) {
        return $msg . item("$4", "");
    }

    return $msg;

}

sub keyboard_status {
    my $xkb = `setxkbmap -query`;

    #rules:      evdev
    #model:      pc105
    #layout:     us
    if ($xkb !~ m/^layout:\s+(\w\w)$/m) {
        return item("Cannot get keyboard status", "");
    }

    my $msg = item("Current layout: $1", "");

    foreach my $layout (get_keyboard_layouts()) {
        if ($layout ne $1) {
            $msg .= item_exec("Switch to $layout", "setxkbmap $layout");
        }
    }

    return $msg;
}

sub get_keyboard_layouts {
    return sort(("us", "de", "ru"));
}

sub print_menu {
    my $menu = "";
    $menu .= battery_status();
    $menu .= separator("");
    $menu .= keyboard_status();

    print tag("openbox_pipe_menu", $menu);
}

print_menu();
