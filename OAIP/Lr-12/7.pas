program qq;
var
  inputFile, outputFile: text;
  n, i, j, sum, divisorCount: integer;
begin
  assign(inputFile, 'D:\основы программирования и алгортмизации\лаба 12\z3.in.txt');
  reset(inputFile);
  readln(inputFile, n);
  close(inputFile);
  sum := 0;
  for i := 1 to n do
  begin
    divisorCount := 0;
    for j := 1 to i do
    begin
      if i mod j = 0 then
        begin
          divisorCount+= 1;
        end;
    end;
    if divisorCount = 5 then
      sum := sum + i;
  end;
  assign(outputFile, 'D:\основы программирования и алгортмизации\лаба 12\z3.out.txt');
  rewrite(outputFile);
  writeln(outputFile, sum);
    close(outputFile);
    writeln('Сумма записана');
end.