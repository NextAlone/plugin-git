function gdcp -d "Checkout origin/dev and cherry-pick the latest commit from previous branch"
  # check if origin/dev exists
  if not git branch -r | grep -q "origin/dev"
    echo "origin/dev does not exist"
    return 1
  end
  set latest_commit (git log --pretty=format:"%h" HEAD^..HEAD)
  git checkout origin/dev
  git pull origin dev --rebase
  git cherry-pick $latest_commit
end
