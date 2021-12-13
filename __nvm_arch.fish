function __nvm_arch --description "Get computer <arch>"

    switch (uname -m)
        case x86_64
            echo "x64"
        case '*'
            echo (uname -m) 1>&2
            return 1
    end
    
end