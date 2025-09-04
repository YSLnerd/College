procedure fib(i, n: integer);//параметризация
begin
    writeln(i + n, ' '); 
    if n < 55 then// база n=55 
        fib(n, i + n);//декомпозиция
end;
begin
    fib(0, 1);
end.