#!/usr/bin/bash

git clone https://github.com/kevall474/libdrm-git.git

cd libdrm-git && makepkg -si --noconfirm && cd ..

git clone https://github.com/kevall474/libglvnd-git.git

cd libglvnd-git && makepkg -si --noconfirm && cd ..

git clone https://github.com/kevall474/mesa-pkg.git

cd mesa-pkg && env _compiler=3 _release=3 makepkg -si --noconfirm && cd ..

# make a copy of every pkg in pkg/ dir

mkdir pkg

cp -v */*.pkg.tar.zst pkg/

# clean build dir

rm -rf */src/
rm -rf */pkg/
rm -rf */*.pkg.tar.zst
