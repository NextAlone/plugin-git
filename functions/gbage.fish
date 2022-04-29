function gbage -d "List local branches and display their age"
  git for-each-ref --sort=committerdate refs/heads/ \
    --format="%(HEAD) %(color:yellow)%(refname:short)%(color:reset)%09%(color:red)%(objectname:short)%(color:reset)  %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))"
end

