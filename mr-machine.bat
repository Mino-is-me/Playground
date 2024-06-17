cd ..
cd CINEVStudio

set branch_name=fix/art-light-artifact
set commit_hash=d7a40db381d1cba6074deae5ce66ccc405bb728a
set assignee=narr
set title="fix(art) : Lighting artifact for schoolroom level"
set description="artifact by virtual shadow map"

git fetch --all 

git branch %branch_name% origin/develop 

git switch %branch_name%

git cherry-pick -X theirs %commit_hash%

git push origin %branch_name%      -o merge_request.create      -o merge_request.target=develop      -o merge_request.remove_source_branch      -o merge_request.title=%title%      -o merge_request.description=%description%      -o merge_request.assign=%assignee%