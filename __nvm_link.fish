function __nvm_link --description "Add <folder> to $PATH" --argument-names folder

    if test -z "$folder"
        echo "[nvm][link] <folder> required for 1 argument" 1>&2
        return 1
    end

    # Add <folder> to $PATH
    set PATH "$folder" $PATH

    # Verify that <folder> was added to $PATH
    if string match "$folder" $PATH
        echo "[nvm][link] Success! adding: $folder to: \$PATH"
    else
        echo "[nvm][link] Failure! adding: $folder to: \$PATH" 1>&2
        return 1
    end

end