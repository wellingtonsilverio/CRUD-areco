object FormRegister: TFormRegister
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Cadastro de produto'
  ClientHeight = 295
  ClientWidth = 475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Label2: TLabel
    Left = 16
    Top = 54
    Width = 50
    Height = 13
    Caption = 'Descri'#231#227'o:'
  end
  object ButtonRegister: TButton
    Left = 287
    Top = 232
    Width = 180
    Height = 55
    Caption = 'Cadastrar'
    TabOrder = 0
  end
  object ButtonCancel: TButton
    Left = 166
    Top = 232
    Width = 115
    Height = 55
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = ButtonCancelClick
  end
  object Edit1: TEdit
    Left = 16
    Top = 27
    Width = 451
    Height = 21
    TabOrder = 2
    Text = 'EditName'
  end
  object Edit2: TEdit
    Left = 16
    Top = 73
    Width = 451
    Height = 153
    TabOrder = 3
    Text = 'EditDescr'
  end
  object FDConnectionSQLite: TFDConnection
    Params.Strings = (
      'Database=C:\GitHub\CRUD-areco\DB.sqlite3'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    Left = 400
    Top = 8
  end
  object FDQueryProductInsert: TFDQuery
    Connection = FDConnectionSQLite
    SQL.Strings = (
      'INSERT INTO `products` (`name`, `descr`) VALUES (:name, :descr)')
    Left = 400
    Top = 72
    ParamData = <
      item
        Name = 'NAME'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DESCR'
        ParamType = ptInput
      end>
  end
end
