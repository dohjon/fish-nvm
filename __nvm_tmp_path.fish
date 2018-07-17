function __nvm_tmp_path --description "Path to tmp directory"

    set --local base_path (__nvm_base_path)

    set -l tmp_path "$base_path/tmp"

    echo $tmp_path

end