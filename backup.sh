set -e
if [[ ! `git status --porcelain` ]]; then
  echo "No changes"
  exit 0
fi

git add .
git commit -m "Backup $(date +%Y/%m/%d)"
git push origin main
