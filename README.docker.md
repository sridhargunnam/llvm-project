
docker build -f /home/sgunnam/sgunnam/compilers/docker/Dockerfile -t llvm-mlir-circt .
docker run -it -v /home/sgunnam/sgunnam/compilers/docker/llvm-project:/wsp/llvm-project llvm-mlir-circt /bin/bash
