% ##################################################################################
% ##  Funktion:  lconvmtx.m; Faltungsmatrix erstellen                             ##
% ##################################################################################
%
%  function H = lconvmtx(h,n)
%
%  Die Funktion erstellt eine Faltungsmatrix aus der Impulsantwort h
%       h : Spaltenvektor der Impulsantwort
%       n : Anzahl der Spalten der Faltungsmatrix
%
% Die resultierende Faltungsmatrix hat length(h)+n-1 Zeilen und n Spalten.
function H=lconvmtx(h,n);

h=h(:); % sicherstellen, dass h ein Spaltenvektor ist
H=zeros(length(h)+n-1,n);
for l=1:n
  H( (1:length(h))+l-1, l )=h;
end;
% ##### EOF #####
