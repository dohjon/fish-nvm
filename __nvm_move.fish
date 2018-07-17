function __nvm_move --description "Move <target> to <destination>" --argument-names target destination

    if test -z "$target"
        echo "[nvm][move] <target> required for 1 argument" 1>&2
        return 1
    end

    if test -z "$destination"
        echo "[nvm][move] <destination> required for 2 argument" 1>&2
        return 1
    end

    # Move <target> folder to <destination>
    if command mv "$target" "$destination"
        echo "[nvm][move] Success! moving: $target to: $destination"
    else
        echo "[nvm][move] Failure! moving: $target to: $destination" 1>&2
        return 1
    end

end