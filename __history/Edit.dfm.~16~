object FormEdit: TFormEdit
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Editar produto'
  ClientHeight = 270
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
  object Label4: TLabel
    Left = 429
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Pre'#231'o:'
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
    Width = 415
    Height = 21
    TabOrder = 1
  end
  object ButtonEdit: TButton
    Left = 400
    Top = 208
    Width = 169
    Height = 53
    Caption = 'Editar'
    TabOrder = 2
    OnClick = ButtonEditClick
  end
  object ButtonExit: TButton
    Left = 280
    Top = 208
    Width = 114
    Height = 53
    Caption = 'Voltar'
    TabOrder = 3
    OnClick = ButtonExitClick
  end
  object MaskEditPrice: TMaskEdit
    Left = 429
    Top = 27
    Width = 122
    Height = 21
    EditMask = 'R$ ###,###,##0.00;0;_'
    MaxLength = 17
    TabOrder = 4
    Text = ''
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
  object FDQueryProductEdit: TFDQuery
    Connection = FDConnectionSQLite
    SQL.Strings = (
      'UPDATE `products`'
      'SET `name` = :name, `descr` = :descr, `price` = :price'
      'WHERE `id` = :id;')
    Left = 504
    Top = 160
    ParamData = <
      item
        Name = 'NAME'
        ParamType = ptInput
      end
      item
        Name = 'DESCR'
        ParamType = ptInput
      end
      item
        Name = 'PRICE'
        ParamType = ptInput
      end
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
end
