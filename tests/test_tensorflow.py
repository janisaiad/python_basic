import tensorflow as tf
import pytest


# check gpu
if tf.test.is_gpu_available(cuda_only=False, min_cuda_compute_capability=None):
    print("GPU is available")
else:
    print("GPU is not available")

# check cuda
if tf.test.is_built_with_cuda():
    print("CUDA is available")
else:
    print("CUDA is not available")
