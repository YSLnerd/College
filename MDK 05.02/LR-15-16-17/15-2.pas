type anketa= record
  fio:string;
  birth:string;
  kurs:1..5;
end;
var data: array[1..3] of anketa;
i:integer;
begin
  for i:=1 to 3 do
  begin
  writeln('Введите ФИО студента ',i);
  readln(data[i].fio);
  writeln('Введите дату рождения студента ',i);
  readln(data[i].birth);
  writeln('Введите курс студента ',i);
  readln(data[i].kurs);
  end;
  writeln();
  for i:=1 to 3 do
    begin
  writeln('-----------------------------');
  writeln('ФИО студента ',i);
  writeln(data[i].fio);
  writeln('Дата рождения студента ',i);
  writeln(data[i].birth);
  writeln('Курс студента ',i);
  writeln(data[i].kurs);
  writeln('-----------------------------');
  end;
end.