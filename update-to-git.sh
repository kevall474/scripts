#!/usr/bin/bash

#_                   _ _ _  _ _____ _  _
#| | _______   ____ _| | | || |___  | || |
#| |/ / _ \ \ / / _` | | | || |_ / /| || |_
#|   <  __/\ V / (_| | | |__   _/ / |__   _|
#|_|\_\___| \_/ \__,_|_|_|  |_|/_/     |_|

# build llvm,clang,compiler-rt,polly,lld,lldb,lic++,libc++adi,libc++experimental,llvm-libs,mlir,lib32-clang,lib32-llvm,lib32-llvm-libs,spirv-llvm-translator,libclc -git

git clone https://github.com/kevall474/llvm-pkg.git && cd llvm-pkg && chmod +x build.sh && ./build.sh && cd ..

# build spirv git package

git clone https://github.com/kevall474/spirv-pkg.git && cd spirv-pkg && chmod +x build.sh && ./build.sh && cd ..

# build protobuf-git package

git clone https://github.com/kevall474/protobuf-git.git && cd protobuf-git && env _compiler=2 _lib32=y makepkg -si && cd ..

# build glslang-git package

git clone https://github.com/kevall474/glslang-git.git && cd glslang-git && env _compiler=2 _lib32=y makepkg -si && cd ..

# build vulkan git package

git clone https://github.com/kevall474/vulkan-pkg.git && cd vulkan-pkg && chmod +x build.sh && ./build.sh && cd ..

# build opencl git package

git clone https://github.com/kevall474/opencl-pkg.git && cd opencl-pkg && chmod +x build.sh && ./build.sh && cd ..

# build xorg video driver package

git clone https://github.com/kevall474/xorg-pkg.git && cd xorg-pkg && chmod +x build.sh && ./build.sh && cd ..

# build libdrm-git

git clone https://github.com/kevall474/libdrm-git.git && cd libdrm-git && env _compiler=2 _lib32=y makepkg -si && cd ..

# build libglvnd-git

git clone https://github.com/kevall474/libglvnd-git.git && cd libglvnd-git && env _compiler=2 _lib32=y makepkg -si && cd ..

# build mesa-git

git clone https://github.com/kevall474/mesa-pkg.git && cd mesa-pkg && env _compiler=2 _release=3 _lib32=y makepkg -si && cd ..

# build glu-git

git clone https://github.com/kevall474/glu-git.git && cd glu-git && env _compiler=2 _lib32=y makepkg -si && cd ..

# build freeglut-git

git clone https://github.com/kevall474/freeglut-git.git && cd freeglut-git && env _compiler=2 _lib32=y makepkg -si && cd ..

# build umr-git

git clone https://github.com/kevall474/umr-git.git && cd umr-git && env _compiler=2 _lib32=y makepkg -si && cd ..

# build hsakmt-git

git clone https://github.com/kevall474/hsakmt-git.git && cd hsakmt-git && env _compiler=2 _lib32=y makepkg -si && cd ..

# make a copy of every pkg in pkg/ dir

mkdir pkg

cp -v */pkg/*.pkg.tar.zst pkg/
cp -v */*.pkg.tar.zst pkg/

# clean build dir

rm -rf */src/
rm -rf */pkg/
rm -rf */*/src/
rm -rf */*/pkg/
