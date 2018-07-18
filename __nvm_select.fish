function __nvm_select --description "Select version in <list> using command <program>" --argument-names list program

    if test -z "$list"
        echo "[nvm][select] <list> required for 1 argument" 1>&2
        return 1
    end

    if test -z "$program"
        echo "[nvm][select] <program> required for 2 argument" 1>&2
        return 1
    end

    # Use <program> to select a version in <list>
    set --local selected (string split ' ' $list | eval $program)

    if test -n "$selected"
        echo "$selected"
    else
        return 1
    end

end
