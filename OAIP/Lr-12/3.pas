program qq;
var
   filetext: text;
   s: string;
begin
   write('Введите строку ');
   readln(s);
   assign(filetext, 'D:\основы программирования и алгортмизации\лаба 12\text.txt');
   append(filetext);
   writeln(filetext, S);
   close(filetext);  
   writeln('Строка добавлена');
end.