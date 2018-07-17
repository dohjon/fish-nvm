function nvm --description "node version manager for fish using fzf"


    # Get <base> folder path
    set --local base_folder (__nvm_base_path)

    # Get <tmp> folder path
    set --local tmp_folder (__nvm_tmp_path)

    # Get <versions> folder path
    set --local versions_folder (__nvm_versions_path)

    # Verify that required <dependencies> are installed
    __nvm_requirements "sha256sum"
    
    if test $status -ne 0
        return 1
    end

    # Create <base> folder
    __nvm_create "$base_folder"

    if test $status -ne 0
        return 1
    end

    # Create <base>/<tmp> folder
    __nvm_create "$tmp_folder"

    if test $status -ne 0
        return 1
    end

    # Create <base>/<versions> folder
    __nvm_create "$versions_folder"

    if test $status -ne 0
        return 1
    end

    # Get computer os
    set --local os (__nvm_os)

    if test $status -ne 0
        return 1
    end

    # Get computer architecture
    set --local arch (__nvm_arch)

    if test $status -ne 0 
        return 1
    end

    # Get <mirror>
    set --local mirror (__nvm_mirror)

    if test $status -ne 0
        return 1
    end

    # TODO
    # Get node semver version to install
    set --local version "10.6.0"

    # Purge
    __nvm_purge "$tmp_folder"

    if test $status -ne 0 
        return 1
    end

    # Purge
    __nvm_purge "$versions_folder"

    if test $status -ne 0 
        return 1
    end

    # Unlink previous package
    __nvm_unlink "$versions_folder"

    if test $status -ne 0 
        return 1
    end

    # Generate package name
    set --local package (__nvm_package $version $os $arch) 

    # Generate package url
    set --local package_url (__nvm_package_url $mirror $version $package)

    # Generate checksum name
    set --local checksum (__nvm_checksum)

    # Generate checksum url
    set --local checksum_url (__nvm_checksum_url $mirror $version $checksum)

    # Download package
    __nvm_download "$package_url" "$tmp_folder"

    if test $status -ne 0
        return 1
    end

    # Download sha256 checksum
    __nvm_download "$checksum_url" "$tmp_folder"

    if test $status -ne 0 
        return 1
    end

    # Verify
    __nvm_verify "$package" "$checksum" "$tmp_folder"

    if test $status -ne 0
        return 1
    end

    # Extract
    __nvm_extract "$package" "$tmp_folder"

    if test $status -ne 0
        return 1
    end

    # Remove
    __nvm_remove "$package" "$checksum" "$tmp_folder"

    if test $status -ne 0
        return 1
    end

    # Move
    __nvm_move "$tmp_folder" "$versions_folder/$version"

    if test $status -ne 0
        return 1
    end

    # Link
    __nvm_link "$versions_folder/$version/bin"

    if test $status -ne 0 
        return 1
    end

end