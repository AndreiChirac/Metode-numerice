function [w] = learn(X, y, lr, epochs)
  [m n] = size(X);
  
  for j = 1 : n-1
  X(:,j) = ( X(:,j) - mean(X(:,j))) / std(X(:,j))
  endfor

  
  
endfunction
