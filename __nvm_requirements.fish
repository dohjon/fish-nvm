function __nvm_requirements --description "Verify that required <dependencies> are installed" --argument-names dependencies

    # No dependencies provided
    if test (count $dependencies) -eq 0
        return 0
    end

    if not command -s --quiet $dependencies
        return 1
    end
end