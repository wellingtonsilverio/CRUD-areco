object FormEdit: TFormEdit
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Editar produto'
  ClientHeight = 315
  ClientWidth = 577
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Label2: TLabel
    Left = 8
    Top = 54
    Width = 50
    Height = 13
    Caption = 'Descri'#231#227'o:'
  end
  object Label3: TLabel
    Left = 8
    Top = 208
    Width = 27
    Height = 13
    Caption = 'Pre'#231'o'
  end
  object RichEditDescr: TRichEdit
    Left = 8
    Top = 73
    Width = 561
    Height = 129
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Zoom = 100
  end
  object EditName: TEdit
    Left = 8
    Top = 27
    Width = 561
    Height = 21
    TabOrder = 1
  end
  object EditPrice: TEdit
    Left = 8
    Top = 227
    Width = 561
    Height = 21
    TabOrder = 2
  end
  object ButtonEdit: TButton
    Left = 400
    Top = 254
    Width = 169
    Height = 53
    Caption = 'Editar'
    TabOrder = 3
  end
  object ButtonExit: TButton
    Left = 280
    Top = 254
    Width = 114
    Height = 53
    Caption = 'Voltar'
    TabOrder = 4
    OnClick = ButtonExitClick
  end
  object FDConnectionSQLite: TFDConnection
    Params.Strings = (
      'Database=C:\GitHub\CRUD-areco\DB.sqlite3'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    Left = 504
    Top = 264
  end
  object FDQuerySelect: TFDQuery
    Connection = FDConnectionSQLite
    SQL.Strings = (
      'SELECT name, descr, price FROM `products` WHERE id = :id')
    Left = 504
    Top = 208
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
        Value = Null
      end>
  end
end
