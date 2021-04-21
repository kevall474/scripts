#!/usr/bin/bash

# build linux-api-heades-git
git clone https://github.com/kevall474/linux-api-headers-git.git
cd linux-api-headers-git
makepkg -si --noconfirm
# make a copy of every pkg in package-$(date -I)/ dir
mkdir -p package-$(date -I)
cp -v *.pkg.tar.zst package-$(date -I)/
# clean build dir
rm -rf src/
rm -rf pkg/
cd ..

# build llvm (git version)
git clone https://github.com/kevall474/llvm-git.git
cd llvm-git
##
# my personnal command (for my machine)
#sed -i '92s/ninja/ninja -j12/' clang-git/PKGBUILD
#sed -i 's/ninja -C build all/ninja -j12 -C build all/' lib32-llvm-git/PKGBUILD
##
cd llvm-git && makepkg -si --noconfirm && cd ..
cd lld-git && makepkg -si --noconfirm && cd ..
cd openmp-git && makepkg -si --noconfirm && cd ..
cd polly-git && makepkg -si --noconfirm && cd ..
cd compiler-rt-git && makepkg -si --noconfirm && cd ..
cd clang-git && makepkg -si --noconfirm && cd ..
cd lldb-git && makepkg -si --noconfirm && cd ..
cd spirv-llvm-translator-git && makepkg -si -- noconfirm && cd ..
cd libclc-git && makepkg -si --noconfirm && cd ..
#cd libc++-git && makepkg -si --noconfirm && cd ..
cd lib32-llvm-git && makepkg -si --noconfirm && cd ..
# make a copy of every pkg in package-$(date -I)/ dir
mkdir -p package-$(date -I)
cp -v */*.pkg.tar.zst package-$(date -I)/
# clean build dir
rm -rf */src/
rm -rf */pkg/

# build robin-hood-hashing-git
git clone https://github.com/kevall474/robin-hood-hashing-git.git
cd robin-hood-hashing-git
makepkg -si --noconfirm
# make a copy of every pkg in package-$(date -I)/ dir
mkdir -p package-$(date -I)
cp -v *.pkg.tar.zst package-$(date -I)/
# clean build dir
rm -rf src/
rm -rf pkg/
cd ..

# build protobuf-git and lib32-protobuf-git
git clone https://github.com/kevall474/protobuf-git.git
cd protobuf-git
chmod +x build.sh
./build.sh
cd ..

# build KhronosGroup (git version) packages exept ocl-icd that depend on Mesa
git clone https://github.com/kevall474/KhronosGroup.git
cd KhronosGroup
chmod +x build.sh
./build.sh
cd ..

# build Xorg (git version) packages
git clone https://github.com/kevall474/Xorg.git
cd Xorg
chmod +x build.sh
./build.sh
cd ..

# build libdrm-git and lib32-libdrm-git
git clone https://github.com/kevall474/DRM.git
cd DRM
chmod +x build.sh
./build.sh
cd ..

# build libglvnd-git and lib32-libglvnd-git
git clone https://github.com/kevall474/GLVND.git
cd GLVND
chmod +x build.sh
./build.sh
cd ..

# build mesa-git and lib32-mesa-git
git clone https://github.com/kevall474/mesa-git.git
cd mesa-git
chmod +x build.sh
./build.sh
cd ..

# build Freedesktop (git version) package
git clone https://github.com/kevall474/Freedesktop.git
cd Freedesktop
chmod +x build.sh
./build.sh
cd ..

# build freeglut-git and lib32-freeglut-git
git clone https://github.com/kevall474/Freeglut.git
cd Freeglut
chmod +x build.sh
./build.sh
cd ..

# build ocl-icd-git and lib32-ocl-icd-git
cd KhronosGroup
chmod +x build-ocl.sh
./build-ocl.sh
cd ..
