#!/usr/bin/env bash

function volUp {
    pamixer --increase 5
}

function volDown {
    pamixer --decrease 5
}

function toggleMute {
    pamixer --toggle-mute
}

function listen {
    firstrun=0

    pactl subscribe 2>/dev/null | {
        while true; do
            {
                if [ $firstrun -eq 0 ]
                then
                    firstrun=1
                else
                    read -r event || break
                    if ! echo "$event" | grep -e "on card" -e "on sink"
                    then
                        # Avoid double events
                        continue
                    fi
                fi
            } &>/dev/null
            output
        done
    }
}

function output() {
    if $(pamixer --get-mute); then
      echo "  mute"
    else
      echo "  $(pamixer --get-volume-human)"
    fi
}

case "$1" in
    --up)
        volUp
        ;;
    --down)
        volDown
        ;;
    --togmute)
        toggleMute
        ;;
    --listen)
        listen
        ;;
    *)
        output
        ;;
esac
