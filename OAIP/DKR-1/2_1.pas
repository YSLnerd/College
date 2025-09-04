program qq;

var
  a, x, e: real;

begin
  x := -10;
  e := exp(1);
  while x <= 7 do
  begin
    if x = 0 then
      a := 00
    else
    if (x < 1) then
      if x < -8 then
        a := (x / x) - (cos(x) / (-(-x) ** (x / 10)))
      else
        a := ((ln(Abs(x)) / ln(10)) * (e ** x) + (x ** 3) / cos(2 * x))
    else
    if (x >= 5) then
      a := cos(x) * cos(x) + x ** 3 / x ** (0.1 * x)
    else 
      a := sin(x) / 73 + 60;
    writeln('Y= ', a:0:4, ' X= ', x:0:2);
    x += 0.1;
  end;
end.