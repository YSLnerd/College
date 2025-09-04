procedure row(n:integer);//параметризация
begin
     if n >=1 then//декомпозиция 
       begin
        write (n, ' ');
        row(n-2)
     end;
     if n=1 then//база
       write(0);
end;
begin
    row(3);
end. 