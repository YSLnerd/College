program qq;
var
  filetext: file of char;
  x,i:integer;
  s:string;
  k:char;
begin
  assign(filetext,'D:\основы программирования и алгортмизации\лаба 13\text.txt');
  reset(filetext);
  while not eof(filetext) do
  begin
    read(filetext,k);
    s+=k;
  end;
  for i:=1 to (length(s)) do
  begin
    if s[i]=' ' then
      x:=i;     
  end;
  delete(s,x,(length(s)-x+1));
  rewrite(filetext);
  reset(filetext);
  for i:=1 to (length(s)) do 
    begin
    k:=s[i];
    write(filetext,k);
    end;
  close(filetext);
end.