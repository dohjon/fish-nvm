function __nvm_verify --description "Verify <checksum> of downloaded <package> in <folder> with sha256sum" --argument-names package checksum folder

    if test -z "$package"
        echo "[nvm][verify] <package> required for 1 argument" 1>&2
        return 1
    end

    if test -z "$checksum"
        echo "[nvm][verify] <checksum> required for 2 argument" 1>&2
        return 1
    end

    if test -z "$folder"
        echo "[nvm][download] <folder> required for 3 argument" 1>&2
        return 1
    end

    # Change directory to <folder>
    pushd "$folder"

    # Verify <checksum> of downloaded <package>
    if command grep "$package" "$checksum" | sha256sum -c -
        echo "[nvm][verify] Success! SHA256 checksum is valid for downloaded package: $package"
        # Change to previous directory
        popd
    else
        echo "[nvm][verify] WARNING! SHA256 checksum is NOT valid for downloaded package: $package" 1>&2
        # Change to previous directory
        popd
        return 1
    end

end