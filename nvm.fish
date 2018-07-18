function nvm --description "node version manager for fish using fzf"

    switch "$argv[1]"
        case "-i" "--install"
            __nvm_install
        case "-p" "--purge"
            __nvm_clean
        case "-h" "--help"
            __nvm_help
        case "*"
            __nvm_help
    end

end