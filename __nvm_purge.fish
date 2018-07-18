function __nvm_purge --description "Purge any existing data in <folder>" --argument-names folder

    if test -z "$folder"
        echo "[nvm][purge] <folder> required for 1 argument" 1>&2
        return 1
    end

    # Files to remove
    #set --local files_to_remove (command find "$folder" -mindepth 1 1> /dev/null)

    # <folder> does not exist (no further action required)
    if not test -d "$folder"
        return 0
    end

    if not set files_to_remove (command find "$folder" -mindepth 1)
        return 1
    end

    # Remove any content in tmp folder
    if not command rm -rf $files_to_remove
        return 1
    end

end