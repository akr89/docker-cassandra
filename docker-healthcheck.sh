#!/bin/bash
set -eo pipefail

statusgossip=$(nodetool statusgossip)

if [ "$statusgossip" == "running" ] ; then
	exit 0
fi

exit 1
