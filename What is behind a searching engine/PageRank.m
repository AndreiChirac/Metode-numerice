function [R2sorted] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 

  fid = fopen(nume); 
  N = fscanf(fid,"%f",1);
  
  for i = 1 : N 
    
    nod = fscanf(fid,"%f",1); 
    NRnod = fscanf(fid,"%f",1);  
    
    for j = 1 : NRnod
      
      vecin = fscanf(fid,"%f",1);
    
    endfor  
    
    
  endfor
  
  val1 = fscanf(fid,"%f",1);
  val2 = fscanf(fid,"%f",1);

  fclose(fid);
  
  output  = strcat(nume , ".out");
  out = fopen(output,"w");
  
  fprintf(out,"%d \n" , N);
  fprintf(out,"\n");
  
  R1 = Iterative( nume , d , eps );
  fprintf(out,"%f\n",R1);
  fprintf(out,"\n");
  
  R2 = Algebraic( nume , d );
  fprintf(out,"%f\n",R2);
  fprintf(out,"\n");
  
  R2aux = [ [1:N]'  R2 ] ;
  [~,idx] = sort(R2aux(:,2),'descend');
  R2sorted = R2aux(idx,:);
  
  for i = 1 : N
    r = Apartenenta( R2sorted(i,2) , val1 , val2 );
    fprintf( out , " %d %d %f \n" , i,R2sorted(i,1),r);
  endfor  
  
  
  fclose(out);
  
  
  endfunction