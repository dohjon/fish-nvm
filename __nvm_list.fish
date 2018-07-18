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
        set result (string split ' ' $result | sort --unique --reverse --field-separator '.' --numeric-sort --key 1,1 --key 2,2 --key  3,3 )
        echo $result
    else
        return 1
    end

end
