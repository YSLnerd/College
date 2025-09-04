type anketa= record
  fio:string;
  birth:string;
  kurs:1..5;
end;
var student:anketa;
begin
  student.fio:='John Doe';
  student.birth:='25.11.2009';
  student.kurs:=1;
  writeln(student.fio,'/',student.birth,'/',student.kurs);
end.