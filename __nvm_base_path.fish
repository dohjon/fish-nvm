function __nvm_base_path --description "Path to <base> directory"

    set --local config (__nvm_config)

    set -l base_path "$config/nvm"

    echo $base_path

end