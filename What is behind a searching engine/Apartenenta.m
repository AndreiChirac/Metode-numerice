function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1 

  
  % se pun conditile de continuitate pentru a afla a si b
  % vom calcula limitele la stanga si dreapta in punctele x = val1 si x = val2
  % (1)lim cand x tinde la val1 la dreapta va fi egala cu a*(val1) + b 
  % (2)lim cand x tinde la val1 la stanga va fi egala cu 0
  % Din 1 si 2 va rezulta ca  a = (-b) / val1
  % analog si pentru x = val 2 de unde vom obtine ca a = (1-b)/val2
  % astfel vom avea (-b) / val1 = (1-b)/val2 => -b*val2 = val1 - b*val1 => b(val1-val2) = val1 =>
  b = ( val1 )/( val1 - val2 );
  % se inlocuieste b in ecuatia a =(-b)/val1 de unde vom obtine ca
  a = -1 / ( val1 - val2 );
  
  if ( x>= 0 && x < val1 )
   y = 0 ;    
  elseif( x >= val1 && x <= val2 )  
   y = a * x + b ; 
  elseif( x > val2 && x <= 1 ) 
   y = 1; 
  endif

endfunction