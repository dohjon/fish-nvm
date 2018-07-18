function __nvm_arch --description "Get computer <arch>"

    switch (uname --machine)
        case x86_64
            echo "x64"
        case '*'
            echo (uname --machine) 1>&2
            return 1
    end
    
end