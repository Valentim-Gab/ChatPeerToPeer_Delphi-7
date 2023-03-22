object Form1: TForm1
  Left = 367
  Top = 143
  BorderStyle = bsDialog
  Caption = 'Chat'
  ClientHeight = 416
  ClientWidth = 331
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
    Left = 16
    Top = 12
    Width = 91
    Height = 41
    Alignment = taCenter
    Caption = 'CHAT'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -35
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 216
    Top = 16
    Width = 100
    Height = 16
    Caption = 'Logged in User:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblUsername: TLabel
    Left = 152
    Top = 32
    Width = 161
    Height = 16
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Disconnected'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Memo2: TMemo
    Left = 16
    Top = 360
    Width = 217
    Height = 41
    Cursor = crIBeam
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyDown = Memo2KeyDown
  end
  object Panel1: TPanel
    Left = 240
    Top = 360
    Width = 73
    Height = 41
    Caption = 'SEND'
    Color = 43520
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 0
      Top = 0
      Width = 185
      Height = 41
      Cursor = crHandPoint
      Enabled = False
      Flat = True
      OnClick = SpeedButton1Click
    end
  end
  object Panel2: TPanel
    Left = 288
    Top = 56
    Width = 25
    Height = 25
    TabOrder = 2
    object SpeedButton2: TSpeedButton
      Left = -5
      Top = -3
      Width = 33
      Height = 33
      Cursor = crHandPoint
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000F5F5F5F5F5F5
        F5F5F5FAF9F8FFFFFF9598AC535B79333D61343D625159778C90A5F5F2F5FFFF
        FEF5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F7F7F7F6F2F600032E1A66586BCDA788
        F5C28BF8C570D2AC34817300112AB4B1C4FDFCFBF5F5F5F5F5F5F5F5F5F5F5F5
        FFFBFD9AB9AF19AC4E6EE5A546CA7B7BE9B359D69172E5A966E19C3ECB7367BE
        8AFFFBFFF5F5F5F5F5F5F5F5F5F5F5F5FFF9FE8ED2A60A9E3E74E1AC3BC7727A
        EAB36BDD9C61E09A56D38E2DB36154BB79FFFBFFF5F5F5F5F5F5F5F5F5F5F5F5
        FFFAFF7CCB9915A4486BE3A8C1E4C9FFE8FFF2D5FFDFD6F777E0A836BB6D3BB1
        65FFFCFFF5F5F5F5F5F5F4F4F4F5F5F5FFFAFF70C89117AA4DD4F8E48C7BFF6A
        68FB1D22FB4543FEFFFFFF3BC37525A954FFFDFFF4F5F5F5F5F5F5F5F5F5F5F5
        FFFBFF50BD7923B65AFFF9FF191DFCFFFFFFFFF7FE5E5DFBDBC3FF7AD39F0CA2
        42FFFEFFF5F5F5F5F5F5F5F5F5F5F5F5FFFBFF49BC743CC96A7F7AFF2729FCFF
        FFFFF9EBFD3337FBFFE9FF82D9AB05A13EFFFAFFF6F5F5F5F5F5F5F5F5F5F5F5
        FFFBFF49BE7442C77CD7FDE7F2D7FF040CFC2226FC403EFFEBD8FF67E2A00DA4
        44F0F4F2F7F5F7F5F5F5F5F5F5F5F5F5FFF9FF3DBA6C59D1915ADC96B9E2CDFF
        EFFFFFE6FFFFF9F86BDC9B7AE7B410A646DFEFE6F9F6F8F5F5F5F5F5F5F7F5F6
        EEF2F03DBA6B66D89D5FD8955EDC996AE4A45CD89277ECB54BCE8087EEC113A8
        49CFEBDCFBF6F9F5F5F5F5F5F5F9F6F8DEEEE52CB85E79EEB173ECAB7DF2B683
        F6BD7AF2B390FFC969E99F97FFD116B34BC1E9D4FCF6FAF5F5F5F5F5F5FAF6F8
        D0F5DD42A0823D6677537085576C854B637A364F6A253C5E213A5F2951673D8B
        7CB9F1D0FEF7FAF5F5F5F5F5F5FEFBFBACBAC00038332F9A57199F460BA53A16
        AD4317AF450FAA3D10993C0B7839003E2A4E5E77FFFFFFF5F5F5F5F5F5FBF7FA
        C9E5D100A82F11B24416B54981E3A810AF420DAA3F73DA9B119F400491310297
        3070BD89FFFBFFF5F5F5F5F5F5F5F5F5FEF8FCFEF9FCB7E4C68AD8A48BDAA7A6
        E4BFA2DEBB84CB9D72BC8A9ECFAEE4EDE7FFFDFFF5F5F4F5F5F5}
      OnClick = SpeedButton2Click
    end
  end
  object ComboBox1: TComboBox
    Left = 16
    Top = 56
    Width = 105
    Height = 21
    Cursor = crHandPoint
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ItemHeight = 13
    ParentFont = False
    TabOrder = 3
    Text = 'Chats'
  end
  object Chat: TSynEdit
    Left = 16
    Top = 80
    Width = 297
    Height = 273
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Fira Code'
    Font.Pitch = fpFixed
    Font.Style = []
    TabOrder = 4
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    ReadOnly = True
    ScrollBars = ssVertical
    WordWrap = True
    OnPaintTransient = ChatPaintTransient
  end
  object IdUDPClient1: TIdUDPClient
    Active = True
    BroadcastEnabled = True
    Host = '255.255.255.255'
    Port = 8002
    Left = 120
    Top = 16
  end
end
