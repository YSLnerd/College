program qq;
var
  inputfile, textfile: text;
  line: string;
begin
  assign(inputfile, 'D:\основы программирования и алгортмизации\лаба 12\text6.txt');
  reset(inputFile);
  assign(textfile, 'D:\основы программирования и алгортмизации\лаба 12\text62.txt');
  rewrite(textfile);
  while not eof(inputfile) do
  begin
    readln(inputfile, line);
    if line <> '' then
    begin
      writeln(textfile, line);
    end;
  end;
  close(inputfile);
  close(textfile);
  erase(inputfile);
  rename(textfile, 'D:\основы программирования и алгортмизации\лаба 12\text6.txt');
  writeln('Программа выполнена');
end.