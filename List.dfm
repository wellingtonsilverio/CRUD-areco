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
    Left = 24
    Top = 24
    Width = 121
    Height = 29
    Caption = 'PRODUTOS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 59
    Width = 721
    Height = 414
    DataSource = DataSourceProducts
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
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
      'DriverID=SQLite')
    Connected = True
    Left = 688
    Top = 408
  end
  object FDTableProducts: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnectionSQLite
    UpdateOptions.UpdateTableName = 'products'
    TableName = 'products'
    Left = 688
    Top = 472
  end
end
