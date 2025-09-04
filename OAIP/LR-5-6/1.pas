program qq;

var
  a, b, c, f, g, h, o: integer;
  D: ARRAY[1..20] of integer;

begin
  randomize;
  c := 0;
  f := 1;
  o := 0;
  writeln('Введите диапазон');
  readln(g, h);
  for b := 1 to 20 do
  begin
    D[b] := random(116) - 22;
    if (D[b] mod 2 = 0) and (b mod 2 <> 0) then
      c += 1;  
    if (D[b] mod 2 = 0) then
      f *= D[b];
    if (D[b] >= g) and (D[b] <= h) then
      o += D[b];
  end;
  writeln('Массив ', D);
  writeln('Количество четных элементов массива, стоящих на нечетных местах:', c);
  writeln('Произведение нечетных элементов массива: ', f);
  writeln('Сумма элементов массива, принадлежащих промежутку [', g, ' , ', h, ']:', o);
end.