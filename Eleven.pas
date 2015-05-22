{
Дан одномерный массив целых чисел из 10 элементов. При запуске программы 
выводится меню: 1 - заполнить массив случайными числами, 2- ввести элементы 
массива с клавиатуры, 3-найти количество нечетных  элементов  массива, 
4 - записать нечетные элементы массива и их количество в файл.
}

Program eleven;
 
uses FormsABC;
  
type
 // mass=array[1..10] of integer;//объявление массива

Var
  f:file of integer;//объявление переменных
  n:integer;
  a:mass;
  Vod,Vod1,Vod2:IntegerField;
  t1:TextLabel;
  t2:TextBox;
  bt,bt1:Button;
  li:ListBox;
  txt:TextBox;

Procedure CreateAll;//создание элементов формы
  begin
    MainForm.Title := 'Нахождение и запись элемента массива в файл';
    MainForm.SetSize(450,420);
    MainForm.CenterOnScreen;
    EmptySpace(50); Vod:=new IntegerField('Выберите вариант');
    EmptySpace(200);t1:=new TextLabel('1 - Ввод массива cлучайным образом');
    EmptySpace(200); t1:= new TextLabel('2 - Ввод массива с клавиатуры');
    EmptySpace(200); t1:= new TextLabel('3 - Поиск количества четных значений в массиве'); 
    t1:= new TextLabel('4 - Запись четных значений в файл'); 
    EmptySpace(50); bt:=new Button('Выполнить'); 
    EmptySpace(10);bt1:=new Button('Очистить');
    txt:=new TextBox();
    li:=new ListBox();
    EmptySpace(100);t1:=new TextLabel('Количество нечетных чисел равно');
    Vod1:=new IntegerField(' ');
  end;
  
{procedure WriteFile(x:mass;f:file of integer);//запись массива в файл
 var i:integer;
  begin;
  assign(f,'Mas.dat');
    rewrite(f);
    for i:=1 to 10 do
      begin
        write(f,x[i]);
      end;
     Close(f);
  end;}
  
function ReadFile():string;//получение массива из файла
  var i,n:integer;
  var str:string;
  begin
    Assign(f,'Mas.dat'); 
    Reset(f);   
    for i:=1 to FileSize(f) do 
      begin 
        read(f, n);
        str+=intToStr(n)+' ';
        Seek(f, i); 
      end;
  close(f);
  result:=str;
  end;
  
procedure VvodSL(var x:mass);//заполнение массива случайным образом
 var i:integer;
  begin
    for i:=1 to 10 do
      begin
        x[i]:=Random(100);
      end;
      WriteFile(x,f);
  end;
  
procedure AddI(var x:mass;var cc:IntegerField);//добавление элементов в массив и листбокс
  var i:integer;
  begin
     li.Items.Add(cc.Value);
     for i:=1 to li.Items.Count do
      begin
        x[i]:=integer.Parse(li.Items[i-1].ToString); 
        WriteFile(a,f);
        if i>9 then
          begin
            txt.Text:='Вы ввели последний элемент массива,перейдите к меню 3';
          end;
      end;          
  end;
  
procedure Add;//функция добавленя для нажатия кнопки
  begin
    AddI(a,Vod2);
  end;


Procedure VvodKl(x: mass);//ввод элементов масссива с клавиатуры
  begin
    t1:= new TextLabel('Введите значения массива');
    bt:=new Button('Add');
    Vod2:= new IntegerField(' ', 50);
    bt.Click+=Add;
  end;
  
function Nechet(var x:mass):integer;//поиск колличества четных чисел
  begin
    var i,n:integer;
    i:=1;
    txt.Text:=ReadFile();
    while i<11 do
      begin
        if(x[i] mod 2<>0)then
          begin
            n:=n+1;
          end;
          i:=i+1;
      end;
      Result:=n;
      Vod1.Value:=Result;
  end;
  
  procedure Writing(x:mass; f: file of integer);
    begin
     txt:=new TextBox();
     assign(f,'Mas.dat');
    rewrite(f);
    for var i:=1 to 10 do
      begin
      if(x[i] mod 2<>0)then
          begin
            n:=n+1;
          end;
        write(f,x[i]);
      end;
     Close(f);
    end;
    
  Procedure Vvod(var n:integer);//основная функция
    begin
      case n of
        1:VvodSL(a);
        2:VvodKL(a);
        3:Nechet(a);
        4:Writing(a,f);
      end;
    end;
    
  procedure AddBt;
    begin
      n:=Vod.Value;
      Vvod(n);
    end;
    
  procedure ClearWind;
  begin
   txt.Text:=' ';
   Vod1.Value:=0;
   li.Items.Clear;
  end;
    
Begin
  CreateAll;
  bt.Click+=AddBt;//нажатие на кнопку выполнить
  bt1.Click+=ClearWind;
End.