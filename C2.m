clear all
close all
pkg load image
clc
for(cont= 1: 250)
  caminho =strcat("C:/alessandra/C/",int2str(cont), '.jpeg');
  im = imread(caminho);

  %Separação dos canais
  r = im(:,:,1);
  g = im(:,:,2);
  b = im(:,:,3);
  %Pré-processamento do quadrado
  metrica = r - g;
  %Pré-processamento da cebolinha
  cebolinha = g - b;


  maxvalor = max(max(metrica));
  minvalor = min(min(metrica));
  metrica = uint8(((metrica - minvalor)./(maxvalor-minvalor))*255);

   matriz=[
1 1 1;
1 1 1;
1 1 1;
 ];


cebolinha2=logical(metrica);
im2=zeros(size(im,1)+2, size(im,2)+2);

for(i=2:size(im2,1)-1)
    for(j=2:size(im2,2)-1)
     im2(i,j)=cebolinha2(i-1,j-1);
    endfor
endfor
im4=cebolinha2;

for(i=2:size(im2,1)-1)
  for(j=2:size(im2,2)-1)
    if(im2(i,j)==1)
      %verificando se o EE est� contido na frente (objeto)
      if!((im2(i-1, j-1)==matriz(1,1)) && (im2(i-1,j)==matriz(1,2)) &&
      (im2(i-1,j+1)==1) && (im2(i, j-1)==1) &&
      (im2(i,j+1)==1) && (im2(i+1, j-1)==1) &&
      (im2(i+1,j)==1) && (im2(i+1,j+1)==1))
        im4(i,j) = 0;
      endif
    endif
  endfor
endfor
im2copia = im2;

im2 = im4;
for(i=2:size(im2,1)-1)
  for(j=2:size(im2,2)-1)
    if(im2(i,j)==1)
      %verificando se o EE est� contido na frente (objeto)
      if!((im2(i-1, j-1)==matriz(1,1)) && (im2(i-1,j)==matriz(1,2)) &&
      (im2(i-1,j+1)==1) && (im2(i, j-1)==1) &&
      (im2(i,j+1)==1) && (im2(i+1, j-1)==1) &&
      (im2(i+1,j)==1) && (im2(i+1,j+1)==1))
        im4(i,j) = 0;
      endif
    endif
  endfor
endfor
im2copia = im2;

im2 = im4;
for(i=2:size(im2,1)-1)
  for(j=2:size(im2,2)-1)
    if(im2(i,j)==1)
      %verificando se o EE est� contido na frente (objeto)
      if!((im2(i-1, j-1)==matriz(1,1)) && (im2(i-1,j)==matriz(1,2)) &&
      (im2(i-1,j+1)==1) && (im2(i, j-1)==1) &&
      (im2(i,j+1)==1) && (im2(i+1, j-1)==1) &&
      (im2(i+1,j)==1) && (im2(i+1,j+1)==1))
        im4(i,j) = 0;
      endif
    endif
  endfor
endfor
figure(4);
imshow(im4);

  caminho = strcat("C:/alessandra/C/" , int2str(cont), '_R.jpeg');
  imwrite(r,caminho);

  caminho = strcat("C:/alessandra/C/" , int2str(cont), '_G.jpeg');
  imwrite(g,caminho);

  caminho = strcat("C:/alessandra/C/" , int2str(cont), '_B.jpeg');
  imwrite(b,caminho);

  caminho = strcat("C:/alessandra/C/" , int2str(cont), '_metrica.jpeg');
  imwrite(metrica,caminho);

  caminho = strcat("C:/alessandra/C/" , int2str(cont), '_ReducaoRuidoMetrica.jpeg');
  imwrite(im4,caminho);

  caminho = strcat("C:/alessandra/C/" , int2str(cont), '_cebolinha.jpeg');
  imwrite(cebolinha,caminho);

  disp(strcat("Imagem_", int2str(cont), "_processada!"))
  clearvars -except cont;
endfor
