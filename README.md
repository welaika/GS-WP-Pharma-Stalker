GSwpDBStalker
=============

Stalk some Malware's database entries. Out of teh box runs on
MediaTemple (GS).

## What it stalks?

It performs scans inside the `${prefix}options` table (`wp_options` is the WP default).

The query is contained in `lib/lib.database.sh` library and searches for:

* `option_name` starting with `rss_`
* `option_name` containing `doorgen`
* `option_value` containing logic or base64 code
	* `base`
	* `esab`
	* `==`
	* alphanumerical strings longer than 100 characters
