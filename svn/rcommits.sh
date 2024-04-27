rm -rf repository
svnadmin create repository 

cd repository 
mkdir master, branch2, branch3 
svn mkdir -m "init" "File:///Users/kseniya/Desktop/opi/svn/repository/trunk" 
svn mkdir -m "init" "File:///Users/kseniya/Desktop/opi/svn/repository/branches" 
svn checkout "file:///Users/kseniya/Desktop/opi/svn/repository/trunk" master 
cd master 
echo "r0" >> file.txt 
svn add * 
svn commit -m "r0" --username="first" 
cd .. 
svn copy -m "b2" "File:///Users/kseniya/Desktop/opi/svn/repository/trunk" "File:///Users/kseniya/Desktop/opi/svn/repository/branches/branch2" 
svn checkout "File:///Users/kseniya/Desktop/opi/svn/repository/branches/branch2" branch2 

echo "raaaaaaaaaaaa"
cd branch2 
echo "r1" >> file.txt 
svn add * 
svn commit -m "r1" --username="second" 

cd .. 
cd master
echo "r2" >> file.txt 
svn add * 
svn commit -m "r2" --username="first" 

echo "r3" >> file.txt 
svn add * 
svn commit -m "r3" --username="first" 
cd .. 
svn copy -m "b3" "file:///Users/kseniya/Desktop/opi/svn/repository/trunk" "file:///Users/kseniya/Desktop/opi/svn/repository/branches/branch3" 
svn checkout "file:///Users/kseniya/Desktop/opi/svn/repository/branches/branch3" branch3 

cd branch3 
echo "r4" >> file.txt 
svn add * 
svn commit -m "r4" --username="second" 
echo "r5" >> file.txt 
svn add * 
svn commit -m "r5" --username="second" 
echo "r6" >> file.txt
svn add *
svn commit -m "r6" --username="second"
echo "r7" >> file.txt 
svn add * 
svn commit -m "r7" --username="second" 

cd ..
cd master
echo "r8" >> file.txt 
svn add * 
svn commit -m "r8" --username="first" 
echo "r9" >> file.txt 
svn add * 
svn commit -m "r9" --username="first" 
echo "r10" >> file.txt 
svn add * 
svn commit -m "r10" --username="first" 
echo "r11" >> file.txt 
svn add * 
svn commit -m "r11" --username="first" 
echo "r12" >> file.txt 
svn add * 
svn commit -m "r12" --username="first"

cd .. 
cd branch2
svn update 
svn merge --reintegrate "file:///Users/kseniya/Desktop/opi/svn/repository/branches/branch3" 
echo "r13" >> file.txt 
svn add * 
svn commit -m "r13" --username="second"

cd .. 
cd master 
svn update 
svn merge --reintegrate "file:///Users/kseniya/Desktop/opi/svn/repository/branches/branch2" 
echo "r14" >> file.txt 
svn add * 
svn commit -m "r14" --username="first" 
cd .. 


