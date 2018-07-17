function __nvm_package_url --description "Generate package url using <mirror> <version> <package>" --argument-names mirror version package

    if test -z "$mirror"
        echo "[nvm][package] <mirror> required for 1 argument" 1>&2
        return 1
    end

    if test -z "$version"
        echo "[nvm][package] <version> required for 2 argument" 1>&2
        return 1
    end

    if test -z "$package"
        echo "[nvm][package] <package> required for 3 argument" 1>&2
        return 1
    end

    # Generate <package> url in format:
    # <MIRROR>/v<VERSION>/<PACKAGE>"
    echo "$mirror/v$version/$package"

end