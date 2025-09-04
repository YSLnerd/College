program qq;
Uses GraphABC;
var 
  i,x:integer;
  begin
    x:=50;
    while x<=290 do
      begin
      SetPenColor(rgb(random(256), random(256), random(256))); 
      circle(x,100,10);
      x+=30;
      end;
  end.