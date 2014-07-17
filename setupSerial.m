%Matlab-Arduino Com Setup
function [s] = setupSerial(port)
tmtool
s=serial(port);
set(s, BaudRate, 115200)
set(s, DataBits, 8);
set(s, StopBits, 1);
set(s, Parity, none);

%"Open" the object, connecting it to the Arduino
fopen(s);
a='b';
%check that Arduino's responsive
while (a~='a')
    a=fread(s,1,'uchar');
end
%Send "a" to Arduino
fprintf(s,'%c','a')
mbox=msgbox('Serial comminucation is setup.'); 
uiwait(mbox);
%SHOULD DATA BE UNSIGNED FOR ACCELEROMETER?
fscanf(s,'%u');
end
