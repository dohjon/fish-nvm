function __nvm_cache --description "Path to <cache> directory"

    # https://specifications.freedesktop.org/basedir-spec/latest/
    set -l cache "$XDG_CACHE_HOME"

    if test -z "$cache"
        set cache $HOME/.cache
    end

    echo $cache
end