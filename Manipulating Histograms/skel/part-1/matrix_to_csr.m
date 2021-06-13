function [values, colind, rowptr] = matrix_to_csr(A)
  [m,n]= size(A); 
  
  values =  A'(A'~=0)';

  cnt = 1;
   for i = 1 : m 
    for j = 1 : n
      if(A(i,j) ~= 0)
        colind(1,cnt)= j;
        cnt++;
      endif
    endfor
  endfor
   
  [z,q] = size(values);
  cnt =1 ;
  
  for i = 1 : m 
    for j = 1 : n
      if(A(i,j) != 0)
        for k = 1 : q
          if(values(1,k) == A(i,j))  
            rowptr(1,cnt)= k;
            cnt++;
            k=q;
          endif
        endfor  
        break
      endif
    endfor
  endfor
  
  rowptr(1,cnt)=q+1;
endfunction