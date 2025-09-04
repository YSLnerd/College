program qq;
type
  toy=record
    name: string[50]; 
    price: string[10];
    age: 1..11;
  end;
var
  f:file of toy; 
  arr:array[1..3] of toy;
  i:integer;
begin
  assign(f,'D:\МДК 05.02\лр 15\input.dat');
  rewrite(f);
  arr[1].name := 'мяч';
  arr[1].price := '300';
  arr[1].age := 7;
  write(f, arr[1]);
  arr[2].name := 'мeч';
  arr[2].price := '400';
  arr[2].age := 8;
  write(f, arr[2]);
  close(f);
  reset(f);
  writeln('------------------------');
  i := 1;
  while not eof(f) and (i<= 3) do
  begin
    read(f,arr[i]);
    writeln('Название: ',arr[i].name);
    writeln('Цена: ',arr[i].price);
    writeln('Рекомендуемый возраст: ',arr[i].age);
    writeln('------------------------');
    i+=1;
  end;
  close(f);
end.