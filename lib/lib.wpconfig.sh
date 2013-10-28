#!/usr/bin/env bash

function get_table_prefix() {
	local needle=$(grep -w '$table_prefix' ${site_root}/${config})
	extract_variable $needle
}

function get_table_name() {
	local needle=$(grep -w 'DB_NAME' ${site_root}/${config})
	extract_constant $needle
}

function extract_variable() {
	local i=$@
	local i=${i#*\'}
	local i=${i%\'*}

	echo $i
}

function extract_constant() {
	local i=$@
	local i=${i%\'*}
	local i=${i##*\'}

	echo $i
}
