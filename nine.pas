Program Nine;
 
type
  
  user = record 
    login: string;
    password: string;
    name: string;
    rdate: string;
    ldate: string;
  end;
 
var
  us: array[1..100] of user; 
  uname, udate: string;
  found: boolean;
  n:integer;
 
begin
  found := false;
  Writeln('������� ���������� �������������� �������������:');
  readln(n);
  for var i := 1 to n do 
    with us[i] do
    begin
      writeln('������ ������  ', i, '   ������������');
      write('�����: ');
      readln(login);
      write('������: ');
      readln(password);
      write('�������: ');
      readln(name);
      write('���� �����������: ');
      readln(rdate);
      write('���� ���������� �����: ');
      readln(ldate);
    end;
    
  Writeln('����� ������������.');
  write('������� ������� ������������: ');
  readln(uname);
  write('������� ���� �����������: ');
  readln(udate);
  
  for var i := 1 to n do
    if (uname = us[i].name) and (udate = us[i].rdate) then
    begin
      writeln('������ ', i, ' ������������.');
      with us[i] do 
      begin
        write('�����: ');
        writeln(login);
        write('������: ');
        writeln(password);
        write('�������: ');
        writeln(name);
        write('���� �����������: ');
        writeln(rdate);
        write('���� ���������� �����: ');
        writeln(ldate);
      end;
     
      found := true;
      break;
    end;
    
  if found = false then writeln('������������ �� ������.');
  
end.