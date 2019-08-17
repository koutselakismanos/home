#!/bin/bash

pkill polybar;

sleep 1;

polybar top &
polybar bottom &
