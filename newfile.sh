#!/bin/bash

#    Copyright (C) 2022  Zap058
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

# TODO: Change this to a local directory rather than hard-coded - for GitHub release
YEAR=$(date +%Y)
AUTHOR="Zappi"
TEMPLATE_DIRECTORY="/home/zappi/tmp/newfile/"
LICENCE_TEMPLATE=$TEMPLATE_DIRECTORY"gpl3.template"

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
    
    echo "$(echo "$comment" | \
        awk -v delimiter="$delimiter" '{ print delimiter, $0 }'
    )"

}

function generate_new_file () {
    local template="$1"
    local licence="$2"
   
    local template_filetype=$(echo $template | sed 's/.*\///')

    case $template_filetype in
        perl.*  )
            local licence_comment=$(add_delimiter "$licence" "#")
            echo "$(
                cat $template | \
                    awk -v licence_comment="$licence_comment" -f perl.awk            
            )" ;;

        latex.* )
            local licence_comment=$(add_delimiter "$licence" "%")
            echo "$(
                cat $template & echo "$licence_comment"
            )" ;;
                        
            
    esac

}

licence="$(generate_licence $LICENCE_TEMPLATE $AUTHOR $YEAR)"
generate_new_file $TEMPLATE_DIRECTORY"perl.template" "$licence"
