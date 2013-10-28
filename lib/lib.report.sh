#!/usr/bin/env bash

function report_prepare {
	local site=$1
	local results=$2

	local partial_report=$(summarize $site "$results")

	report_builder "$partial_report"
}

function report_builder {
	[[ $1 ]] && mail_text="$mail_text $1"
}


function print_results {
	local IFS=$'\n'
	local site=$1
	local results=( $2 )

	if [[ $verbose && $results ]]; then
		warning "We have hits on site $site"
		for i in ${results[@]}; do
			info "	$i"
		done
	fi
}

# Takes $2 as a string on multiple lines.
# The input must be already passed through
# `split_lines` functions.
# @return an HTML block code with each line
# inside an <li></li>
function summarize {
	local IFS=$'\n'
	local site=$1
	local results=( $2 )

	[[ $results ]] || return 1

	summary="<div><ul><h5>We have hits on site $site</h5>"

	for i in ${results[@]}; do
		summary="$summary <li><pre>$i</pre></li>"
	done

	summary="$summary </ul><div>"

	echo $summary
}

# Takes stdin string such as
# "key: value key: value key: value"
# and prints one key-value pair per line. E.g.:
# "key: value"
# "key: value"
# "key: value"
#
function split_lines {
	perl -pe 's/(?<!:)\s/\n/g'
}
