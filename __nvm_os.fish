function __nvm_os --description "Get computer <os>"

    set --local os

    switch (uname)
        case Linux
            set os "linux"
        case Darwin
            set os "darwin"
        case '*'
            echo "[nvm][os] os:" (uname) "is currently not supported" 1>&2
            return 1
    end

    echo $os
end