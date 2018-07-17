function __nvm_purge --description "Purge any existing data in <folder>" --argument-names folder

    if test -z "$folder"
        echo "[nvm][purge] <folder> required for 1 argument" 1>&2
        return 1
    end

    # Files to remove
    set --local files_to_remove (command find "$folder" -mindepth 1)

    # Remove any content in tmp folder
    if command rm -rf $files_to_remove
        echo "[nvm][purge] Success! purged all data in: $folder"
    else
        echo "[nvm][purge] Failure! could not purge the data in: $folder" 1>&2
        return 1
    end

end