function __nvm_link --description "Add <folder> to $PATH" --argument-names folder

    if test -z "$folder"
        echo "[nvm][link] <folder> required for 1 argument" 1>&2
        return 1
    end

    # Add <folder> to $PATH
    #set PATH "$folder" $PATH
    
    # Verify that <folder> was added to $PATH
    #if string match --quiet "$folder" $PATH
    # else
    #    return 1
    #end

    # Add <folder> to $fish_user_paths
    set --universal fish_user_paths $fish_user_paths $folder


    if string match --quiet $folder $fish_user_paths

    else
      return 1
    end

   end
