object FormDivisiones01: TFormDivisiones01
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Divisiones de Costa Rica'
  ClientHeight = 203
  ClientWidth = 486
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  ShowHint = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 47
    Height = 13
    Caption = 'Provincia:'
  end
  object Label2: TLabel
    Left = 16
    Top = 43
    Width = 39
    Height = 13
    Caption = 'Cant'#243'n:'
    Color = clNone
    ParentColor = False
  end
  object Label3: TLabel
    Left = 16
    Top = 75
    Width = 38
    Height = 13
    Caption = 'Distrito:'
    Color = clNone
    ParentColor = False
  end
  object Label4: TLabel
    Left = 16
    Top = 107
    Width = 32
    Height = 13
    Caption = 'Barrio:'
    Color = clNone
    ParentColor = False
  end
  object cbProvincia: TComboBoxEx
    Left = 80
    Top = 13
    Width = 385
    Height = 22
    ItemsEx = <>
    TabOrder = 0
    Text = 'cbProvincia'
    OnChange = cbProvinciaChange
  end
  object cbCanton: TComboBoxEx
    Left = 80
    Top = 41
    Width = 385
    Height = 22
    ItemsEx = <>
    TabOrder = 1
    Text = 'cbCanton'
    OnChange = cbCantonChange
  end
  object cbDistrito: TComboBoxEx
    Left = 80
    Top = 69
    Width = 385
    Height = 22
    ItemsEx = <>
    TabOrder = 2
    Text = 'cbDistrito'
    OnChange = cbDistritoChange
  end
  object cbBarrio: TComboBoxEx
    Left = 80
    Top = 97
    Width = 385
    Height = 22
    ItemsEx = <>
    TabOrder = 3
    Text = 'cbBarrio'
    OnChange = cbBarrioChange
  end
  object btnCerrar: TBitBtn
    Left = 205
    Top = 167
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    Glyph.Data = {
      76060000424D7606000000000000360400002800000018000000180000000100
      08000000000040020000120B0000120B0000000100000000000000000000FFFF
      FF00FF00FF00004B0000035E0600046408000793100008961100089612000997
      130009971400099612000996130007740E000A9915000B991600097411000C9A
      18000D9E1B000FA01D000FA11F000C77170010951F000E7D1A00119620000F81
      1C00118C1F00139823001197220014A727001399250013902400159A2700138F
      2300169D2900169C2800159127001AAF31001BB033001B9F310021B83D001C9C
      340020AA3B0023AD410028C1490028C048002FC954002EC1520035CF5E0036D0
      60003BD768003FD96F0041DC7000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000020202020202
      0202020202020202020202020202020202020202020202020202020202020202
      0202020202020202020202020202020202020202020202020202020202020202
      0202020202020202020202020202020202020202020202020202020202020202
      02020302020202020202020202020202020202020202020202031A0302020202
      0202020202020202020202020202020203210623030202020202020202020202
      020202020202020324130F072003020202020202020202020202020202020319
      251D1411081E03020202020202020202020202020203172D28261F0322091B03
      0202020202020202020202020315302E2C27030203120A1C0302020202020202
      02020202033332312A0302020203100E1803020202020202020202020329342B
      03020202020202030F160302020202020202020202032F030202020202020202
      03110B0302020202020202020202030202020202020202020203050C03020202
      02020202020202020202020202020202020202030D0302020202020202020202
      0202020202020202020202020304030202020202020202020202020202020202
      0202020202020303020202020202020202020202020202020202020202020202
      0302020202020202020202020202020202020202020202020202020202020202
      0202020202020202020202020202020202020202020202020202020202020202
      0202020202020202020202020202020202020202020202020202020202020202
      0202020202020202020202020202020202020202020202020202}
    TabOrder = 4
    OnClick = btnCerrarClick
  end
  object edtResultado: TEdit
    Left = 80
    Top = 134
    Width = 385
    Height = 21
    TabOrder = 5
    Text = 'edtResultado'
  end
end
