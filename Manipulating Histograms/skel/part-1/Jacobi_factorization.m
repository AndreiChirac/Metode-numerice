function [G_J, c_J] = Jacobi_factorization(A, b)
  
  [n,n] = size(A);
  
  D = diag(A).*eye(n,n);
  L = -tril(A) + D;
  U = -triu(A) + D;
  
  N = D;
  P = L + U;
  G_J = inv(N)*P; 
  c_J = inv(N)*b;
  
endfunction
