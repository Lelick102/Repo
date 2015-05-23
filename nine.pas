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
  Writeln('Введите количество регистрируемых пользователей:');
  readln(n);
  for var i := 1 to n do 
    with us[i] do
    begin
      writeln('Ведите данные  ', i, '   пользователя');
      write('Логин: ');
      readln(login);
      write('Пароль: ');
      readln(password);
      write('Фамилия: ');
      readln(name);
      write('Дата регистрации: ');
      readln(rdate);
      write('Дата последнего входа: ');
      readln(ldate);
    end;
    
  Writeln('Поиск пользователя.');
  write('Введите фамилию пользователя: ');
  readln(uname);
  write('Введите дату регистрации: ');
  readln(udate);
  
  for var i := 1 to n do
    if (uname = us[i].name) and (udate = us[i].rdate) then
    begin
      writeln('Данные ', i, ' пользователя.');
      with us[i] do 
      begin
        write('Логин: ');
        writeln(login);
        write('Пароль: ');
        writeln(password);
        write('Фамилия: ');
        writeln(name);
        write('Дата регистрации: ');
        writeln(rdate);
        write('Дата последнего входа: ');
        writeln(ldate);
      end;
     
      found := true;
      break;
    end;
    
  if found = false then writeln('Пользователь не найден.');
  
end.