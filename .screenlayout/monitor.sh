#!/bin/bash

echo "configuration screenlayout initializated"

monitor_integrated=$(xrandr | awk '/ connected/{print $1}' | grep -w 'eDP')
monitor_external=$(xrandr | grep -w connected | awk '{print $1}' | grep -w 'DP')

cant_monitores_externos=$( xrandr | awk '/ connected/{print $1}' | grep -w 'DP' | wc -l )
pos_integrated=$(( (${cant_monitores_externos} / 2) * 1920 ))

xrandr --output $monitor_integrated --pos ${pos_integrated}x0 --mode 1920x1200 --rotate normal

index=1
for monitor in $monitor_external
do
  if [ $(($index % 2)) -eq 0 ]; then
    xrandr --output $monitor --mode 1920x1080 --rotate normal --left-of $monitor_integrated
  else
    xrandr --output $monitor --mode 1920x1080 --rotate normal --right-of $monitor_integrated
  fi
  index=$(( $index + 1))
done

if [[ $cant_monitores_externos -gt 0 ]]; then
  bspc monitor "$monitor_integrated" -d 1 2 3
  workspaces_external_monitor=(4 5 6 7 8 9)
  workspaces_per_monitor=$(( ${#workspaces_external_monitor[@]} / ${cant_monitores_externos} ))
  index_base=0
  for monitor in $monitor_external
  do
    bspc monitor "$monitor" -d ${workspaces_external_monitor[@]:$index_base:$(( $workspaces_per_monitor + $index_base)) }
    index_base=$(( $index_base + $workspaces_per_monitor))
  done
else
  bspc monitor "$monitor_integrated" -d 1 2 3 4 5 6 7 8 9 10
fi

echo "screenlayout configurated done"
