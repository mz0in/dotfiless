#!/bin/bash

# Paths to screened lists
screened_in="$HOME/.config/mutt/screened_in.txt"
screened_out="$HOME/.config/mutt/screened_out.txt"
feed_list="$HOME/.config/mutt/feed.txt"
papertrail_list="$HOME/.config/mutt/papertrail.txt"

## trim trailing spaces
sed -i '' 's/[[:space:]]*$//' "$screened_in"
sed -i '' 's/[[:space:]]*$//' "$screened_out"
sed -i '' 's/[[:space:]]*$//' "$feed_list"
sed -i '' 's/[[:space:]]*$//' "$papertrail_list"


# Function to check if an email sender is in a file
in_file() {
    local sender=$1
    local file=$2
    grep -Fxq "$sender" "$file"
}

# Correct the path to your mail directory (remove the trailing /)
mail_dir="$HOME/Documents/mutt/sspaeti.com"

printf "Starting initial screening at $(date '+%Y-%m-%d %H:%M:%S')...\n"

# Process each new email in the 'new' directory and 'cur' directory of INBOX only
for email in $(find "$mail_dir" -maxdepth 3 -type f \( -path "*/new/*" -o -path "*/INBOX/cur/*" \)); do
#only new
    sender=$(grep "^From:" "$email" | head -1 | sed 's/.*<\(.*\)>/\1/')
    # printf "Sender: %s\n" "$sender"

    if in_file "$sender" "$screened_out"; then
        printf -- "----------------------------------------\n"
        printf "Sender: %s\n" "$sender"
        printf "Moving to ScreenedOut/new: '%s'\n" "$email"
        mv "$email" "$mail_dir/ScreenedOut/new/"

     elif in_file "$sender" "$feed_list"; then
        printf -- "----------------------------------------\n"
        printf "Sender: %s\n" "$sender"
        printf "Moving to Feed/new: '%s'\n" "$email"
        mv "$email" "$mail_dir/Feed/new/"
    elif in_file "$sender" "$papertrail_list"; then
        printf -- "----------------------------------------\n"
        printf "Sender: %s\n" "$sender"
        printf "Moving to PaperTrail/new: '%s'\n" "$email"
        mv "$email" "$mail_dir/PaperTrail/new/"
    elif in_file "$sender" "$screened_in"; then
        # printf "Not moved (Screened In): %s\n" "$email"
        : # No operation, placeholder
    else
        # not in any list
        printf -- "----------------------------------------\n"
        printf "Sender: %s\n" "$sender"
        printf "New Emails (not in IN/OUT list): Moving to ToScreen/new: %s\n" "$email"
        mv "$email" "$mail_dir/ToScreen/new/"
        :
    fi
done

printf -- "####################################\n"
printf "Starting moving ToScreen back if approved by now...\n"


# Move emails from ToScreen/new back to INBOX/new if the sender is now in screened_in
for email in $(find "$mail_dir/ToScreen/new" -type f); do
    sender=$(grep "^From:" "$email" | head -1 | sed 's/.*<\(.*\)>/\1/')
    
    if in_file "$sender" "$screened_in"; then
        printf -- "----------------------------------------\n"
        mv "$email" "$mail_dir/INBOX/new/"
        printf "Moved back to INBOX/new: %s\n" "$email"
    fi
done

