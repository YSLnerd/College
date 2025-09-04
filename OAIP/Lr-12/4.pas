program qq;
var
  filetext, filetext2: text;
  s: string;
  k, currentLine, totalLines: Integer;

begin
  write('Введите номер строки K: ');
  readln(k);
  assign(filetext, 'D:\основы программирования и алгортмизации\лаба 12\text.txt');
  reset(filetext);
  assign(filetext2, 'D:\основы программирования и алгортмизации\лаба 12\text2.txt');
  rewrite(filetext2);
  totalLines := 0;
  while not eof(filetext) do
  begin
    readln(filetext, s);
    totalLines := totalLines + 1;
  end;
  reset(filetext);
  currentLine := 0;
  while not eof(filetext) do
  begin
    currentLine := currentLine + 1;
    readln(filetext, s);
    if currentLine = k then
      writeln(filetext2);
    writeln(filetext2, s);
  end;
  close(filetext);
  close(filetext2);
  if (k < 1) or (k > totalLines) then
    writeln('Строка с номером K не существует. Файл не изменен.')
  else
  begin
    assign(filetext, 'D:\основы программирования и алгортмизации\лаба 12\text.txt');
    reset(filetext2);
    rewrite(filetext);
    while not eof(filetext2) do
    begin
      readln(filetext2, s);
      writeln(filetext, s);
    end;

    close(filetext);
    close(filetext2);
    writeln('Пустая строка добавлена перед строкой ', k, '.');
  end;
end.