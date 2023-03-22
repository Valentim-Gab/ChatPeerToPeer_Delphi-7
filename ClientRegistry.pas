unit ClientRegistry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    procedure Edit1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses
  ChatClient, ChatServer;

{$R *.dfm}

procedure TForm3.Edit1Change(Sender: TObject);
begin
  if Edit1.Text <> '' then
  begin
    SpeedButton1.Enabled := True;
    Panel1.Enabled := True;
  end
  else
  begin
    SpeedButton1.Enabled := False;
    Panel1.Enabled := False;
  end;
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
  Form1.Username := Edit1.Text;
  Form1.Show;
  Form1.Enabled := True;
  Form3.Visible := False;
end;

procedure TForm3.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (not (Shift = [ssShift])) and (Key = VK_RETURN) then
  begin
    SpeedButton1Click(Self);
  end;
end;

end.
