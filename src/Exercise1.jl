module Exercise1

using Infiltrator

export rowmatmul!, colmatmul!, rowmatmuldot!, colmatmuldot!

# Write your package code here.
import LinearAlgebra: dot

"""
   rowmatmul!(C, A, B)

Set C = A*B, looping over rows first   
"""
function rowmatmul!(C,A,B)
  for i in 1:size(C,1)    
    for j in 1:size(C,2)
      C[i,j] = zero(eltype(C))
      @infiltrate
      for k in 1:size(A,2)
        C[i,j] += A[i,k]*B[k,j]
      end
    end
  end
end

function colmatmul!(C,A,B)
  for j in 1:size(C,1)    
    for i in 1:size(C,2)
      C[i,j] = zero(eltype(C))
      for k in 1:size(A,2)
        C[i,j] += A[i,k]*B[k,j]
      end
    end
  end
end

function rowmatmuldot!(C,A,B)
  error("not implemented")
end

function colmatmuldot!(C,A,B)
  error("not implemented")
end

end
