# Benchmarks for 10 by 10 Matrices

```@example 1
using Exercise1
using BenchmarkTools
using LinearAlgebra: mul!
n = 10
S = 100
A = randn(n,n)
B = randn(n,n)
C = similar(B)
```

```@example 1
rowbench = @benchmark rowmatmul!($C,$A,$B) samples=S
```

```@example 1
colbench = @benchmark colmatmul!($C,$A,$B) samples=S
```

```@example 1
println("colmatmul! is $(minimum(rowbench.times) / minimum(colbench.times)) times faster than rowmatmul!")
```

```@example 1
linbench = @benchmark mul!($C,$A,$B) samples=S
```

```@example 1
println("mul! is $(minimum(colbench.times) / minimum(linbench.times)) times faster than colmatmul!")
```

```@example 1
turbench = @benchmark turbomul!($C,$A,$B) samples=S
```

```@example 1
println("turbomul! is $(minimum(linbench.times) / minimum(turbench.times)) times faster than mul!")
```

# Benchmarks for various sizes

```@example 2
using Exercise1
using BenchmarkTools
using LinearAlgebra: mul!
using Plots

function benchmarks(n, S=100)
  funcs = [colmatmul!, mul!, turbomul!]
  out = Vector{BenchmarkTools.Trial}(undef, 0)
  A = randn(n,n)
  B = randn(n,n)
  C = A*B
  for f in funcs
    o = @benchmark $f($C,$A,$B) samples=S
    push!(out,o)
  end
  return([median(o.times) for o in out])
end

n = 2 .^(1:9)
times=benchmarks.(n)
plot(n, hcat(times...)', labels=["colmatmul!" "mul!" "turbomul!"], xaxis=:log10, yaxis=:log10)
```

