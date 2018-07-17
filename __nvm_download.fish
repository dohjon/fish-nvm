function __nvm_download --description "Download <source> from <url> to <folder>" --argument-names url folder

    if test -z "$url"
        echo "[nvm][download] <url> required for 1 argument" 1>&2
        return 1
    end

    if test -z "$folder"
        echo "[nvm][download] <folder> required for 2 argument" 1>&2
        return 1
    end

    # Change directory to <folder>
    pushd "$folder"

    # Download <source> from <url>
    set --local curl_parameters "--progress-bar" "--fail" "--show-error" "--location" "--remote-name"
    if curl $curl_parameters "$url"
        echo "[nvm][download] Success! downloaded: $url to: $folder"
        # Change to previous directory
        popd
    else
        echo "[nvm][download] Failure! downloading: $url to: $folder" 1>&2
        # Change to previous directory
        popd
        return 1
    end
end