function [A, b] = generate_probabilities_system(rows)
  
  if(rows > 2)
    number = (rows*(rows+1)/2);
    A = zeros(number);  
    b = zeros(number,1);
    for i = number - rows  + 1 : number
      b(i,1) = 1 ;
    endfor
    x1 = zeros(1,number);
    x1(1,1) = 4 ;
    x1(1,2) = -1 ;
    x1(1,3) = -1;
    A(1,1:number) = x1(1,1:number);
 
  endif


endfunction