#!/usr/bin/env bash

function manage_arguments {
	if [[ $# -eq 0 ]]; then
		error 'Please, fill in at least on option'
		usage
	fi

	while getopts "mvh" opt; do
		case $opt in
			m) mailreport=true ;;
			v) verbose=true ;;
			h) usage ;;
			*) usage ;;
		esac
	done
}

function usage {
	echo "Usage: $(basename $0) [-m] [-v]"
	echo "Possible options are:"
	echo "		-m	Send mail report"
	echo "		-v	Print results on STDOUT"
	echo "		-h display this help"

	exit 1
}
