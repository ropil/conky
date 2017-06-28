#!/bin/bash
#
# Checks what vpn that is running and outputs a three letter identifier
# Copyright (C) 2017  Robert Pilstål
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program. If not, see <http://www.gnu.org/licenses/>.
set -e;

# Names of interfaces typically used
vpn=`ip addr | grep [vt][apu][pn] | wc -l`

if [ ${vpn} -gt 0 ]; then
  # netctl controlled (openconnect) status active example
  if [ "`netctl status vpn-ifm |grep Active|awk '{print $2}'`x" = "activex" ]; then
    echo "IFM";
  # openvpn config file status active example
  elif [ "`ps aux | grep openvpn | grep -v grep | head -n 1 | awk '{print $NF}'`x" = "integrity.confx" ]; then
    echo "INT";
  else
    echo "UNK";
  fi
else
  echo " - ";
fi;
