program qq;
type toy=record
  name:string;
  price:string;
  age:1..11;
end;
var
  arr: array[1..3] of toy;
  i:integer;
  begin
      with arr[1] do
        begin
        arr[1].name:='мяч';
      arr[1].price:='300';
      arr[1].age:=7;
      end;
      with arr[2] do
        begin
        arr[2].name:='мeч';
      arr[2].price:='400';
      arr[2].age:=8;
      end;
      writeln('Имя: ',arr[1].name,' Цена: ',arr[1].price,' Рекомендемый возраст: ',arr[1].age);
     writeln('Имя: ',arr[2].name,' Цена: ',arr[2].price,' Рекомендемый возраст: ',arr[2].age); 
  end.