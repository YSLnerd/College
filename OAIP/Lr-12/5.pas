var
  inputFile, outputFile: text;
  number, max, min: integer;
  firstRead: integer;
begin
  assign(inputFile, 'D:\основы программирования и алгортмизации\лаба 12\zadanie51.txt');
  reset(inputFile);
  readln(inputFile, firstRead);
  max := firstRead;
  min := firstRead;
  while not eof(inputFile) do
  begin
    readln(inputFile, number);
    if number > max then
      max := number;
    if number < min then
      min := number;
  end;
  close(inputFile);
  assign(outputFile, 'D:\основы программирования и алгортмизации\лаба 12\zadanie52.txt');
  rewrite(outputFile);
  writeln(outputFile, 'Максимальное число: ', max);
  writeln(outputFile, 'Минимальное число: ', min);
  close(outputFile);
  writeln('Программа выполнена');
end.