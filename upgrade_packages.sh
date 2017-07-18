#!/bin/sh

opkg update

packages=$(opkg list-upgradable | cut -d' ' -f1)

for pkg in $packages
		do
		   opkg upgrade $pkg
			if [ $? -gt 0 ]; then
				# ERROR
				echo "*********** ERROR during upgrade package: $pkg **************"
#				return
			else
				continue
			fi
		done
