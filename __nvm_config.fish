function __nvm_config --description "Path to <config> directory"

    # https://specifications.freedesktop.org/basedir-spec/latest/
    set -l config "$XDG_CONFIG_HOME"

    if test -z "$config"
        set config $HOME/.config
    end

    echo $config

end