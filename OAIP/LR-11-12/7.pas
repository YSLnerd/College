program qq;
uses GraphABC;
var x,y,y2,x2,x3,y3,x4,y4:integer;
begin
  x:=40;
  y:=430;
  x2:=50;
  y2:=440;  
	repeat
  begin 
		SetPenColor(clblack);
		rectangle(x,y,x2,y2);
		floodfill(x+1,y+1,clSilver);
clearwindow;
		x+=1;
		y-=2;
		x2+=1;
		y2-=2;
		end;
	until y=0;
	x3:=250;
	x4:=260;
	y3:=10;
	y4:=20;
	Clearwindow;
repeat 
 begin 
		SetPenColor(clblack);
		rectangle(x3,y3,x4,y4);
		floodfill(x3+1,y3+1,clSilver);
  		clearwindow;
		x3+=1;
		y3+=2;
		x4+=1;
		y4+=2;
		end;
	until y4=440;	
end.