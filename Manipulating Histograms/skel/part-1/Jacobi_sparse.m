function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  end
  G = csr_multiplication(G_values, G_colind, G_rowptr, );
  
  cnt = 0;
  x1 = G * x0 + c;
  cnt++;
  
  while( norm(x1-x0) > tol )
    
    x0 = x1;
    x1 = G * x0 + c;
    cnt++;
  
  endwhile
  
  
endfunction