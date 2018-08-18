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
  object DBGridProducts: TDBGrid
    Left = 8
    Top = 59
    Width = 751
    Height = 414
    DataSource = DataSourceProducts
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descr'
        Width = 305
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'stock'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'price'
        Width = 92
        Visible = True
      end>
  end
  object ButtonPushRegister: TButton
    Left = 504
    Top = 479
    Width = 255
    Height = 44
    Caption = 'Cadastrar novo produto'
    TabOrder = 1
    OnClick = ButtonPushRegisterClick
  end
  object DataSourceProducts: TDataSource
    AutoEdit = False
    DataSet = FDTableProducts
    Enabled = False
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
    AutoCalcFields = False
    IndexFieldNames = 'id'
    Connection = FDConnectionSQLite
    UpdateOptions.UpdateTableName = 'products'
    TableName = 'products'
    Left = 688
    Top = 472
  end
end
