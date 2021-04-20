chmod +x build.sh
./build.sh
cd ..

# build mesa
git clone https://github.com/kevall474/mesa-git.git
cd mesa-git
chmod +x build.sh
./build.sh
cd ..

# build Freedesktop package
git clone https://github.com/kevall474/Freedesktop.git
cd Freedesktop
chmod +x build.sh
./build.sh
cd ..

# Freeglut
git clone https://github.com/kevall474/Freeglut.git
cd Freeglut
chmod +x build.sh
./build.sh
cd ..

# build ocl-icd
cd KhronosGroup
chmod +x build-ocl.sh
./build-ocl.sh
cd ..
