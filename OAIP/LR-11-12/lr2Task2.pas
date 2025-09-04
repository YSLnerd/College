program qq;
Uses GraphABC;
begin
  setpencolor(clblack);
  line(150,400,450,400);
  line(300,100,225,400);
  line(300,100,375,400);
  line(150,400,50,150);
  line(50,150,250,300);
  line(450,400,550,150);
  line(550,150,350,300);
  circle(300,100,30);
  circle(50,150,30);
  circle(300,100,30);
  circle(550,150,30);
  floodfill(50,150,clblue);
  floodfill(550,150,cllime);
  floodfill(300,100,clred);
  floodfill(300,200,clred);
  floodfill(200,390,clblue);
  floodfill(440,390,cllime);

  end.