unit ChatClient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient, WinSock, ChatServer,
  Buttons, ExtCtrls, uLkJSON, Menus, ComCtrls, RichEdit, SynEdit, SynEditTypes, StrUtils;

type
  TForm1 = class(TForm)
    Memo2: TMemo;
    IdUDPClient1: TIdUDPClient;
    Label1: TLabel;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    Label2: TLabel;
    lblUsername: TLabel;
    ComboBox1: TComboBox;
    Chat: TSynEdit;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Memo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ChatPaintTransient(Sender: TObject; Canvas: TCanvas;
      TransientType: TTransientType);
  private
    function GetIP: string;
  public
    UserName: string;
    procedure Login(Action: Boolean);
    procedure ScrollToLastLine;
  end;

  TClientThread = class(TThread)
  protected
    procedure Execute; override;
  public
    constructor Create;
    destructor Destroy; override;
  end;

var
  Form1: TForm1;
  ChatServer: TForm2;

implementation

{$R *.dfm}

constructor TClientThread.Create;
begin
  inherited Create(True);
end;

destructor TClientThread.Destroy;
begin
  inherited;
end;

procedure TClientThread.Execute;
var
  IP: string;
begin
  inherited;
  while true do
  begin
    IP := Form1.GetIP;
    Form1.IdUDPClient1.Send('{"name": "' + Form1.UserName + '", "ip": "' + IP + '"}');
    Sleep(3000);
  end;
  Terminate;
  WaitFor;
  Free;
end;

function TForm1.GetIP: string;
var
  WSAData: TWSAData;
  HostEnt: PHostEnt;
  Name: string;
begin
  WSAStartup(2, WSAData);
  SetLength(Name, 255);
  gethostname(PChar(Name), 255);
  HostEnt := gethostbyname(PChar(Name));
  with HostEnt^ do
  begin
    Result := Format('%d.%d.%d.%d',
      [Byte(h_addr^[0]), Byte(h_addr^[1]),
      Byte(h_addr^[2]), Byte(h_addr^[3])]);
  end;
  WSACleanup;
end;

procedure TForm1.Login(Action: Boolean);
var
  Thread: TClientThread;
begin
  if Action then
  begin
    Thread := TClientThread.Create;
    Thread.FreeOnTerminate := True;
    Thread.Resume;
  end
  else
    Thread.Terminate;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ChatServer := TForm2.Create(Application);
  ChatServer.Show;
  ChatServer.Enabled := True;
  lblUsername.Caption := UserName;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  Msg: string;
begin
  if Memo2.Text <> '' then
  begin
    Memo2.Text := StringReplace(Memo2.Text, '\', '/', [rfReplaceAll, rfIgnoreCase]);
    Msg := UserName + ': ' + Memo2.Text;
    Chat.Lines[Chat.Lines.Count] := Msg;
    ChatServer.ClientSocket1.Socket.SendText('"name": "' + UserName + '", "msg": "' + Memo2.Text + '"');
    Memo2.Text := '';
    ScrollToLastLine;
  end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  Chat.Text := '';
end;

procedure TForm1.ScrollToLastLine;
begin
  SendMessage(Chat.handle, WM_VSCROLL, SB_BOTTOM, 0);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TForm1.Memo2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (not (Shift = [ssShift])) and (Key = VK_RETURN) then
  begin
    Memo2.WordWrap := True;
    SpeedButton1Click(Self);
    Memo2.WordWrap := False;
  end;
end;

procedure TForm1.ChatPaintTransient(Sender: TObject; Canvas: TCanvas;
  TransientType: TTransientType);
var
  Key, Key2, S: string;
  I, K, K2: Integer;
  DP : TDisplayCoord;
  P: TPoint;

  procedure Paint(PosName: Integer; Color: TColor);
  begin
    if PosName > 0 then
    begin
      DP := Chat.BufferToDisplayPos(BufferCoord(PosName, I));
      P := Chat.RowColumnToPixels(DP);
      Canvas.Brush.Color := Color;
      Canvas.Font.Color := clBlack;
      Canvas.TextOut(P.X, P.Y, Chat.Lines[I - 1]);
    end;
  end;
begin
  if Chat.Text <> '' then
  begin
    Key := UserName;
    Key2 := ComboBox1.Items[ComboBox1.ItemIndex];
    for I := Chat.TopLine to Chat.TopLine + Chat.LinesInWindow do
    begin
      S := Chat.Lines[I - 1];
      K := Pos(Key, S);
      K2 := Pos(Key2, S);
      if (K > 0) and (K2 > 0) and (K > K2) then
        K := -1;
      if (K > 0) and (K2 > 0) and (K2 > K) then
        K2 := -1;
      Paint(K, clMoneyGreen);
      Paint(K2, cl3DLight);
    end;
  end;
end;

end.
