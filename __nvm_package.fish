function __nvm_package --description "Generate package name using <version> <os> <arch>" --argument-names version os arch

    if test -z "$version"
        echo "[nvm][package] <version> required for 1 argument" 1>&2
        return 1
    end

    if test -z "$os"
        echo "[nvm][package] <os> required for 2 argument" 1>&2
        return 1
    end

    if test -z "$arch"
        echo "[nvm][package] <arch> required for 3 argument" 1>&2
        return 1
    end

    # Generate <package> name in format: 
    # node-v<VERSION>-<OS>-<ARCH>.tar.gz
    echo "node-v$version-$os-$arch.tar.gz"

end