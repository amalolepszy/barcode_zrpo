
%Wyczyszczenie obszaru roboczego oraz konsoli
close all;
clc;

%-----------------------------------------------------
%wczytywanie barcode'ów 1D
%----------------------------------------------------

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

%Deklaracja cell-arrayów zawierających zmienne barcode'ow oraz tytuły w
%celu łatwiejszej iteracji
tab_1D = {upca, upce, ean8, ean13, code39, code93, code128, codabar, itf, rss14};
title_1D = {'UPC-A', 'UPC-E', 'EAN-8', 'EAN-13', 'CODE-39', 'CODE-93', 'CODE-128', 'CODABAR', 'ITF', 'RSS-14'};


%Wyświetlenie nieprzetworzonych barcodów 1-D
figure('Name', 'Kody 1-D');

i = 1;
while i <= size(tab_1D,2)
    subplot(5,2,i);
    imshow(cell2mat(tab_1D(i))); %zmiana typu cell na array w celu wyświetlenia
    title(string(title_1D(i))); %zmiana typu cell na string
    i=i+1;
end

%Wyświetlenie barcodów 1-D po przetworzeniu
figure('Name','Rozpoznane kody 1-D');

i = 1;
while i <= size(tab_1D,2)
    a = cell2mat(tab_1D(i)); %zmiana typu cell na array

    %użycie funkcji w celu przypisania wartości i wyświetlenie w konsoli
    %msg - wiadomość przypisana do kodu paskowego
    %detectedBarcode - jest to rodzaj wykrytego barcode'u
    %loc - zmienna odpowiadająca za obszar na którym wykryty został kod
    [msg,detectedBarcode, loc] = readBarcode(a);
    disp("Decoded barcode message: " + msg);
    disp("barcode type: " + detectedBarcode);

    % Zlokalizowanie początku i umieszczenie linii w miejscu kodu paskowego
    xyBegin = loc(1,:);
    Imsg = insertText(a,xyBegin,msg,'BoxOpacity',1,'FontSize',20);
    imSize = size(Imsg);
    Imsg = insertShape(Imsg,'Line',[1 xyBegin(2) imSize(2) xyBegin(2)],'LineWidth',5);

    % Wyświetlenie przetworzonego obrazu
    subplot(5,2,i);
    imshow(Imsg);
    title('Wykryte: '+detectedBarcode);
    xlabel('Odkodowane: '+msg);
    
    
    i=i+1;
end

%------------------------------------------------------------------------
%wczytywanie kodów 2-D
%------------------------------------------------------------------------

qr = imread('qr-code.jpg');
datamatrix = imread('datamatrix.jpg');
aztec = imread('aztec.jpg');
pdf = imread('pdf417.jpg');

%Deklaracja cell-arrayów zawierających zmienne barcode'ow oraz tytuły w
%celu łatwiejszej iteracji
tab_2D = {qr, datamatrix, aztec, pdf};
title_2D = {'QR-CODE', 'DATA-MATRIX', 'AZTEC', 'PDF-417'};

%Wyświetlenie nieprzetworzonych barcodów 2-D
figure('Name', 'Kody 2-D');

i = 1;
while i <= size(tab_2D,2)
    subplot(2,2,i);
    imshow(cell2mat(tab_2D(i))); %zmiana typu cell na array w celu wyświetlenia
    title(string(title_2D(i))); %zmiana typu cell na string
    i=i+1;
end

i = 1;
while i <= size(tab_2D,2)
    a = cell2mat(tab_2D(i)); %zmiana typu cell na array
    
    %użycie funkcji w celu przypisania wartości i wyświetlenie w konsoli
    %msg - wiadomość przypisana do kodu paskowego
    %detectedBarcode - jest to rodzaj wykrytego barcode'u
    %loc - zmienna odpowiadająca za obszar na którym wykryty został kod
    [msg,detectedBarcode, loc] = readBarcode(a);
    disp("Decoded barcode message: " + msg);
    disp("barcode type: " + detectedBarcode);

    xyText =  loc(2,:);
    Imsg = insertText(a,xyText,msg,"BoxOpacity",1,"FontSize",25);

    Imsg = insertShape(Imsg, "FilledCircle", [loc, ...
        repmat(10, length(loc), 1)],"Color","red","Opacity",1);

    % Wyświetlenie przetworzonego obrazu
    subplot(2,2,i);
    imshow(Imsg);
    title('Wykryte: '+detectedBarcode);
    xlabel('Odkodowane: '+msg);


    i=i+1;
end