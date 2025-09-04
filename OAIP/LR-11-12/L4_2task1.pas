program qq;
Uses GraphABC;
begin
  setpenwidth(3);
  line(100,200,500,200);
  line(300,100,500,200);
  line(300,100,100,200);
  floodfill(300,150,clblue);
  line(100,200,300,300);
  line(300,300,500,200);
  floodfill(300,250,cllime);
  circle(50,200,50);
  Circle(550,200,50);
  floodfill(50,200,clred);
  floodfill(550,200,clyellow);
end.