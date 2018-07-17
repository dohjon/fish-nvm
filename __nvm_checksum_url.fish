function __nvm_checksum_url --description "Generate checksum url using <mirror> <version> <checksum>" --argument-names mirror version checksum

    if test -z "$mirror"
        echo "[nvm][checksum_url] <mirror> required for 1 argument" 1>&2
        return 1
    end

    if test -z "$version"
        echo "[nvm][checksum_url] <version> required for 2 argument" 1>&2
        return 1
    end

    if test -z "$checksum"
        echo "[nvm][checksum_url] <checksum> required for 3 argument" 1>&2
        return 1
    end

    # Generate <checksum> url in format:
    # <MIRROR>/v<VERSION>/<CHECKSUM>"
    echo "$mirror/v$version/$checksum"

end