unit ChatServer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdUDPBase, IdUDPServer, StdCtrls, IDSocketHandle,
  ScktComp, Buttons, ExtCtrls, UtilCpdSrv, uLkJSON;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    IdUDPServer1: TIdUDPServer;
    ListBox1: TListBox;
    Memo2: TMemo;
    ServerSocket1: TServerSocket;
    ClientSocket1: TClientSocket;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    procedure IdUDPServer1UDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
    procedure ListBox1Click(Sender: TObject);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    procedure ScrollToLastLine(Memo: TMemo);
  public
    { Public declarations }
  end;

  TConnectionThread = class(TThread)
  protected
    procedure Execute; override;
  public
    constructor Create;
    destructor Destroy; override;
  end;

var
  Form2: TForm2;
  ListUsers: OleVariant;

implementation

uses ChatClient;

{$R *.dfm}

constructor TConnectionThread.Create;
begin
  inherited Create(True);
end;

destructor TConnectionThread.Destroy;
begin
  inherited;
end;

procedure TConnectionThread.Execute;
begin
  inherited;
end;

procedure TForm2.IdUDPServer1UDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
var
  Rec, StrAux, UserName, IP: string;
  I: Integer;
  AddToList: Boolean;
  Json: TlkJSONbase;
begin
  SetLength(Rec, AData.Size);
  AData.Read(Rec[1], AData.Size);

  StrAux := Rec;
  Json := TlkJSON.ParseText(StrAux);
  UserName := Json.Field['name'].Value;
  IP := Json.Field['ip'].Value;

  Memo1.Text := '                PING' + #13#10 + 'Name: ' +
    Username + #13#10 + 'Address: ' + IP + #13#10 +
    '------------------------------' + #13#10 + Memo1.Text;
  AddToList := True;
  if ListBox1.Count > 0 then
    for I := 0 to ListBox1.Count - 1 do
      if ListUsers[I] = Json.Field['ip'].Value then
      begin
        AddToList := False;
        Break;
      end;
  if (not (ListBox1.Count > 0)) or (AddToList) then
  begin
    VarArrayRedim(ListUsers, VarArrayHighBound(ListUsers, 1) + 1);
    ListUsers[VarArrayCount(ListUsers, 1) - 1] := Json.Field['ip'].Value;
    ListBox1.AddItem(Json.Field['name'].Value, Self);
  end;
end;

procedure TForm2.ListBox1Click(Sender: TObject);
var
  I: Integer;
  AddToList: Boolean;
begin
  Memo2.Text := Memo2.Text + 'User selected: ' + ListBox1.Items[ListBox1.ItemIndex] + #13#10;

  AddToList := True;
  if Form1.ComboBox1.Items.Count > 0 then
    for I := 0 to Form1.ComboBox1.Items.Count - 1 do
      if Form1.ComboBox1.Items[I] = ListBox1.Items[ListBox1.ItemIndex] then
      begin
        AddToList := False;
        Form1.ComboBox1.ItemIndex := I;
        Break;
      end;
  if (not (Form1.ComboBox1.Items.Count > 0)) or (AddToList) then
  begin
    Form1.ComboBox1.AddItem(ListBox1.Items[ListBox1.ItemIndex], Self);
    Form1.ComboBox1.ItemIndex := Form1.ComboBox1.Items.Count - 1;
  end;

  if not ServerSocket1.Active then
  begin
    ServerSocket1.Active := True;
    Memo2.Text := Memo2.Text + 'Server Started' + #13#10;
    ClientSocket1.Address := ListUsers[ListBox1.ItemIndex];
    ClientSocket1.Active := True;
  end
  else
  begin
    ServerSocket1.Active := False;
    Memo2.Text := Memo2.Text + 'Server Stopped' + #13#10;
  end;
  //
  if ClientSocket1.Socket.Connected then
    ClientSocket1.Active := False;

  ScrollToLastLine(Memo2);
end;

procedure TForm2.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  if ServerSocket1.Socket.ActiveConnections > 0 then
  begin
    Form1.SpeedButton1.Enabled := True;
    Form1.Memo2.Enabled := True;
    Socket.SendText('Connected')
  end
  else
  begin
    Form1.SpeedButton1.Enabled := False;
    Form1.Memo2.Enabled := False;
    Socket.SendText('Error connecting');
  end;
end;

procedure TForm2.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  if ServerSocket1.Socket.ActiveConnections-1 = 0 then
  begin
    Form1.SpeedButton1.Enabled := False;
    Form1.Memo2.Enabled := False;
  end;
end;

procedure TForm2.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  UserName, Msg, StrAux: string;
  Json: TlkJSONbase;
begin
  StrAux := '{' + Socket.ReceiveText + '}';
  Json := TlkJSON.ParseText(StrAux);
  UserName := Json.Field['name'].Value;
  Json := TlkJSON.ParseText(StrAux);
  Msg := Json.Field['msg'].Value;

  ChatClient.Form1.Chat.Lines[Form1.Chat.Lines.Count] :=
    UserName + ': ' + Msg + #13#10;
    Form1.ScrollToLastLine;
end;

procedure TForm2.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ChatClient.Form1.Chat.Lines[Form1.Chat.Lines.Count] := 'Disconnected' + #13#10;
  Socket.SendText(Memo2.Text);
end;

procedure TForm2.ClientSocket1Error(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  ErrorCode := 0;
  ClientSocket1.Active := False;
  Memo2.Text := Memo2.Text + 'No connection found' + #13#10;
  ScrollToLastLine(Memo2);
end;

procedure TForm2.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ChatClient.Form1.Chat.Lines[Form1.Chat.Lines.Count] := 'Connected' + #13#10;
  Form1.SpeedButton1.Enabled := True;
  Form1.Memo2.Enabled := True;
end;

procedure TForm2.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
begin
   Memo2.Text := Memo2.Text + 'Server: ' + Socket.ReceiveText + #13#10;
   ScrollToLastLine(Memo2);
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  if not IdUDPServer1.Active then
  begin
    IdUDPServer1.Active := True;
    Panel1.Caption := 'EXIT';
    Form1.Login(True);
    Memo2.Text := 'Logged' + #13#10;
  end
  else
  begin
    IdUDPServer1.Active := False;
    Panel1.Caption := 'LOGIN';
    Form1.Login(False);
    ListBox1.Items.Clear;
    Memo1.Clear;
    Memo2.Text := 'Logged out of the chat' + #13#10;
    ServerSocket1.Active := False;
    ClientSocket1.Active := False;
    Form1.SpeedButton1.Enabled := False;
    Form1.Memo2.Enabled := False;
  end;
  ScrollToLastLine(Memo2);
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  ListUsers := VarArrayCreate([0, -1], varVariant);
end;

procedure TForm2.ScrollToLastLine(Memo: TMemo);
begin
  SendMessage(Memo.Handle, EM_LINESCROLL, 0, Memo.Lines.Count);
end;

end.
