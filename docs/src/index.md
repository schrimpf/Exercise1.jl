```@meta
CurrentModule = Exercise1
```

# Exercise 1

This exercise 1 from https://github.com/ubcecon/ECON622/blob/master/notebooks/numerical_linear_algebra.ipynb

This exercise is for a practice on writing low-level routines (i.e. “kernels”), and to hopefully convince you to leave low-level code to the experts.

The formula for matrix multiplication is deceptively simple.  For example, with the product of square matrices $ C = A B $ of size $ N \times N $, the $ i,j $ element of $ C $ is

```math
C_{ij} = \sum_{k=1}^N A_{ik} B_{kj}
```

Alternatively, you can take a row $ A_{i,:} $ and column $ B_{:, j} $ and use an inner product

```math
C_{ij} = A_{i,:} \cdot B_{:,j}
```

Note that the inner product in a discrete space is simply a sum, and has the same complexity as the sum (i.e. $ O(N) $ operations).

For a dense matrix without any structure, this also makes it clear why the complexity is $ O(N^3) $: you need to evaluate it for $ N^2 $ elements in the matrix and do an $ O(N) $ operation each time.

For this exercise, implement matrix multiplication yourself and compare performance in a few permutations.

1. Use the built-in function in Julia (i.e.``C = A * B`` or, for a better comparison, the inplace version `mul!(C, A, B)` which works with preallocated data)  
1. Loop over each $ C_{ij} $ by the row first (i.e. the `i` index) and use a `for` loop for the inner product  
1. Loop over each $ C_{ij} $ by the column first (i.e. the `j` index) and use a `for` loop for the inner product  
1. Do the same but use the `dot` product instead of the sum.  
1. Choose your best implementation of these, and then for matrices of a few different sizes `N=10`, `N=1000`, etc. and compare the ratio of performance of your best implementation to the built in BLAS library.  


A few more hints:

- You can just use random matrices, e.g. `A = rand(N, N)`, etc.  
- For all of them, preallocate the $ C $ matrix beforehand with `C = similar(A)` or something equivalent.  
- To compare performance, put your code in a function and use `@btime` macro to time it.  Remember to escape globals if necessary (e.g. `@btime f(\$A)` rather than `@btime f(A)`  Documentation for [Exercise1](https://github.com/schrimpf/Exercise1.jl).


```@index
```

```@autodocs
Modules = [Exercise1]
```
