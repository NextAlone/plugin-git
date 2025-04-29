function gdcp -d "Checkout origin/dev and cherry-pick the latest commit from previous branch"
    # Check if we're in a git repository
    if not git rev-parse --is-inside-work-tree >/dev/null 2>&1
        echo "Error: Not in a git repository"
        return 1
    end

    # Check if origin/dev exists
    if not git branch -r | grep -q origin/dev
        echo "Error: origin/dev does not exist"
        return 1
    end

    # Save current branch name
    set current_branch (git symbolic-ref --short HEAD 2>/dev/null)
    if test $status -ne 0
        echo "Warn: Could not determine current branch"
        # use sha1 as branch
        set current_branch (git rev-parse HEAD 2>/dev/null)
        if test $status -ne 0
            echo "Error: Could not determine current branch or SHA1"
            return 1
        end
    end

    # Get latest commit
    set latest_commit (git log --pretty=format:"%h" HEAD^..HEAD)
    if test -z "$latest_commit"
        echo "Error: No commits found"
        return 1
    end

    # Switch to origin/dev
    if not git checkout origin/dev
        echo "Error: Failed to checkout origin/dev"
        return 1
    end

    # Pull latest changes
    if not git pull origin dev --rebase
        echo "Error: Failed to pull latest changes from dev"
        git checkout $current_branch
        return 1
    end

    # Attempt cherry-pick
    if not git cherry-pick $latest_commit
        echo "Cherry-pick failed, attempting to abort..."
        git cherry-pick --abort
        git checkout $current_branch
        return 1
    end

    echo "Successfully cherry-picked commit $latest_commit from $current_branch to origin/dev"
end
