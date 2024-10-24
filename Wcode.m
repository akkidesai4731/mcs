clc;
clear all;
close all;
n=input('Enter the number=')
Hn=1;
for i=0:2:n
 H2n=[Hn Hn;Hn -Hn];
 Hn=H2n;
end
disp(H2n);
[p,q]=size(H2n);
X=input('Enter first walsh code number:');
Y=input('Enter second walsh code number:');
H=H2n(X,1:q).* H2n(Y,1:q);
disp(H);
S=0;
a=1;
for b=1:q;
 S=S+H(a,b);
 b+1;
end
if S==0
 disp("The Walsh Code are Orthagonal");
else
 disp("The Walsh Code are non-orthagonal");
end
