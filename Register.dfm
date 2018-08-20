object FormRegister: TFormRegister
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Cadastro de produto'
  ClientHeight = 442
  ClientWidth = 609
  Color = 15855852
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 1644825
  Font.Height = -18
  Font.Name = 'Segoe UI Light'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 25
  object Label1: TLabel
    Left = 64
    Top = 77
    Width = 51
    Height = 25
    Caption = 'Nome:'
  end
  object Label2: TLabel
    Left = 64
    Top = 147
    Width = 77
    Height = 25
    Caption = 'Descri'#231#227'o:'
  end
  object Label3: TLabel
    Left = 368
    Top = 77
    Width = 47
    Height = 25
    Caption = 'Pre'#231'o:'
  end
  object Label6: TLabel
    Left = 64
    Top = 29
    Width = 261
    Height = 32
    Caption = 'CADASTRO DE PRODUTO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 3552822
    Font.Height = -24
    Font.Name = 'Segoe UI Light'
    Font.Style = []
    ParentFont = False
  end
  object EditName: TEdit
    Left = 64
    Top = 108
    Width = 298
    Height = 33
    TabOrder = 0
  end
  object RichEditDescr: TRichEdit
    Left = 64
    Top = 178
    Width = 473
    Height = 153
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Zoom = 100
  end
  object MaskEditPrice: TMaskEdit
    Left = 368
    Top = 108
    Width = 169
    Height = 33
    EditMask = 'R$ ###,###,##0.00;0;_'
    MaxLength = 17
    TabOrder = 3
    Text = ''
  end
  object Panel1: TPanel
    Left = 315
    Top = 345
    Width = 222
    Height = 60
    BevelOuter = bvNone
    Color = 6336039
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
    StyleElements = [seFont, seClient]
    OnClick = ButtonRegisterClick
    object Image2: TImage
      Left = 9
      Top = 10
      Width = 40
      Height = 40
      Align = alCustom
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
        00200804000000D973B27F0000000467414D410000B18F0BFC61050000000262
        4B47440000AA8D2332000000097048597300000DD700000DD70142289B780000
        000774494D4507E2081404230358FA1527000001EC4944415478DAD595414855
        511086BF517960A228242A1818618B8AA2451185A968A10846204224698B166D
        5AB46919B4721308428BA88D52220559589464651411D122822008432324A222
        D1B44CA6797A9D9EAFABEFDDD7CAB33AFF9CF37FF7DC99B9E70AFF3964ED02B4
        8C988C650CD0635C366FBB5CC908A0AD5C25DB26F31CCD00A087B84E4E20C623
        03B4819BC45C764504682DB7C975D9475B2480EEE31E792E6FD02ABF23007417
        F729707987C3F22B421975070F2972F98026998D4FD204E8161E51ECF2090D32
        BD38358066719C1FD2B78ABD9211CA5CBEA05E26978498FD9201E0AC9C5BC15E
        C16336B87C45AD7CFBBB2A7A9ED3C1FC947487D8CBCDBED1E51B6AE473E2BAE8
        B8D3950EE949B297DAE137BB7CC77E9958BE43F424175CCDD3220309F6F596BA
        AD2EC7A8920FC9278C27B19333AE7F5A7986037BA1156BA7AF7CB4A78FFEFB8A
        0B65D48B9CF0C894E5F8B9C5F2AD6D767BF413D5F2362CC58B802CFA69F1D857
        AA19E52E551EF962997F1D5EA3A09134C620073C3AC97442DDBF53272F615580
        21F2ECC87B42764C71509E414A80218AACE2DB92D667689411480BB070513E4D
        689A784D9A6508D2061862937D28A58198B3AEB805910086D86EBD5748BCA98E
        C8B554F6D0CF59F73264D75687F4A6B6AF701F6809EBE47D3AF635FD6F5C1A7F
        00308D7BE667744F280000002574455874646174653A63726561746500323031
        382D30382D32305430343A33353A30332B30323A30303A34E148000000257445
        5874646174653A6D6F6469667900323031382D30382D32305430343A33353A30
        332B30323A30304B6959F40000001974455874536F667477617265007777772E
        696E6B73636170652E6F72679BEE3C1A0000000049454E44AE426082}
      Stretch = True
      OnClick = ButtonRegisterClick
    end
    object Label4: TLabel
      Left = 94
      Top = 19
      Width = 67
      Height = 21
      Caption = 'Cadastrar'
      OnClick = ButtonRegisterClick
    end
  end
  object Panel2: TPanel
    Left = 144
    Top = 345
    Width = 165
    Height = 60
    BevelOuter = bvNone
    Color = 3951847
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
    StyleElements = [seFont, seClient]
    OnClick = ButtonCancelClick
    object Image1: TImage
      Left = 9
      Top = 10
      Width = 40
      Height = 40
      Align = alCustom
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
        00200804000000D973B27F0000000467414D410000B18F0BFC61050000000262
        4B47440000AA8D2332000000097048597300000DD700000DD70142289B780000
        000774494D4507E208140424189DDE4A0C000002284944415478DADD954D4854
        6114869FC3981663212EDA961145D66228B09D226689046354505453C44885FD
        2CB28520B5308A083110255A1595939252B9316A518B846288162E34C1A616CD
        509064084EA4A7D32D75CCF9716620C2FB71E17EDCFB3DF79EF77BDF73852C0F
        59B4005DCE255EC8BD0C015AC42336F158AA32026819F7296092671901F418AD
        8CB1879B0CA60DD01CAE51C7005E19D150DA002DA48B0AABFEA07CB359BA00DD
        604BD77299469972E62156F0946167BC95CF29005A4D805C8E4A6006E8A78195
        E4FF99064D93807C4900D07AAE10A64682F3245D66108F1556413151FBC6F332
        F81740F3B8818F57B63C9CAC562BB181FDFCA09196DF454E03FAD8C11D6A6522
        B560BA8636AAE867B7446601BDEC34805FA2A9018610CE9AC98729974FD38025
        46ADE5A595105908C220FB4CF0014A657456C453B498885E79BD40C455EAE990
        03B1DB586926CAE38874CD3CD44439DF6D4489F08E111B43BF0CE6DC73D1C736
        53A227D648EB6C93D6D3C40551671EA2D0BECA6D4E7093E33C12E521B72CA393
        8E6B8376A748C663AD5C4027DBE9C127E373ADACABD8C2663B4B0C1AE1361765
        4C7D063B21D7E786C945336778636A7C8897055DCA71C79F43D4F09E8F84A578
        7E9CFDB433CA2E3AE28749DD9CE61C2E0E51C9493CF11A4A29DD16A4299E274A
        A315DB6D123FB0D71C8EDFD256D39BBCA559003AF1DA4573A2A69A6FF1EA97BB
        49BC906BE6F3F0248BB6AE1B6D2BBF66F55FD0BD6CFD6FFF4CFF10F013D457BA
        621590E42C0000002574455874646174653A63726561746500323031382D3038
        2D32305430343A33363A32342B30323A3030568163B800000025744558746461
        74653A6D6F6469667900323031382D30382D32305430343A33363A32342B3032
        3A303027DCDB040000001974455874536F667477617265007777772E696E6B73
        636170652E6F72679BEE3C1A0000000049454E44AE426082}
      Stretch = True
      OnClick = ButtonCancelClick
    end
    object Label5: TLabel
      Left = 78
      Top = 19
      Width = 41
      Height = 21
      Caption = 'Voltar'
      OnClick = ButtonCancelClick
    end
  end
  object Panel3: TPanel
    Left = 64
    Top = 60
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
    TabOrder = 1
  end
  object FDConnectionSQLite: TFDConnection
    Params.Strings = (
      'Database=$(RUN)/DB.sqlite3'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Left = 16
    Top = 328
  end
  object FDQueryProductInsert: TFDQuery
    Connection = FDConnectionSQLite
    SQL.Strings = (
      
        'INSERT INTO `products` (`name`, `descr`, `price`) VALUES (:name,' +
        ' :descr, :price)')
    Left = 16
    Top = 376
    ParamData = <
      item
        Name = 'NAME'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DESCR'
        ParamType = ptInput
      end
      item
        Name = 'PRICE'
        ParamType = ptInput
      end>
  end
end
