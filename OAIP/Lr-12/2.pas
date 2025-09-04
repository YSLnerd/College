program qq;
var
   filetext: text;
   i,n,k,j:integer;
begin
  write('Введите количество строк ');
  Readln(n);
  write('Введите количество символов в строке ');
  readln(k);
  assign(filetext,'D:\основы программирования и алгортмизации\лаба 12\text2.txt');
  rewrite(filetext);
  for i := 1 to n do
  begin
    for j := 1 to k do
      begin
       write(filetext, '*'); 
    end;
    writeln(filetext);
    end;
    close(filetext);
end.