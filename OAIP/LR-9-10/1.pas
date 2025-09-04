program qq;

procedure max_sum(var ARR: array of integer; var max: integer; var ind: integer);//по ссылке,формальные параметры
var
  i: integer;//локальные
begin
  max := ARR[0]; 
  ind := 0;      
  for i := 1 to 10 do 
  begin
    if ARR[i] > max then
    begin
      max := ARR[i]; 
      ind := i;      
    end;
  end;
end;

procedure wiwod(var x: integer; var y: integer; var MiN_MOD: integer; var MaX_OTR: integer);//по ссылке,формальные параметры
begin
  writeln('Максимальный элемент: ', x);
  writeln('Индекс максимального элемента: ', y);
  writeln('Элемент с минимальным модулем ', MiN_MOD);
  writeln('Максимальный отрицательный элемент ', MaX_OTR);
end;

procedure inputArray(var ARR: array of integer);//по ссылке,формальные параметры
var
  i: integer;//локальные
begin
  writeln('Введите 10 элементов массива:');
  for i := 1 to 10 do 
  begin
    readln(ARR[i]);
  end;
end;

procedure MINMOD(var ARR: array of integer; var minmod: integer);//по ссылке,формальные параметры
var
  t: integer;//локальные
begin
  minmod := ABS(ARR[1]);
  for t := 1 to 10 do
  begin
    if ARR[t]<0 then
    begin
      ARR[t]*=(-1);
    end;
    if ABS(ARR[t]) < minmod then
    begin
      minmod := ARR[t]
    end;
  end;
end;

procedure MAXOTR(var ARR: array of integer; var maxotr: integer);//по ссылке,формальные параметры
var
  g: integer;//локальная
begin
  maxotr := -2147483648;
  for g := 1 to 10 do
  begin
    if (ARR[g] > maxotr) and (ARR[g] < 0) then
    begin
      maxotr := ARR[g];
    end;
  end;
end;

var//Глобальные
  a, maxVal, maxInd, max_otr, min_mod: integer;
  ARR2: array of integer;

begin
  SetLength(ARR2, 11); // Изменяет длину массива на 10
  inputArray(ARR2);//фактические  
  max_sum(ARR2, maxVal, maxInd);//фактические
  MAXOTR(ARR2, max_otr);//фактические
  MINMOD(ARR2, min_mod);//фактические
  wiwod(maxVal, maxInd, min_mod, max_otr);//фактические
end.