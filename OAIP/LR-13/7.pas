var
  filetext: file of char; 
  ch: char;
  num: integer;

begin
  assign(filetext, 'D:\\основы программирования и алгортмизации\\лаба 13\\voskl.txt');
  reset(filetext); 
  num := 0;         
  while not eof(filetext) do
  begin
    read(filetext, ch);  
    if (num mod 2 <> 0) then 
    begin
      ch := '!';         
      seek(filetext, num); 
      write(filetext, ch); 
    end;
    num += 1;
  end;
  close(filetext); 
  writeln('Программа выполнена');
end.