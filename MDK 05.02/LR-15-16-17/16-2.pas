program qq;
type
  PNode=^TNode;  
  TNode=record
    word:string;    
    count:Integer;  
    next:PNode;     
  end;
function TakeWord(var F:text):string;
var
  c:char;
begin
  result:='';  
  c:=' ';      
  while not eof(F) and (c<=' ') do
    read(F,c);
  while not eof(F) and (c>' ') do
  begin
    result:=result+c;
    read(F,c);
  end;
end;
function CreateNode(NewWord:string): PNode;
var
  NewNode:PNode;
begin
  New(NewNode);
  NewNode^.word:=NewWord;
  NewNode^.count:=1;
  NewNode^.next:=nil;
  result:=NewNode;
end;
function FindPlace(Head:PNode;NewWord:string):PNode;
var
  pp:PNode;
begin
  pp:=Head;
  while (pp<>nil) and (NewWord>pp^.word) do
    pp:=pp^.next;
  result:=pp;
end;
procedure AddBefore(var Head:PNode;p,NewNode:PNode);
var
  pp:PNode;
begin
  pp:=Head;
  if p=Head then
    begin
      NewNode^.next:=Head;
      Head:=NewNode;
    end
  else
  begin
    while (pp<>nil) and (pp^.next<>p) do
      pp:=pp^.next;
    if pp<>nil then
      begin
        NewNode^.next:=pp^.next;
        pp^.next:=NewNode;
      end;
  end;
end;
var
  F:text;
  Head:PNode;
  Word,NewWord:string;
  Place:PNode;
  Count:integer;
  node:PNode;  
begin
  assign(F,'D:\МДК 05.02\лр 16\input.txt');  
  reset(F);
  Head:=nil;  
  Count:=0;   
  while not eof(F) do
  begin
    Word := TakeWord(F);  
    if Word<>'' then
    begin
      Place:=FindPlace(Head, Word);
      if (Place<>nil) and (Place^.word=Word) then
        Place^.count+=1
      else
      begin
        node:=CreateNode(Word); 
        AddBefore(Head, Place, node); 
        Count+=1; 
      end;
    end;
  end;
  close(F);  
  writeln('Количество различных слов: ',Count);
  node:=Head; 
  while node <> nil do
  begin
    writeln(node^.word,': ',node^.count); 
    node:=node^.next; 
  end;
end.