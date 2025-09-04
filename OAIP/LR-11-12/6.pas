program qq;
uses GraphABC;
var 
  i, f: integer;
  kor_klet: boolean;
begin
setwindowsize(800, 800);
kor_klet:=True;
for i:=0 to 7 do
begin
for f:=0 to 7 do
begin
if kor_klet then
begin
setpencolor(clbrown);
Rectangle(100*f, 100*i, 100+100*f, 100+100*i);
floodfill(1+100*f, 1+100*i, clbrown);
end;
kor_klet:= not kor_klet;
end;
kor_klet:= not kor_klet;
end;
end.