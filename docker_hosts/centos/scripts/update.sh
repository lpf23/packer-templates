#!/bin/bash -eux

if [[ $UPDATE  =~ true || $UPDATE =~ 1 || $UPDATE =~ yes ]]; then
    yum -y -q update
    echo "==> Updates applied, rebooting..."

    # reboot
    reboot
    sleep 60
fi

echo "==> update.sh skipped"