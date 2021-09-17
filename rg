#!/bin/sh

## Override $rg_bin to use '-d' as an alias for '--max-depth'

rg_bin=/usr/bin/rg

for arg; do
	[ $d ] && arg=-d$arg
	case $arg in
		-d[1-9])
			max_depth="--max-depth ${arg#*d}"
			unset d
			;;
		-d) d=1 ;;
		*) args="$args $arg" ;;
	esac
done

exec $rg_bin $max_depth $args
