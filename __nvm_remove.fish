function __nvm_remove --description "Remove <tarball> file and <checksum> file from <folder>" --argument-names tarball checksum folder

    if test -z "$tarball"
        echo "[nvm][remove] <tarball> required for 1 argument" 1>&2
        return 1
    end

    if test -z "$checksum"
        echo "[nvm][remove] <checksum> required for 2 argument" 1>&2
        return 1
    end

    if test -z "$folder"
        echo "[nvm][remove] <folder> required for 3 argument" 1>&2
        return 1
    end

    # Remove
    if command rm "$folder/$tarball" "$folder/$checksum"
        echo "[nvm][remove] Success! removed: $folder/$tarball and $folder/$checksum"
    else
        echo "[nvm][remove] Failure! removing: $folder/$tarball and $folder/$checksum" 1>&2
        return 1
    end

end