
%Wyczyszczenie obszaru roboczego oraz konsoli
close all;
clc;

%-----------------------------------------------------
%wczytywanie barcode'ów 1D
%----------------------------------------------------

%wczytanie obrazu do pamięci podręcznej
upca = imread('upc-a.jpg');
upce = imread('upc-e.jpg');
ean8 = imread('ean-8.jpg');
ean13 = imread('ean-13.jpg');
code39 = imread('code-39.jpg');
code93 = imread('code-93.jpg');
code128 = imread('code-128.jpg');
codabar = imread('codabar.jpg');
itf = imread('itf-14.jpg');
rss14 = imread('databar(rss_14).jpg');

tab_1D = {upca, upce, ean8, ean13, code39, code39, code128, codabar, itf, rss14};


figure('Name', 'Kody 1-D');

subplot(5,2,1);
imshow(upca);
title('UPC-A');

subplot(5,2,2);
imshow(upce);
title('UPC-E');

subplot(5,2,3);
imshow(ean8);
title('EAN-8');

subplot(5,2,4);
imshow(ean13);
title('EAN-13');

subplot(5,2,5);
imshow(code39);
title('CODE-39');

subplot(5,2,6);
imshow(code93);
title('CODE-93');

subplot(5,2,7);
imshow(code128);
title('CODE-128');

subplot(5,2,8);
imshow("codabar.jpg");
title('CODABAR');

subplot(5,2,9);
imshow(itf);
title('ITF');

subplot(5,2,10);
imshow(rss14);
title('RSS-14');

figure(2);


i = 1;
while i <= 9
    a = cell2mat(tab_1D(i));

    %użycie funkcji w celu przypisania wartości i wyświetlenie w konsoli
    %msg - wiadomość przypisana do kodu paskowego
    %detectedBarcode - jest to rodzaj wykrytego barcode'u
    %loc - zmienna odpowiadająca za obszar na którym wykryty został kod
    [msg,detectedBarcode, loc] = readBarcode(a);
    disp("Decoded barcode message: " + msg);
    disp("barcode type: " + detectedBarcode);

    % Zlokalizowanie początku i umieszczenie linii w miejscu kodu paskowego
    % Wyświetlenie obrazu
    xyBegin = loc(1,:);
    Imsg = insertText(a,xyBegin,msg,'BoxOpacity',1,'FontSize',20);
    imSize = size(Imsg);
    Imsg = insertShape(Imsg,'Line',[1 xyBegin(2) imSize(2) xyBegin(2)],'LineWidth',5);
    subplot(5,2,i);
    imshow(Imsg);
    
    
    i=i+1;
end




