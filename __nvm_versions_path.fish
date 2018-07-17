function __nvm_versions_path --description "Path to versions directory"

    set --local base_path (__nvm_base_path)

    set -l versions_path "$base_path/versions"

    echo $versions_path

end