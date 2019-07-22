#!/bin/bash

function is_autonice_running {
    ps ux | grep "autonice.py.* $1" | grep -vq grep
}

function start_autonice {
    if [ -f $AUTONICE_PATH/autonice.py ]; then
        echo "starting autonice on $1."
        nohup $AUTONICE_PATH/autonice.py --log-file $AUTONICE_PATH/autonice_$1.log $1 &
    else
        echo "Cannot find autonice. Please export the environment variable AUTONICE_PATH."
    fi
}

function start_autonice_on_demand {
    if is_autonice_running $1; then
        echo "autonice is running on $1"
    else
        echo "autonice was not running on $1."
        start_autonice $1
    fi
}

start_autonice_on_demand infai_1
start_autonice_on_demand infai_2
