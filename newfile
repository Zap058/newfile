#!/bin/bash

cd /home/zappi/tmp/newfile

YEAR=$(date +%Y)
AUTHOR="Zappi"
LICENCE_TEMPLATE="gpl3.template"

function generate_licence () {
	local licence="$1"
	local author="$2"
	local year="$3"

	echo "$(cat $licence | 
		sed '
			s/<year>/'$year'/;
			s/<name of author>/'$author'/
		'
	)"
}

function add_delimiter () {
	local comment="$1"
	local delimiter="$2"

	echo "$(echo "$comment" | awk -v delimiter="$delimiter" '{ print delimiter, $0 }')"
}

function generate_new_file () {
	local template="$1"
	local licence="$2"
	
	case $template in
		perl.*	)
				local licence_comment=$(add_delimiter "$licence" "#")
				echo "$(
					cat $template |
						awk -v licence_comment="$licence_comment" 'NR==2 { print ""; print licence_comment } { print $0 }'
				)" ;;

		latex.*	)
				local licence_comment=$(add_delimiter "$licence" "%")
				echo "$(
					cat $template & echo "$licence_comment"
				)" ;;
						
			
	esac

}

licence="$(generate_licence $LICENCE_TEMPLATE $AUTHOR $YEAR)"
generate_new_file latex.template "$licence"
