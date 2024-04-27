# Set Red user configuration
 git config user.name "Red"
 git config user.email "red@gmail.com"

 # Clear directory
 rm -rf .git src

 # Initialize git repository and create Red branch
 git init
 git checkout -b redbranch
 git add .gitignore

 # Create src folder, copy and commit r0 from Red user
 mkdir src
 cp -f task_commits/commit0/* src/
 git add .
 git commit -m "r0"

 # Create Blue down branch, copy and commit r1 from Blue user
 git checkout -b bluedownbranch
 cp -f task_commits/commit1/* src/
 echo "raaaa">> ffff.txt 
 git add .
 echo "raaaa"
 git commit --author="Blue <blue@gmail.com>" -m "r1"


 # Switch to Red branch, copy and commit r2 and r3 from Red user
 git checkout redbranch
 cp -f task_commits/commit2/* src/
 git add .
 git commit -m "r2"
 cp -f task_commits/commit3/* src/
 git add .
 git commit -m "r3"

 # Create Blue up branch, copy and commit r4, r5, r6, r7 from Blue user
 git checkout -b blueupbranch
 cp -f task_commits/commit4/* src/
 git add .
 git commit --author="Blue <blue@gmail.com>" -m "r4"
 cp -f task_commits/commit5/* src/
 git add .
 git commit --author="Blue <blue@gmail.com>"  -m "r5"
 cp -f task_commits/commit6/* src/
 git add .
 git commit --author="Blue <blue@gmail.com>" -m "r6"
 cp -f task_commits/commit7/* src/
 git add .
 git commit --author="Blue <blue@gmail.com>" -m "r7"

 # Switch to Red branch, copy and commit r8, r9, r10, r11 from Red user
 git checkout redbranch
 cp -f task_commits/commit8/* src/
 git add .
 git commit -m "r8"
 cp -f task_commits/commit9/* src/
 git add .
 git commit -m "r9"
 cp -f task_commits/commit10/* src/
 git add .
 git commit -m "r10"
 cp -f task_commits/commit11/* src/
 git add .
 git commit -m "r11"

 # Switch to Blue up branch, copy and commit r12 from Blue user
 git checkout blueupbranch
 cp -f task_commits/commit12/* src/
 echo "comm 12 " >> task_commits/commit12/conflict.txt
 git add .
 git commit --author="Blue <blue@gmail.com>" -m "r12"

 # Switch to Blue down branch and merge Blue up branch into it, creating r13
 git checkout bluedownbranch
 git merge blueupbranch -m "Merging (r12 & r1) -> r13"

 git add .
 git merge --continue

 # Switch to Red branch and merge Blue up branch into it, creating r14
 git checkout redbranch
 git merge bluedownbranch -m "Merging (r13 & r11) -> r14"
 # Verify if there are merge conflicts
git add .
git merge --continue
