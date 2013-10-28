#!/usr/bin/env bash

# Send mail as per configuration.
# ARGS:
# $1: the mail text (str)
function send_mail() {
	local report=$1

	[[ $report ]] || return 1

	for mail in $notification_list; do
		cat $cwd/template.html | sed "s|#!REPLACEME!#|$report|" | mail -a 'Content-Type: text/html' -a "From: $MAIL_FROM" -s "GSPharmaSTalker Report" $mail
	done
}
