function __nvm_extract --description "Extract <package> to <folder>" --argument-names package folder

    if test -z "$package"
        echo "[nvm][extract] <package> required for 1 argument" 1>&2
        return 1
    end

    if test -z "$folder"
        echo "[nvm][extract] <folder> required for 2 argument" 1>&2
        return 1
    end
    
    # Change directory to <folder>
    pushd "$folder"

    # Extract <package>
    set --local tar_parameters "--extract" "--gzip" "--strip-components=1" "--file=$package"
    if command tar $tar_parameters
        echo "[nvm][extract] Success! extracted $package to $folder"
        # Change to previous directory
        popd
    else
        echo "[nvm][extract] Failure! extracting $package to $folder" 1>&2
        # Change to previous directory
        popd
        return 1
    end

end
