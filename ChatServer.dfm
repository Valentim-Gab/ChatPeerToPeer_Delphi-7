object Form2: TForm2
  Left = 704
  Top = 144
  BorderStyle = bsDialog
  Caption = 'ChatServer'
  ClientHeight = 415
  ClientWidth = 280
  Color = 4734773
  Enabled = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 76
    Height = 16
    Alignment = taCenter
    Caption = 'Active users'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 120
    Top = 56
    Width = 118
    Height = 19
    Alignment = taCenter
    Caption = 'Received pings'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 264
    Width = 108
    Height = 16
    Alignment = taCenter
    Caption = 'Server messages'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 56
    Top = 4
    Width = 153
    Height = 41
    Alignment = taCenter
    AutoSize = False
    Caption = 'SERVER'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -37
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 72
    Width = 105
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'Select'
    Color = 43520
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 120
    Top = 80
    Width = 153
    Height = 169
    Cursor = crNo
    Color = -1
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object ListBox1: TListBox
    Left = 8
    Top = 88
    Width = 105
    Height = 160
    Cursor = crHandPoint
    Color = 43520
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    OnClick = ListBox1Click
  end
  object Memo2: TMemo
    Left = 8
    Top = 288
    Width = 265
    Height = 73
    Cursor = crNo
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 88
    Top = 368
    Width = 97
    Height = 33
    Caption = 'LOGIN'
    Color = 16729763
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object SpeedButton1: TSpeedButton
      Left = 0
      Top = -32
      Width = 97
      Height = 65
      Cursor = crHandPoint
      Flat = True
      OnClick = SpeedButton1Click
    end
  end
  object IdUDPServer1: TIdUDPServer
    BroadcastEnabled = True
    Bindings = <>
    DefaultPort = 8002
    OnUDPRead = IdUDPServer1UDPRead
    ThreadedEvent = True
    Left = 248
  end
  object ServerSocket1: TServerSocket
    Active = False
    Port = 8003
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket1ClientConnect
    OnClientDisconnect = ServerSocket1ClientDisconnect
    OnClientRead = ServerSocket1ClientRead
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 8003
    OnConnect = ClientSocket1Connect
    OnDisconnect = ClientSocket1Disconnect
    OnRead = ClientSocket1Read
    OnError = ClientSocket1Error
    Left = 24
  end
end
