#!/bin/bash
set -o errexit

sed -i -E "s|/usr/local/bin/terraform|${target}/bin/terraform|" /etc/profile.d/terraform.sh