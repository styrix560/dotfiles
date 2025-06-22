if [[ ! `git status --porcelain` ]]; then
  echo "No changes"
else
  echo "Changes"
fi
