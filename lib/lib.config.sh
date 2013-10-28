#!/usr/bin/env bash

# Out of function because bash 4.1.? seems to loss
# -g declare's flag to globalize arrays from inside
# functions
declare -A db
declare -a notification_list

function do_config() {
	#
	# DB config
	#
	db=(
		[host]=""
		[user]=""
		[password]=""
	)
	#
	# Wordpress locations and files
	#
	# Also a static absolute path should work
	domains_dir="~/domains/html"
	config='wp-config.php'
	#
	# Mail config
	#
	MAIL_FROM="gspharmastalker@$(hostname)"

	notification_list=("foo@example.com")
}
