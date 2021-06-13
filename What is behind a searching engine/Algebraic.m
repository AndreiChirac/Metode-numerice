function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
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
  
  R = PR_Inv( eye(N,N) - d* M )*( (1-d) / N )*vector1;
  
  fidout = fopen("out.txt","w");
  fprintf(fidout,"%f\n",R);
  fclose(fidout);
  
  
endfunction