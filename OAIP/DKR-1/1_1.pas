program qq;

var
  x, a, e: real;

begin
  writeln('Введите значение x');
  readln(x);
  e := exp(1);
  if x = 0 then
    a:=00
  else
  if (x < 1) then
    if x <= -8 then
      a := (x / x) - (cos(x) / (-(-x) ** (x / 10)))
    else
      a := ((ln(Abs(x)) / ln(10)) * (e ** x) + (x ** 3) / cos(2 * x))
    else
  if (x >= 5) then
    a := cos(x) * cos(x) + x ** 3 / x ** (0.1 * x)
  else 
    a := sin(x) / 73 + 60;
  writeln('X=', x, ' Y=', a:0:4);
end.