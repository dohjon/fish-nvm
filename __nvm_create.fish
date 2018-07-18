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
    
    else
        return 1
    end

end