program qq;
var
   filetext: text;
   a:string;
   i:integer;
begin
assign(filetext,'D:\основы программирования и алгортмизации\лаба 12\text.txt');
rewrite(filetext);
for i:=1 to 10 do
writeln(filetext,i);
close(filetext);
reset(filetext);
for i:=1 to 10 do begin
readln(filetext, a);
writeln('прочитал ', a);
end;
close(filetext);
end.