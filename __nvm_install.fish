function __nvm_install --description "Install package"

    # Get <base> folder path
    if set base_folder (__nvm_base_path)
        echo "[nvm][path][success] <base> folder path: $base_folder"
    else
        echo "[nvm][path][error] could not set <base> folder path" 1>&2
        return 1
    end

    # Get <tmp> folder path
    if set tmp_folder (__nvm_tmp_path)
        echo "[nvm][path][success] <tmp> folder path: $tmp_folder"
    else
        echo "[nvm][path][error] could not set <tmp> folder path" 1>&2
        return 1
    end

    # Get <versions> folder path
    if set versions_folder (__nvm_versions_path)
        echo "[nvm][path][success] <versions> folder path: $versions_folder"
    else
        echo "[nvm][path][error] could not set <versions> folder path" 1>&2
        return 1
    end

    # Verify that required <dependencies> are installed
    set --local dependencies "sha256sum" "fzf"
    if __nvm_requirements $dependencies
        echo "[nvm][requirements][success] programs: $dependencies are installed"
    else
        echo "[nvm][requirements][error] programs: $dependencies are NOT installed" 1>&2
        return 1
    end

    # Create <base> folder
    if __nvm_create "$base_folder"
        echo "[nvm][create][success] created folder: $base_folder"
    else
        echo "[nvm][create][error] could not create folder: $base_folder" 1>&2
        return 1
    end

    # Create <base>/<tmp> folder
    if __nvm_create "$tmp_folder"
        echo "[nvm][create][success] created folder: $tmp_folder"
    else
        echo "[nvm][create][error] could not create folder: $tmp_folder" 1>&2
        return 1
    end

    # Create <base>/<versions> folder
    if __nvm_create "$versions_folder"
        echo "[nvm][create][success] created folder: $versions_folder"
    else
        echo "[nvm][create][error] could not create folder: $versions_folder" 1>&2
        return 1
    end

    # Get computer os
    if set os (__nvm_os)
        echo "[nvm][os][success] os: $os"
    else
        echo "[nvm][os][error] $os is currently not supported" 1>&2
        return 1
    end

    # Get computer architecture
    if set arch (__nvm_arch) 
        echo "[nvm][arch][success] arch: $arch"
    else
        echo "[nvm][arch][error] $arch is currently not supported" 1>&2
        return 1
    end

    # Get <mirror>
    if set mirror (__nvm_mirror)
        echo "[nvm][mirror][success] mirror: $mirror"
    else
        echo "[nvm][mirror][error] could not set <mirror>" 1>&2
        return 1
    end

    # Get <list> of package <versions> available to download
    if set list (__nvm_list "$mirror")
        echo "[nvm][list][success] fetched list of <versions> from mirror: $mirror"
    else
        echo "[nvm][list][error] could not fetch list of <versions> from mirror: $mirror" 1>&2
        return 1
    end

    # Select <node_version> to download from <list> using <program>
    set --local program "fzf"
    if set node_version (__nvm_select "$list" "$program")
        echo "[nvm][select][success] selected: $node_version from <list>"
    else
        echo "[nvm][select][error] selected: <nothing> from <list>" 1>&2
        return 1
    end

    # Remove any data in <tmp> folder
    if __nvm_purge "$tmp_folder"
        echo "[nvm][purge][success] purged all data in folder: $tmp_folder"
    else
        echo "[nvm][purge][error] could not remove all data in folder: $tmp_folder" 1>&2
        return 1
    end

    # Remove any data in <versions> folder
    if __nvm_purge "$versions_folder"
         echo "[nvm][purge][success] purged all data in folder: $versions_folder"
    else
        echo "[nvm][purge][error] could not remove all data in folder: $versions_folder" 1>&2
        return 1
    end

    # Remove current active <version> from $PATH
    if __nvm_unlink "$versions_folder"
        echo "[nvm][unlink][success] removed current <link> from \$PATH"
    else
        echo "[nvm][unlink][error] could not remove current <link> from \$PATH" 1>&2
        return 1
    end

    # Generate package name
    if set package (__nvm_package $node_version $os $arch) 
         echo "[nvm][package][success] generated package name: $package"
    else
        echo "[nvm][package][error] could not generate <package_name>" 1>&2
        return 1
    end

    # Generate package url
    if set package_url (__nvm_package_url $mirror $node_version $package)
         echo "[nvm][package_url][success] generated package url: $package_url"
    else
        echo "[nvm][package_url][error] could not generate <package_url>" 1>&2
        return 1
    end

    # Generate checksum name
    if set checksum (__nvm_checksum)
         echo "[nvm][checksum][success] generated checksum: $checksum"
    else
        echo "[nvm][checksum][error] could not generate <checksum>" 1>&2
        return 1
    end

    # Generate checksum url
    if set checksum_url (__nvm_checksum_url $mirror $node_version $checksum)
         echo "[nvm][checksum_url][success] generated checksum url: $checksum_url"
    else
        echo "[nvm][checksum_url][error] could not generate <checksum_url>" 1>&2
        return 1
    end

    # Download selected <version> (tarball) to <tmp> folder
    if __nvm_download "$package_url" "$tmp_folder"
         echo "[nvm][download][success] downloaded: $package_url to folder: $tmp_folder"
    else
        echo "[nvm][download][error] could not download: $package_url to folder: $tmp_folder" 1>&2
        return 1
    end

    # Download <checksum> file (sha256) to <tmp> folder
    if __nvm_download "$checksum_url" "$tmp_folder"
         echo "[nvm][download][success] downloaded: $checksum_url to folder: $tmp_folder"
    else
        echo "[nvm][download][error] could not download: $checksum_url to folder: $tmp_folder" 1>&2
        return 1
    end

    # Verify <checksum> (SHA256) of downloaded <tarball> (package) in <tmp> folder
    if __nvm_verify "$package" "$checksum" "$tmp_folder"
         echo "[nvm][verify][success] verified checksum for: $package using: $checksum in folder: $tmp_folder"
    else
        echo "[nvm][verify][error] WARNING! checksum is NOT valid package: $package" 1>&2
        return 1
    end

    # Extract files from <tarball> into <tmp> folder
    if __nvm_extract "$package" "$tmp_folder"
        echo "[nvm][extract][success] extracted $package to folder: $tmp_folder"
    else
        echo "[nvm][extract][error] could not extract: $package to folder: $tmp_folder" 1>&2
        return 1
    end

    # Remove <tarball> and <checksum> file from <tmp> folder
    if __nvm_remove "$package" "$checksum" "$tmp_folder"
        echo "[nvm][remove][success] removed: $package and: $checksum in folder: $tmp_folder" 
    else
        echo "[nvm][remove][error] could not remove: $package and: $checksum in folder: $tmp_folder" 1>&2
        return 1
    end

    # Rename <tmp> folder to <version> and then move it to <versions> folder
    if __nvm_move "$tmp_folder" "$versions_folder/$node_version"
        echo "[nvm][move][success] moved target: $tmp_folder to destination: $versions_folder/$node_version"
    else
        echo "[nvm][move][error] could not move: $tmp_folder to destination: $versions_folder/$node_version" 1>&2
        return 1
    end

    # Add newly selected <version> to $PATH
    if __nvm_link "$versions_folder/$node_version/bin" 
        echo "[nvm][link][success] added folder: $versions_folder/$node_version/bin to \$PATH"
    else
        echo "[nvm][link][error] could not add folder: $versions_folder/$node_version/bin to \$PATH" 1>&2
        return 1
    end

end