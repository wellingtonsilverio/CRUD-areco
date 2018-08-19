unit List;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormList = class(TForm)
    Label1: TLabel;
    FDConnectionSQLite: TFDConnection;
    FDTableProducts: TFDTable;
    ButtonPushRegister: TButton;
    FDTableProductsid: TFDAutoIncField;
    FDTableProductsname: TWideMemoField;
    FDTableProductsdescr: TWideMemoField;
    FDTableProductsstock: TIntegerField;
    FDTableProductsprice: TFloatField;
    StringGridProduct: TStringGrid;
    procedure ButtonPushRegisterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    procedure GridButtonClick(Sender: TObject);
  public
    procedure StringGridSetup();
  end;

var
  FormList: TFormList;

implementation

{$R *.dfm}

uses Register;

procedure TFormList.ButtonPushRegisterClick(Sender: TObject);
begin
  try
    Application.CreateForm(TFormRegister, FormRegister);
    FormRegister.ShowModal;
  finally
    FormRegister.Release;
  end;
end;

procedure TFormList.FormShow(Sender: TObject);
begin
  StringGridSetup();
end;

procedure TFormList.StringGridSetup();
Var
  i: Integer;
  Button: TButton;
  R1: TRect;
  R2: TRect;
Begin
  //Connect to DB
  FDConnectionSQLite.Connected := True;

  //Execute Query
  FDTableProducts.Active := True;

  //Buttons
  R1 := StringGridProduct.CellRect(5, StringGridProduct.FixedRows);
  Inc(R1.Right, StringGridProduct.GridLineWidth);
  Inc(R1.Bottom, StringGridProduct.GridLineWidth);

  R2 := StringGridProduct.CellRect(6, StringGridProduct.FixedRows);
  Inc(R2.Right, StringGridProduct.GridLineWidth);
  Inc(R2.Bottom, StringGridProduct.GridLineWidth);

  //Titles
  StringGridProduct.cells[0, 0] := 'C�digo';
  StringGridProduct.cells[1, 0] := 'Nome';
  StringGridProduct.cells[2, 0] := 'Descri��o';
  StringGridProduct.cells[3, 0] := 'Em Estoque';
  StringGridProduct.cells[4, 0] := 'Pre�o';
  StringGridProduct.cells[5, 0] := 'A��es';
  StringGridProduct.cells[6, 0] := 'A��es';

  //Data of database SQLite
  i := 1;
  while not FDTableProducts.eof do
  begin
    StringGridProduct.cells[0, i] := FDTableProducts.FieldByName('id').asString;
    StringGridProduct.cells[1, i] := FDTableProducts.FieldByName('name').asString;
    StringGridProduct.cells[2, i] := FDTableProducts.FieldByName('descr').asString;
    StringGridProduct.cells[3, i] := FDTableProducts.FieldByName('stock').asString;
    StringGridProduct.cells[4, i] := FDTableProducts.FieldByName('price').asString;

    Button := TButton.Create(StringGridProduct);
    Button.BoundsRect := R1;
    Button.Caption := 'Editar';
    Button.Tag := I;
    Button.ControlStyle := [csClickEvents];
    Button.OnClick := GridButtonClick;
    Button.Parent := StringGridProduct;
    StringGridProduct.Objects[0, I] := Button;
    OffsetRect(R1, 0, StringGridProduct.DefaultRowHeight + StringGridProduct.GridLineWidth);

    Button := TButton.Create(StringGridProduct);
    Button.BoundsRect := R2;
    Button.Caption := 'Excluir';
    Button.Tag := I;
    Button.ControlStyle := [csClickEvents];
    Button.OnClick := GridButtonClick;
    Button.Parent := StringGridProduct;
    StringGridProduct.Objects[0, I] := Button;
    OffsetRect(R2, 0, StringGridProduct.DefaultRowHeight + StringGridProduct.GridLineWidth);

    FDTableProducts.next;
    i := i + 1;
  end;

  //Set number of lines in Grid
  StringGridProduct.RowCount := i;

  //Close connections and Query
  FDTableProducts.Active := False;
  FDConnectionSQLite.Connected := False;
End;

procedure TFormList.GridButtonClick(Sender: TObject);
begin
  ShowMessage('a');
end;

end.
