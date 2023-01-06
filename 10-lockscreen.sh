#!/bin/sh

case "$1" in
    resume)
        eval "$(/usr/local/bin/get_xenv)"
        doas \
            -u $USER \
            sh -c \
            "XAUTHORITY=$XAUTHORITY DISPLAY=$DISPLAY /usr/local/bin/lockscreen"
        ;;
    *) exit ;;
esac
