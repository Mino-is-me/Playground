
@echo off

cd ..
cd CINEVStudio

set /p branch_name=Enter branch name: 
set /p commit_hash=Enter commit hash: 
set /p assignee=Enter assignee: 
set /p title=Enter title: 
set /p description=Enter description: 

git fetch --all

git stash 

git branch %branch_name% origin/develop 

git switch %branch_name%

git push -u origin %branch_name%

git cherry-pick -X theirs %commit_hash%

for /f "delims=" %%i in ('git diff-tree --no-commit-id --name-only -r %commit_hash%') do (
    set "file=%%i"
    echo Unlocking file: %file%
    git lfs unlock -f %file%
)

git push origin %branch_name% -o merge_request.create -o merge_request.target=develop -o merge_request.remove_source_branch -o merge_request.title=%title% -o merge_request.description=%description% -o merge_request.assign="narr"