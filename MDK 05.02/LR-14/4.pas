procedure LoopFor(i, n: integer);//параметризация
begin
  if i <= n then//декомпозиция
  begin
    writeln('привет ', i);
    LoopFor(i + 1, n);
  end;//база i>n
end;
begin
  LoopFor(1, 10);
end.