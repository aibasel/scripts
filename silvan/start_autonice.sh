#!/bin/bash

cd ~/repos/autonice
hg pull -u

nohup ./autonice.py --log-file ~/autonice-infai_1.log infai_1 &
nohup ./autonice.py --log-file ~/autonice-infai_2.log infai_2 &
