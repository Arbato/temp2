#!/bin/bash
PWDD=$PWD


# Create local repository
 svnadmin create repo
 REPO_URL="file://$(pwd)/repo"

 # Create the trunk and branches structure
 svn mkdir $REPO_URL/trunk -m "Creating trunk"
 svn mkdir $REPO_URL/branches -m "Creating branches"

 # Create working copy
 svn co $REPO_URL/trunk wc
 cd wc

 # Create redbranch
 svn copy $REPO_URL/trunk $REPO_URL/branches/redbranch -m "Creating redbranch"
 svn update
 svn switch $REPO_URL/branches/redbranch

 # Commit r0
 mkdir src
 cp -rf ../task_commits/commit0/* src/
 svn add ./src/. --force
 svn commit -m "r0"

 # Create Blue down branch, copy and commit r1 from Blue user
 svn copy $REPO_URL/trunk $REPO_URL/branches/bluedownbranch -m "Creating bluedownbranch"
 svn update
 svn switch $REPO_URL/branches/bluedownbranch
 sudo rm -rf /src
 mkdir src
 cp -rf ../task_commits/commit1/* src/
 svn add ./src/. --force
 svn commit -m "r1" --username=Blue

 # Switch to Red branch, copy and commit r2 and r3 from Red user
 svn switch $REPO_URL/branches/redbranch
 rm -rf /src
 mkdir src
 cp -rf ../task_commits/commit2/* src/
 svn add ./src/.
 svn commit -m "r2"
 rm -rf /src
 mkdir src
 cp -rf ../task_commits/commit3/* src/
 svn add ./src/. --force
 svn commit -m "r3"

 # Create Blue up branch, copy and commit r4 from Blue user
 svn copy $REPO_URL/trunk $REPO_URL/branches/blueupbranch -m "Creating blueupbranch"
 svn update
 svn switch $REPO_URL/branches/blueupbranch
 rm -rf /src
 mkdir src
 cp -rf ../task_commits/commit4/* src/
 svn add ./src/. --force
 svn commit  -m "r4" --username=Blue

 # Switch to Red branch, copy and commit r5 from Red user
 svn switch $REPO_URL/branches/redbranch
 rm -rf /src
 mkdir src
 cp -rf ../task_commits/commit5/* src/
 svn add ./src/. --force
 svn commit -m "r5"

 # Switch to Blue up branch, copy and commit r6 and r7 from Blue user
 svn switch $REPO_URL/branches/blueupbranch
 rm -rf /src
 mkdir src
 cp -rf ../task_commits/commit6/* src/
 svn add ./src/. --force

 svn commit -m "r6" --username=Blue
 rm -rf /src
 mkdir src
 cp -rf ../task_commits/commit7/* src/
 svn add ./src/. --force
 svn commit  -m "r7" --username=Blue

 # Switch to Blue down branch, copy and commit r8 and r9 from Blue user
 svn switch $REPO_URL/branches/bluedownbranch
 rm -rf /src
 mkdir src
 cp -rf ../task_commits/commit8/* src/
 svn add ./src/. --force
 svn commit -m "r8" --username=Blue
 rm -rf /src
 mkdir src
 cp -rf ../task_commits/commit9/* src/
 svn add ./src/. --force
 svn commit  -m "r9" --username=Blue

 # Switch to Blue up branch, copy and commit r10 and r11 from Blue user
 svn switch $REPO_URL/branches/blueupbranch
 rm -rf /src
 mkdir src
 cp -rf ../task_commits/commit10/* src/
 svn add ./src/. --force
 svn commit  -m "r10" --username=Blue
 rm -rf /src
 mkdir src
 cp -rf ../task_commits/commit11/* src/
 svn add ./src/. --force
 svn commit -m "r11" --username=Blue

 # Switch to Blue down branch, copy and commit r12 from Blue user
 svn switch $REPO_URL/branches/bluedownbranch
 rm -rf /src
 mkdir src
 cp -rf ../task_commits/commit12/* src/
 svn add ./src/. --force

 svn commit -m "r12" --username=Blue

echo "about to MERGE RAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
 # Switch to Blue up branch and merge Blue down branch into it, creating r13
 svn switch $REPO_URL/branches/blueupbranch
 svn update
 svn merge --reintegrate  $REPO_URL/branches/bluedownbranch --accept=postpone

 svn commit -m "Merged bluedownbranch into blueupbranch (r13)"


 svn switch $REPO_URL/branches/redbranch
 svn update
 svn merge --reintegrate $REPO_URL/branches/blueupbranch --accept=postpone

 svn commit -m "Merged blueupbranch into redbranch (r14)"
