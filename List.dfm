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
  OnShow = FormShow
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
  object ButtonEdit: TButton
    Left = 8
    Top = 479
    Width = 145
    Height = 44
    Caption = 'Editar selecionado'
    TabOrder = 1
    OnClick = ButtonEditClick
  end
  object ButtonDelete: TButton
    Left = 159
    Top = 479
    Width = 114
    Height = 44
    Caption = 'Exluir selecionado'
    TabOrder = 2
    OnClick = ButtonDeleteClick
  end
  object StringGridProduct: TStringGrid
    Left = 8
    Top = 59
    Width = 751
    Height = 414
    TabOrder = 3
    ColWidths = (
      64
      203
      289
      86
      80)
  end
  object FDQueryProductDelete: TFDQuery
    Connection = FDConnectionSQLite
    SQL.Strings = (
      'DELETE FROM `products`'
      'WHERE `id` = :id')
    Left = 688
    Top = 352
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object FDConnectionSQLite: TFDConnection
    Params.Strings = (
      'Database=C:\GitHub\CRUD-areco\DB.sqlite3'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    Left = 688
    Top = 416
  end
  object FDTableProducts: TFDTable
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
    object FDTableProductsprice: TIntegerField
      FieldName = 'price'
      Origin = 'price'
    end
  end
end
