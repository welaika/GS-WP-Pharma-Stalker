#!/usr/bin/env bash

function search_db {
	local database=$1
	local prefix=$2

	mysql_invoke $database "SELECT option_name, option_value FROM ${prefix}options WHERE ( option_name LIKE 'rss_%' OR option_name LIKE '%doorgen%' ) AND ( option_value LIKE '%base%' OR option_value LIKE '%esab%' OR option_value LIKE '%==%' OR option_value REGEXP '[0-9a-zA-Z\+]{100,}') \G" | grep 'option_value'
}

function mysql_invoke {
	database=$1
	query=$2

	if [[ ${db[password]} != '' ]]; then
		local password="-p${db[password]}"
	else
		local password=""
	fi

	$(which mysql) -u ${db[user]} $password -h ${db[host]} $database -e "$query" #> /dev/null
}
