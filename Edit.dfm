object FormEdit: TFormEdit
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Editar produto'
  ClientHeight = 469
  ClientWidth = 643
  Color = 15855852
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 1644825
  Font.Height = -18
  Font.Name = 'Segoe UI Light'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 25
  object Label1: TLabel
    Left = 64
    Top = 111
    Width = 51
    Height = 25
    Caption = 'Nome:'
  end
  object Label2: TLabel
    Left = 64
    Top = 181
    Width = 77
    Height = 25
    Caption = 'Descri'#231#227'o:'
  end
  object Label4: TLabel
    Left = 408
    Top = 111
    Width = 47
    Height = 25
    Caption = 'Pre'#231'o:'
  end
  object Label6: TLabel
    Left = 64
    Top = 49
    Width = 181
    Height = 32
    Caption = 'EDITAR PRODUTO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 3552822
    Font.Height = -24
    Font.Name = 'Segoe UI Light'
    Font.Style = []
    ParentFont = False
  end
  object RichEditDescr: TRichEdit
    Left = 64
    Top = 212
    Width = 482
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
    Left = 64
    Top = 142
    Width = 338
    Height = 33
    TabOrder = 1
  end
  object MaskEditPrice: TMaskEdit
    Left = 408
    Top = 142
    Width = 138
    Height = 33
    TabOrder = 2
    Text = ''
  end
  object Panel3: TPanel
    Left = 64
    Top = 80
    Width = 481
    Height = 1
    ParentCustomHint = False
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    Color = 3552822
    Ctl3D = True
    DoubleBuffered = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 3552822
    Font.Height = -18
    Font.Name = 'Segoe UI Light'
    Font.Style = []
    ParentBiDiMode = False
    ParentBackground = False
    ParentCtl3D = False
    ParentDoubleBuffered = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 323
    Top = 352
    Width = 222
    Height = 60
    BevelOuter = bvNone
    Color = 10791721
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
    StyleElements = [seFont, seClient]
    OnClick = ButtonEditClick
    object Image2: TImage
      Left = 9
      Top = 10
      Width = 40
      Height = 40
      Align = alCustom
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000240000
        002408040000004B095013000000E84944415478DAEDD42D0FC2301006E0F7F8
        F0FCA3615013640A12DC12048EA090A090A050600841800083C2107E111E7134
        1563DDD671DD30243B75354F7ABDBB127E14544115542098E0D1BD34A498037A
        98D0AA14A499BE4E3D7A148662CC9C66856FC475ECD38C33A498138234E308D9
        1927288F7180B881A39D11438AB9C0B7330988BB1822A0973B63403CC00E35DC
        E09B948431A1101B7D36286EE2FC9D49961662AB938852CC159DEF4CEAB17984
        F5879233195D8B51812A4AC864B69FC758EAE4899694B1CC51448919EB404694
        90C9996C9E622167725784DBF13FB904E41615F48FD01B491353253FCE730300
        00000049454E44AE426082}
      Stretch = True
      OnClick = ButtonEditClick
    end
    object Label3: TLabel
      Left = 112
      Top = 19
      Width = 40
      Height = 21
      Caption = 'Editar'
      OnClick = ButtonEditClick
    end
  end
  object Panel2: TPanel
    Left = 147
    Top = 352
    Width = 165
    Height = 60
    BevelOuter = bvNone
    Color = 6320875
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
    StyleElements = [seFont, seClient]
    OnClick = ButtonExitClick
    object Image1: TImage
      Left = 9
      Top = 10
      Width = 40
      Height = 40
      Align = alCustom
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000240000
        002408040000004B095013000002664944415478DAE595CD4B545114C07FC7A1
        8FC1A08240A3A8A4459866B549099A721D411419581654D2C2828411DD6433B5
        E843FB580459F441564203B5F20F505A94057D8E511119D4625C046E24983E6E
        675E6F66DE1BDF73DE44AB3A9B73EEB9E7FEEE7BE79E7BAEF09744FE539029A7
        81852CE63BE37CE6B14C960C32C21E9A696486C39966983BF48B090C321BB948
        ADCFD6490EC970209069A58F327BF09651C608B1841A56D8BE9F8ABA541464BA
        895BC62427B82929C74C257B394AB935884B6C5A90D9CD2DCB78409313E28025
        D860992D72DB176456F3C44A6F3FFBE487CF3184B8AE0701DF5827CFFD408FA8
        57F59AB592C657CC4C9E6AC6E0A1ACF70499CD0C5AA9AC9351A61553C34BEB38
        B6C8A017E81EDB545D930314157395FDAAEECBF6292013E60B613556493200A8
        9657AABE322F9B843C2842A6CC3E4A956B8110E3A01A9789B92BDA7C2013B929
        5B9C7950B3963F2464A72BFC149DB679463A5D33776952B54B060A41517A545D
        907657F804736D7342E6BB66CE73445587F4DA2013E3984712ECCA35292A6CCF
        B854BA40E7C86C1995B3B92F323D440B30BDD261879FA4CBF69D962E1728C18E
        29BF5680CA61ACB96EDA54F549C1779B3196A96A9421578E1C2817C64F4C1D2F
        F039FEDFA840188DBE422BDE0569A1088859A9ED2DB3D2FB8A0415335B2F6DB5
        1A23D290F7960CD236728316326DA45E9E1505996A425E772E6063CB855731C2
        02BD327179EF82E45BEDF1C272F06AFE61DE68B3B74C3EA9FD4EDF3567F337B4
        0568FE5664840116F92429C9E16C111605296A165BB5334798E370A619D20D4A
        792073B832D6B09CA51A95FAC327BB74F98741BF00A49FBD2579C608C2000000
        0049454E44AE426082}
      Stretch = True
      OnClick = ButtonExitClick
    end
    object Label5: TLabel
      Left = 78
      Top = 19
      Width = 41
      Height = 21
      Caption = 'Voltar'
      OnClick = ButtonExitClick
    end
  end
  object FDConnectionSQLite: TFDConnection
    Params.Strings = (
      'Database=$(RUN)/DB.sqlite3'
      'LockingMode=Normal'
      'DriverID=SQLite')
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
