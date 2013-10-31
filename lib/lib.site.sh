#!/usr/bin/env bash

function enter_site {
	cd $site_root
}

function set_site_root {
	site_root="${domains_dir}/${1}/html"
}

function is_wordpress_site {
	[[ -f ${site_root}/${config} ]] && return 0 || return 1
}
