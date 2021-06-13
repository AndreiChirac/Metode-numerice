function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 
  
  fid = fopen(nume); 
  N = fscanf(fid,"%f",1);
  
  A = zeros(N,N);
  K = zeros(N,N);
  
  for i = 1 : N 
    
    nod = fscanf(fid,"%f",1); 
    NRnod = fscanf(fid,"%f",1);  
    
    for j = 1 : NRnod
      
      vecin = fscanf(fid,"%f",1);
      
      if( nod != vecin )
        A(nod,vecin) = 1;   % am pus aceasta conditie deoarece linkurile care se afla pe diagonala nu conteaza
        K(i,i) = K(i,i) + 1; %am luat in calcul toti vecinii care nu se afla pe diagonala  
      endif
         
    endfor  
    
    
  endfor
  
  val1 = fscanf(fid,"%i",1);
  val2 = fscanf(fid,"%i",1);
  
  fclose(fid);
 
  M = ( inv(K) * A )'; 
 
  vector1 = ones(N,1);  
  
  Rfirst(1:N,1) = 1/N ;
  R = d*M*Rfirst + ( ( 1-d )/N ) * vector1;
  
  while( norm(R - Rfirst) >= eps )
    Rfirst = R;
    R = d*M*Rfirst + ( ( 1-d )/N ) * vector1;  
  endwhile

  R = Rfirst;
  
 endfunction