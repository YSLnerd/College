program qq;
const
  MaxStrLength = 255; 
type
  TFixedString = array[1..MaxStrLength] of char; 
var
  textfile1, textfile2: file of TFixedString;
  s: string;
  tempStr: TFixedString;
  lines: array of string;
  i, n, maxlength: integer;
function ToFixedString(s: string): TFixedString;
var
  i: integer;
  resultArray: TFixedString;
begin
  for i := 1 to MaxStrLength do
    if i <= length(s) then
      resultArray[i] := s[i]
    else
      resultArray[i] := ' ';
  ToFixedString := resultArray;
end;
function ToString(fixedStr: TFixedString): string;
var
  i: integer;
  str: string;
begin
  str := '';
  for i := 1 to MaxStrLength do
    if fixedStr[i] <> ' ' then
      str := str + fixedStr[i];
  ToString := str;
end;
begin
  assign(textfile1, 'D:\\основы программирования и алгортмизации\лаба 13\text3.txt');  
  rewrite(textfile1);
  write('Введите количество строк: ');
  readln(n);  
  for i := 1 to n do
  begin
    write('Введите строку ', i, ': ');
    readln(s); 
    tempStr := ToFixedString(s);
    write(textfile1, tempStr);  
  end;
  close(textfile1);
  reset(textfile1);
  maxlength := 0;
  while not eof(textfile1) do
  begin
    read(textfile1, tempStr);
    s := ToString(tempStr);
    if length(s) > maxlength then
      maxlength := length(s);  
  end;
  close(textfile1); 
  reset(textfile1);
  setlength(lines, 0); 
  while not eof(textfile1) do
  begin
    read(textfile1, tempStr);
    s := ToString(tempStr);
    if length(s) = maxlength then
    begin
      setlength(lines, length(lines) + 1);
      lines[high(lines)] := s; 
    end;
  end;
  close(textfile1);
  assign(textfile2, 'D:\\основы программирования и алгортмизации\\лаба 13\\text4.txt');  
  rewrite(textfile2);
  for i := high(lines) downto 0 do
  begin
    tempStr := ToFixedString(lines[i]);
    write(textfile2, tempStr);
  end;
  close(textfile2);
  writeln('Программа выполнена');    
end.