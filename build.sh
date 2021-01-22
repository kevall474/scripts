#!/usr/bin/bash

# build llvm,clang,compiler-rt,polly,lld,lldb,lic++,libc++adi,libc++experimental,llvm-libs,mlir,lib32-clang,lib32-llvm,lib32-llvm-libs,spirv-llvm-translator,libclc -git

git clone https://github.com/kevall474/llvm-pkg.git && cd llvm-pkg && chmod +x build.sh && ./build.sh && cd ..

# build vulkan/spirv/opencl -git

git clone https://github.com/kevall474/vulkan-spirv-pkg.git && cd vulkan-spirv-pkg && chmod +x build.sh && ./build.sh && cd ..

# build libdrm-git

git clone https://github.com/kevall474/libdrm-git.git && cd libdrm-git && makepkg -si --noconfirm && cd ..

# build libglvnd-git

git clone https://github.com/kevall474/libglvnd-git.git && cd libglvnd-git && makepkg -si --noconfirm && cd ..

# build mesa-git

git clone https://github.com/kevall474/mesa-pkg.git && cd mesa-pkg && env _compiler=3 _release=3 makepkg -si --noconfirm && cd ..

# make a copy of every pkg in pkg/ dir

mkdir pkg


cp -v */pkg/*.pkg.tar.zst pkg/
cp -v */*.pkg.tar.zst pkg/

# clean build dir

rm -rf */src/
rm -rf */pkg/
rm -rf */*/src/
rm -rf */*/pkg/
