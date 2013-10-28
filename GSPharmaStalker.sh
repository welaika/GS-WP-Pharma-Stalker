#!/usr/bin/env bash

cwd=$( cd $( dirname $0 ) && pwd )

for lib in `ls lib/*.sh`; do
	source $lib
done

#################################################################

do_config
manage_arguments $@

for site in `ls $domains_dir`; do
	[[ -d ${domains_dir}/${site} ]] || continue;

	set_site_root $site
	enter_site

	is_wordpress_site || continue;

	prefix=$( get_table_prefix )
	database=$( get_table_name )

	results=$( search_db $database $prefix | grep option_name | split_lines )

	[[ $verbose ]] && print_results $site "$results"

	report_prepare $site "$results"
done

# $mail_text is prepared during the "for" by `report_prepare`
# and is globaly available
[[ $mailreport ]] && send_mail "$mail_text"

exit 0
