#!/usr/bin/bash

swayidle -w \
  timeout 3600 'swaylock -f' \
  timeout 3600 'niri msg output * power off' \
  resume 'niri msg output * power on' \
  before-sleep 'swaylock -f'
