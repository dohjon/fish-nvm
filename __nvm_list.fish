function __nvm_list --description "List versions in remote <url>" --argument-names url

    if test -z "$url"
        echo "[nvm][list] <url> required for 1 argument" 1>&2
        return 1
    end

    # list <source> from <url>
    set --local curl_parameters "--progress-bar" "--fail" "--show-error" "--location"

    if set --local result (curl $curl_parameters "$url")
        # Transform data
        set result (echo $result | grep --only-matching --extended-regexp '[0-9]+\.[0-9]+\.[0-9]+')
        set result (echo $result | sort -u -k 1,1n -k 2,2n -k 3,3n -t .)
        echo $result
    else
        return 1
    end

end
