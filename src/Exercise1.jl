module Exercise1


export rowmatmul!, colmatmul!, rowmatmuldot!, colmatmuldot!, turbomul!

using LoopVectorization
import LinearAlgebra: dot

"""
   rowmatmul!(C, A, B)

Set C = A*B, looping over rows first   
"""
function rowmatmul!(C,A,B)
  for i in 1:size(C,1)    
    for j in 1:size(C,2)
      C[i,j] = zero(eltype(C))
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

function turbomul!(C, A, B)
  @turbo for n ∈ indices((C,B), 2), m ∈ indices((C,A), 1)
      Cmn = zero(eltype(C))
      for k ∈ indices((A,B), (2,1))
          Cmn += A[m,k] * B[k,n]
      end
      C[m,n] = Cmn
  end
end


end
