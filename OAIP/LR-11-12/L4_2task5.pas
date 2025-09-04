program qq;
Uses GraphABC;
var x, y ,r, i:integer;
begin
  x:=30;
  y:=30;
  r:=10;
  for i:=1 to 8 do
  begin
    circle(x,y,r);
    floodfill(x,y,rgb(random(256), random(256), random(256)));
    x+=70;
    y+=45;
    r+=12;
  end;
end.