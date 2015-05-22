{
��� ���������� ������ ����� ����� �� 10 ���������. ��� ������� ��������� 
��������� ����: 1 - ��������� ������ ���������� �������, 2- ������ �������� 
������� � ����������, 3-����� ���������� ��������  ���������  �������, 
4 - �������� �������� �������� ������� � �� ���������� � ����.
}

Program eleven;
 
uses FormsABC;
  
type
 // mass=array[1..10] of integer;//���������� �������

Var
  f:file of integer;//���������� ����������
  n:integer;
  a:mass;
  Vod,Vod1,Vod2:IntegerField;
  t1:TextLabel;
  t2:TextBox;
  bt,bt1:Button;
  li:ListBox;
  txt:TextBox;

Procedure CreateAll;//�������� ��������� �����
  begin
    MainForm.Title := '���������� � ������ �������� ������� � ����';
    MainForm.SetSize(450,420);
    MainForm.CenterOnScreen;
    EmptySpace(50); Vod:=new IntegerField('�������� �������');
    EmptySpace(200);t1:=new TextLabel('1 - ���� ������� c�������� �������');
    EmptySpace(200); t1:= new TextLabel('2 - ���� ������� � ����������');
    EmptySpace(200); t1:= new TextLabel('3 - ����� ���������� ������ �������� � �������'); 
    t1:= new TextLabel('4 - ������ ������ �������� � ����'); 
    EmptySpace(50); bt:=new Button('���������'); 
    EmptySpace(10);bt1:=new Button('��������');
    txt:=new TextBox();
    li:=new ListBox();
    EmptySpace(100);t1:=new TextLabel('���������� �������� ����� �����');
    Vod1:=new IntegerField(' ');
  end;
  
{procedure WriteFile(x:mass;f:file of integer);//������ ������� � ����
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
  
function ReadFile():string;//��������� ������� �� �����
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
  
procedure VvodSL(var x:mass);//���������� ������� ��������� �������
 var i:integer;
  begin
    for i:=1 to 10 do
      begin
        x[i]:=Random(100);
      end;
      WriteFile(x,f);
  end;
  
procedure AddI(var x:mass;var cc:IntegerField);//���������� ��������� � ������ � ��������
  var i:integer;
  begin
     li.Items.Add(cc.Value);
     for i:=1 to li.Items.Count do
      begin
        x[i]:=integer.Parse(li.Items[i-1].ToString); 
        WriteFile(a,f);
        if i>9 then
          begin
            txt.Text:='�� ����� ��������� ������� �������,��������� � ���� 3';
          end;
      end;          
  end;
  
procedure Add;//������� ��������� ��� ������� ������
  begin
    AddI(a,Vod2);
  end;


Procedure VvodKl(x: mass);//���� ��������� �������� � ����������
  begin
    t1:= new TextLabel('������� �������� �������');
    bt:=new Button('Add');
    Vod2:= new IntegerField(' ', 50);
    bt.Click+=Add;
  end;
  
function Nechet(var x:mass):integer;//����� ����������� ������ �����
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
    
  Procedure Vvod(var n:integer);//�������� �������
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
  bt.Click+=AddBt;//������� �� ������ ���������
  bt1.Click+=ClearWind;
End.