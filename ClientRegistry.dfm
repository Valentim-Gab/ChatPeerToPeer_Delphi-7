object Form3: TForm3
  Left = 1851
  Top = 96
  BorderStyle = bsDialog
  Caption = 'ClientRegistry'
  ClientHeight = 139
  ClientWidth = 218
  Color = 16730276
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 16
    Width = 217
    Height = 23
    Alignment = taCenter
    AutoSize = False
    Caption = 'TYPE YOUR NAME'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 16
    Top = 48
    Width = 185
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = Edit1KeyDown
  end
  object Panel1: TPanel
    Left = 56
    Top = 96
    Width = 113
    Height = 33
    Cursor = crHandPoint
    Align = alCustom
    Caption = 'CONFIRM'
    Color = 4734773
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 0
      Top = 0
      Width = 113
      Height = 33
      Cursor = crHandPoint
      Enabled = False
      Flat = True
      OnClick = SpeedButton1Click
    end
  end
end
