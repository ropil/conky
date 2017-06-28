#!/bin/bash
#
# Copy the conky setup into default conky configuration directory
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

CONKYCONF=$1;
if [ -z ${CONKYCONF} ]; then
  CONKYCONF=${HOME}/.config/conky/conky.conf;
else
  FORCECREATECONFIG=1;
fi

# Conky tool directory
CONKYTOOLDIR=`dirname $0`;

# Conky configuration file to install
NEWCONFIG=${CONKYTOOLDIR}/conky.conf;

# VPN-checker script
VPNCHECKER=${CONKYTOOLDIR}/conky_vpn.sh;
VPNCHECKER=$(echo ${VPNCHECKER} | sed 's/\//\\\//g');

# I/O-check and help text
if [ ! -e ${CONKYCONF} ] && [ -z ${FORCECREATECONFIG} ]; then
  echo "ERROR: Could not locate conky conf at ${CONKYCONF}!";
  echo "USAGE: $0 [<config>]";
  echo "";
  echo " OPTIONS:";
  echo "  config - Force creation of config file at specified location";
  echo "";
  echo " EXAMPLES:";
  echo "  # Force creating the default config";
  echo "  $0 ${HOME}/.config/conky/conky.conf";
  echo "";
  echo "conky_update  Copyright (C) 2017  Robert Pilstål;"
  echo "This program comes with ABSOLUTELY NO WARRANTY.";
  echo "This is free software, and you are welcome to redistribute it";
  echo "under certain conditions; see supplied General Public License.";
  exit 0;
fi;


echo "Updating conky at ${CONKYCONF}";

sed 's/<VPNCHECKER>/'${VPNCHECKER}'/g' ${NEWCONFIG} > ${CONKYCONF};
