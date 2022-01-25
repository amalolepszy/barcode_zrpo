
%Wyczyszczenie obszaru roboczego oraz konsoli
close all;
clc;


%wczytanie obrazu do pamięci podręcznej
a = imread('qr-code.jpg');
imshow(a);

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
imshow(Imsg);