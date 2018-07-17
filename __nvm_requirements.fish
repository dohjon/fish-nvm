function __nvm_requirements --description "Verify that required <dependencies> are installed" --argument-names dependencies

    # No dependencies provided
    if test (count $dependencies) -eq 0
        return 0
    end

    if not command -s --quiet $dependencies
        echo "[nvm][requirements] Failure! missing required dependencies" 1>&2
        echo "[nvm][requirements] Please install: $dependencies" 1>&2
        return 1
    end
end