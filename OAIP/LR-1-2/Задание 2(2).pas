program задание_22;

var
  A,X,answer: real;
  B: integer;

begin
  writeln('Введите стоимость каждой из первых 75 газет');
  read(A);
  writeln('Введите количество проданных газет');
  read(B);
  If (B<=75) then
    begin
    answer:=(A*B);
    write(answer);
    end;
  If(B>75) then
    begin
    writeln('Введите стоимость каждой из последующих проданных газет');
    read(X);
    answer:=A*75+X*(B-75);
    write(answer);
    end;
end.