FROM ubuntu:22.04

# Install required packages
RUN apt-get update && apt-get install -y \
    git \
    cmake \
    ninja-build \
    clang \
    lld \
    python3 \
    python3-pip \
    python3-venv \
    libcapnp-dev \
    libtool \
    autoconf \
    g++ \
    flex \
    bison \
    make \
    && rm -rf /var/lib/apt/lists/*

# Clone the LLVM project
RUN git clone https://github.com/llvm/llvm-project.git

# Set up the Python environment
RUN python3 -m venv /root/.venv/mlirdev
ENV PATH="/root/.venv/mlirdev/bin:${PATH}"
RUN pip install --upgrade pip
RUN pip install -r /llvm-project/mlir/python/requirements.txt
# Set the PYTHONPATH environment variable
ENV PYTHONPATH="/llvm-project/build/tools/mlir/python_packages/mlir_core"


# Create a build directory
WORKDIR /llvm-project/build

RUN apt-get update && apt-get install -y ccache

# Configure the project
RUN cmake -G Ninja ../llvm \
    -DLLVM_ENABLE_PROJECTS=mlir \
    -DLLVM_BUILD_EXAMPLES=ON \
    -DLLVM_TARGETS_TO_BUILD="Native;NVPTX" \
    -DCMAKE_BUILD_TYPE=Debug \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DLLVM_ENABLE_LLD=ON \
    -DLLVM_CCACHE_BUILD=ON \
    -DLLVM_USE_SANITIZER="Address;Undefined" \
    -DMLIR_INCLUDE_INTEGRATION_TESTS=ON \
    -DMLIR_ENABLE_BINDINGS_PYTHON=ON \
    -DPython3_EXECUTABLE=$(which python3)

# Build the project
RUN cmake --build .

ENV PATH="/llvm-project/mlir/build/bin:${PATH}"

# Run checks for MLIR
# RUN cmake --build . --target check-mlir





