program qq;
uses Crt;
const
  MAX_SIZE=100; 
type
  Node=record
    data:integer;
    prev,next:integer; 
  end;
  spisok=record
    nodes:array[1..MAX_SIZE] of Node;
    head,tail:integer; 
    size:integer;
  end;
procedure init(var list:spisok);
begin
  list.head:=0;
  list.tail:=0;
  list.size:=0;
end;
procedure append(var list:spisok;value:integer);
var
  newNodeIndex:integer;
begin
  if list.size=MAX_SIZE then
  begin
    writeln('Ошибка: список переполнен');
    exit;
  end;
  newNodeIndex:=list.size+1;
  list.nodes[newNodeIndex].data:=value;
  list.nodes[newNodeIndex].next:=0; 
  if list.tail=0 then
  begin
    list.nodes[newNodeIndex].prev:=0;
    list.head:=newNodeIndex;
    list.tail:=newNodeIndex;
  end
  else
  begin
    list.nodes[newNodeIndex].prev:=list.tail;
    list.nodes[list.tail].next:=newNodeIndex;
    list.tail:=newNodeIndex;
  end;
  list.size:=list.size+1;
end;
procedure prepend(var list:spisok;value:integer);
var
  newNodeIndex:integer;
begin
  if list.size=MAX_SIZE then
  begin
    writeln('Ошибка: список переполнен');
    exit;
  end;
  newNodeIndex :=list.size+1;
  list.nodes[newNodeIndex].data:=value;
  list.nodes[newNodeIndex].prev:=0; 
  if list.head=0 then
  begin
    list.nodes[newNodeIndex].next:=0;
    list.head:=newNodeIndex;
    list.tail:=newNodeIndex;
  end
  else
  begin
    list.nodes[newNodeIndex].next:=list.head;
    list.nodes[list.head].prev:=newNodeIndex;
    list.head:=newNodeIndex;
  end;
  list.size:=list.size+1;
end;
procedure Delete(var list:spisok;value:integer);
var
  current:integer;
  flag:boolean;
begin
  flag:=false;
  current:=list.head;
  while current<>0 do
  begin
    if list.nodes[current].data=value then
    begin
      if list.nodes[current].prev<>0 then
        list.nodes[list.nodes[current].prev].next:=list.nodes[current].next
      else
        list.head:=list.nodes[current].next;
      if list.nodes[current].next<>0 then
        list.nodes[list.nodes[current].next].prev:=list.nodes[current].prev
      else
        list.tail:=list.nodes[current].prev;
      list.size:=list.size-1;
      flag:=true;
    end;
    current:=list.nodes[current].next;
  end;
  if flag=true then
    writeln('Элемент удалён из списка')
  else
  writeln('Элемент не найден');  
end;
procedure golovahvost(list:spisok);
var
  current:integer;
begin
  current:=list.head;
  while current<>0 do
  begin
    write(list.nodes[current].data,' ');
    current:=list.nodes[current].next;
  end;
  writeln;
end;
procedure hvostgolova(list:spisok);
var
  current:integer;
begin
  current:=list.tail;
  while current<>0 do
  begin
    write(list.nodes[current].data,' ');
    current:=list.nodes[current].prev;
  end;
  writeln;
end;
var
  spisok2:spisok;
  a1,vibor,del:integer;
begin
  init(spisok2);
  repeat
    writeln('Выберите действие');
    writeln('1. Ввод данных');
    writeln('2. Вывод списка в нормальном порядке');
    writeln('3. Вывод списка в обратном порядке');
    writeln('4. Удаление элемента списка');
    writeln('0. Выход из программы');
    readln(vibor);  
    case vibor of
      1: begin
        readln(a1);
        append(spisok2,a1);
        end;
      2: begin
        golovahvost(spisok2);
        writeln('Список выведен');
      end;
      3: begin
        hvostgolova(spisok2);
        writeln('Список выведен');
      end;
      4: begin
        writeln('Введите число, которое нужно удалить');
        readln(del);
        Delete(spisok2,del);
      end;
      end;
  until vibor = 0;  
end.