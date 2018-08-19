object FormList: TFormList
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Delphi Teste 01 - Areco'
  ClientHeight = 531
  ClientWidth = 767
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 22
    Width = 130
    Height = 31
    Caption = 'PRODUTOS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -26
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ButtonPushRegister: TButton
    Left = 504
    Top = 479
    Width = 255
    Height = 44
    Caption = 'Cadastrar novo produto'
    TabOrder = 0
    OnClick = ButtonPushRegisterClick
  end
  object StringGridProduct: TStringGrid
    Left = 8
    Top = 59
    Width = 751
    Height = 414
    TabOrder = 1
    ColWidths = (
      64
      172
      295
      103
      105)
  end
  object DataSourceProducts: TDataSource
    AutoEdit = False
    DataSet = FDTableProducts
    Left = 688
    Top = 352
  end
  object FDConnectionSQLite: TFDConnection
    Params.Strings = (
      'Database=C:\GitHub\CRUD-areco\DB.sqlite3'
      'LockingMode=Normal'
      'Synchronous=Full'
      'StringFormat=Unicode'
      'DriverID=SQLite')
    Connected = True
    Left = 688
    Top = 408
  end
  object FDTableProducts: TFDTable
    Active = True
    AutoCalcFields = False
    IndexFieldNames = 'id'
    Connection = FDConnectionSQLite
    UpdateOptions.UpdateTableName = 'products'
    TableName = 'products'
    Left = 688
    Top = 472
    object FDTableProductsid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object FDTableProductsname: TWideMemoField
      FieldName = 'name'
      Origin = 'name'
      BlobType = ftWideMemo
    end
    object FDTableProductsdescr: TWideMemoField
      FieldName = 'descr'
      Origin = 'descr'
      BlobType = ftWideMemo
    end
    object FDTableProductsstock: TIntegerField
      FieldName = 'stock'
      Origin = 'stock'
    end
    object FDTableProductsprice: TFloatField
      FieldName = 'price'
      Origin = 'price'
    end
  end
  object OnInit: TTimer
    Interval = 1
    OnTimer = OnInitTimer
    Left = 688
    Top = 296
  end
end