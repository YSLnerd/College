unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var a,b,h,y,c:integer;
begin
 a:=strtoint(Edit1.Text);
 b:=strtoint(Edit2.Text);
 h:=strtoint(Edit3.Text);
 if h<=0 then
 begin
 Memo1.Lines.add('Шаг положительное число');
 exit;
 end;
 if a>b then
 begin
 Memo1.Lines.add('Конец отрезка должен быть больше начала');
 exit;
 end;
 while a<=b do
 begin
 c:=a*a;
 Memo1.Lines.add('X: '+inttostr(a)+' Y: '+inttostr(c));
 a:=a+h;
 end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.

