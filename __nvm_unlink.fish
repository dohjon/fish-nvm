function __nvm_unlink --description "Remove <folder> from $PATH" --argument-names folder

    if test -z "$folder"
        echo "[nvm][unlink] <folder> required for 1 argument" 1>&2
        return 1
    end

    # <folder> to remove
    set --local path_to_remove (string match --entire --regex "$folder/*" $PATH)

    # No previous <folder> has been added to $PATH (no further action required)
    if test (count $path_to_remove) -eq 0
        return 0
    end

    # Remove any (duplicates) matches by only selecting the first argument
    set path_to_remove $path_to_remove[1]

    # Remove <folder> from $PATH
    set PATH (string match --invert "$path_to_remove" $PATH)

    # Verify that <folder> was removed from $PATH
    if string match $path_to_remove $PATH
        echo "[nvm][unlink] Failure! removing: $path_to_remove from: \$PATH" 1>&2
        return 1
    else
        echo "[nvm][unlink] Success! removing: $path_to_remove from: \$PATH"
    end

end