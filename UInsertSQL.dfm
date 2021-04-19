object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 393
  ClientWidth = 657
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LblContador: TLabel
    Left = 369
    Top = 296
    Width = 100
    Height = 23
    Caption = 'LblContador'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 192
    Top = 296
    Width = 156
    Height = 23
    Caption = 'Registros Creados:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 641
    Height = 273
    TabOrder = 0
  end
  object BtnGuardar: TButton
    Left = 480
    Top = 336
    Width = 75
    Height = 25
    Caption = 'BtnGuardar'
    TabOrder = 1
    OnClick = BtnGuardarClick
  end
  object BtnBuscar: TButton
    Left = 296
    Top = 336
    Width = 75
    Height = 25
    Caption = 'BtnBuscar'
    TabOrder = 2
    OnClick = BtnBuscarClick
  end
  object BtnCrear: TButton
    Left = 120
    Top = 336
    Width = 75
    Height = 25
    Caption = 'BtnCrear'
    TabOrder = 3
    OnClick = BtnCrearClick
  end
  object OpenDialog1: TOpenDialog
    Left = 592
    Top = 296
  end
  object ADOConnection: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 288
  end
  object QInsert: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 128
    Top = 288
  end
end
