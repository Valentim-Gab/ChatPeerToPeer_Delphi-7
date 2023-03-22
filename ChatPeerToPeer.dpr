program ChatPeerToPeer;

uses
  Forms,
  ChatClient in 'ChatClient.pas' {Form1},
  ChatServer in 'ChatServer.pas' {Form2},
  ClientRegistry in 'ClientRegistry.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ChatPeerToPeer';
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);

  Application.Run;
end.
