function __nvm_create --description "Create <folder> if it does not exist" --argument-names folder

    if test -z "$folder"
        echo "[nvm][create] <folder> required for 1 argument" 1>&2
        return 1
    end

    # <folder> exists (no further action required)
    if test -d "$folder"
        return 0
    end

    # Create <folder>
    if command mkdir "$folder"
        echo "[nvm][create] Success! created folder: $folder"
    else
        echo "[nvm][create] Failure! could not create folder: $folder" 1>&2
        return 1
    end

end