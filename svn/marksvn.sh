rm -rf repository
svnadmin create repository 
cp -r task_commits repository

cd repository 
mkdir master, branch2, branch3 
svn mkdir -m "init" "File:///Users/kseniya/Desktop/opi/svn/repository/trunk" 
svn mkdir -m "init" "File:///Users/kseniya/Desktop/opi/svn/repository/branches" 
svn checkout "file:///Users/kseniya/Desktop/opi/svn/repository/trunk" master 
cd master 
cp ../task_commits/commit0/* .
svn add *
svn commit -m "r0" --username="first" 
cd .. 
svn copy -m "b2" "File:///Users/kseniya/Desktop/opi/svn/repository/trunk" "File:///Users/kseniya/Desktop/opi/svn/repository/branches/branch2" 
svn checkout "File:///Users/kseniya/Desktop/opi/svn/repository/branches/branch2" branch2 

echo "raaaaaaaaaaaa"
cd branch2 
cp ../task_commits/commit1/* .
svn add *

svn commit -m "r1" --username="second" 

cd .. 
cd master
cp ../task_commits/commit2/* .
svn add *
svn commit -m "r2" --username="first" 
cp ../task_commits/commit3/* .
svn add *

svn commit -m "r3" --username="first" 
cd .. 
svn copy -m "b3" "file:///Users/kseniya/Desktop/opi/svn/repository/trunk" "file:///Users/kseniya/Desktop/opi/svn/repository/branches/branch3" 
svn checkout "file:///Users/kseniya/Desktop/opi/svn/repository/branches/branch3" branch3 

cd branch3 
cp ../task_commits/commit4/* .
svn add *
svn commit -m "r4" --username="second" 
cp ../task_commits/commit5/* .
svn add *
svn commit -m "r5" --username="second" 
cp ../task_commits/commit6/* .
svn add *
svn commit -m "r6" --username="second"
cp ../task_commits/commit7/* .
svn add *
svn commit -m "r7" --username="second" 

cd ..
cd master
cp ../task_commits/commit8/* .
svn add *
svn commit -m "r8" --username="first" 
cp ../task_commits/commit9/* .
svn add *
svn commit -m "r9" --username="first" 
cp ../task_commits/commit10/* .
svn add *
svn commit -m "r10" --username="first" 
cp ../task_commits/commit11/* .
svn add *
svn commit -m "r11" --username="first" 
cp ../task_commits/commit12/* .
svn add *
svn commit -m "r12" --username="first"

cd .. 
cd branch2
svn update 
svn merge --reintegrate "file:///Users/kseniya/Desktop/opi/svn/repository/branches/branch3" 
cp ../task_commits/commit13/* .
svn add *
svn commit -m "r13" --username="second"

cd .. 
cd master 
svn update 
svn merge --reintegrate "file:///Users/kseniya/Desktop/opi/svn/repository/branches/branch2" 
cp ../task_commits/commit14/* .
svn add *

svn commit -m "r14" --username="first" 
cd .. 


