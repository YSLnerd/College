unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

procedure TForm1.Edit3Change(Sender: TObject);
begin

end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Close
end;

procedure TForm1.Button1Click(Sender: TObject);
var x,y:integer;
  f:real;
begin
  x:=Strtoint(Edit1.Text);
  y:=Strtoint(Edit2.Text);
  if x=1 then
  begin
    Edit3.Text:=('Знаменатель не может быть 0');
  end
  else
  begin
    f:=Power(((x+1)/(x-1)),x)+18*x*Power(y,2);
    Edit3.Text:=('Значение функции: '+FloattoStr(f));
  end;
end;







procedure TForm1.Button2Click(Sender: TObject);
begin
 Edit1.Text:='';
 Edit2.Text:='';
 Edit3.Text:='';
end;

end.

