function __nvm_os --description "Get computer <os>"

    switch (uname)
        case Darwin
            echo "darwin"
        case '*'
            echo (uname) 1>&2
            return 1
    end

end