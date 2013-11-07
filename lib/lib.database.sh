#!/usr/bin/env bash

function search_db {
	local database=$1
	local prefix=$2

	mysql_invoke $database "SELECT n, v FROM (SELECT option_name as n, option_value as v FROM ${prefix}options) AS opt WHERE ( n LIKE 'rss_%' OR n LIKE '%doorgen%' ) AND ( v LIKE '%base%' OR v LIKE '%esab%' OR v LIKE '%==%' OR v REGEXP '[0-9a-zA-Z\+]{100,}') \G"
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
