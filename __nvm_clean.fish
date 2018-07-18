function __nvm_clean --description "Remove all installed packages"

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

end