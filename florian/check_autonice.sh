#!/bin/bash

INFAI_USERS=$(ls -1 /infai | sort)

function get_users_running_autonice {
    ps aux | grep "autonice.py.* $1" | grep -v grep  | awk '{ print $1 }' | sort | uniq
}

function get_users_not_running_autonice {
    comm -13  <(get_users_running_autonice $1) <(echo "$INFAI_USERS")
}

function check_autonice {
    USERS_WITHOUT_AUTONICE=$(get_users_not_running_autonice $1)
    if [ -n "${USERS_WITHOUT_AUTONICE// }" ]; then
        echo "Users not running autonice on $1"
        echo "$USERS_WITHOUT_AUTONICE"
        echo
    fi
}

check_autonice infai_1
check_autonice infai_2
