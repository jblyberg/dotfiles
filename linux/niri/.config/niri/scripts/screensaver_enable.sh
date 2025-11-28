#!/usr/bin/bash

swayidle -w \
  timeout 300 'swaylock -f' \
  timeout 360 'niri msg output * power off' \
  resume 'niri msg output * power on' \
  before-sleep 'swaylock -f'
