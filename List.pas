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
  Vcl.StdCtrls, Vcl.ExtCtrls, consts;

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
    FDQueryProductDelete: TFDQuery;
    procedure ButtonPushRegisterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    procedure GridButtonEditClick(Sender: TObject);
    procedure GridButtonDeleteClick(Sender: TObject);
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
  StringGridProduct.cells[0, 0] := 'Código';
  StringGridProduct.cells[1, 0] := 'Nome';
  StringGridProduct.cells[2, 0] := 'Descrição';
  StringGridProduct.cells[3, 0] := 'Em Estoque';
  StringGridProduct.cells[4, 0] := 'Preço';
  StringGridProduct.cells[5, 0] := 'Editar';
  StringGridProduct.cells[6, 0] := 'Excluir';

  //Data of database SQLite
  i := 1;
  while not FDTableProducts.eof do
  begin
    StringGridProduct.cells[0, i] := FDTableProducts.FieldByName('id').asString;
    StringGridProduct.cells[1, i] := FDTableProducts.FieldByName('name').asString;
    StringGridProduct.cells[2, i] := FDTableProducts.FieldByName('descr').asString;
    StringGridProduct.cells[3, i] := FDTableProducts.FieldByName('stock').asString;
    StringGridProduct.cells[4, i] := FDTableProducts.FieldByName('price').asString;

    //Button of Edit
    Button := TButton.Create(StringGridProduct);
    Button.BoundsRect := R1;
    Button.Caption := 'I';
    Button.Tag := strtoint(FDTableProducts.FieldByName('id').asString);
    Button.ControlStyle := [csClickEvents];
    Button.OnClick := GridButtonEditClick;
    Button.Parent := StringGridProduct;
    StringGridProduct.Objects[0, i] := Button;
    OffsetRect(R1, 0, StringGridProduct.DefaultRowHeight + StringGridProduct.GridLineWidth);

    //Button of Delete
    Button := TButton.Create(StringGridProduct);
    Button.BoundsRect := R2;
    Button.Caption := '-';
    Button.Tag := strtoint(FDTableProducts.FieldByName('id').asString);
    Button.ControlStyle := [csClickEvents];
    Button.OnClick := GridButtonDeleteClick;
    Button.Parent := StringGridProduct;
    StringGridProduct.Objects[0, i] := Button;
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

procedure TFormList.GridButtonEditClick(Sender: TObject);
var
  Button: TButton;
begin
  Button := TButton(Sender);
  ShowMessage(Button.Tag.ToString);
end;

procedure TFormList.GridButtonDeleteClick(Sender: TObject);
var
  Button: TButton;
  confirmDialog : Integer;
  id: string;
begin
  Button := TButton(Sender);
  id := Button.Tag.ToString;

  //translate button mensage
  TFormRegister.SetResourceString(@SMsgDlgYes, 'Sim');
  TFormRegister.SetResourceString(@SMsgDlgNo, 'Não');

  // Show a re-register dialog
  confirmDialog := messagedlg('Deseja excluir o produto com código: ' + id + '?',
    mtInformation, [ mbYes, mbNO ], 0);

  // Show the button type selected
  if confirmDialog = 6  then
  begin
    FDQueryProductDelete.Params.ParamByName('id').Value := id;
    FDQueryProductDelete.ExecSQL;
    ShowMessage('Produto excluido com sucesso!');
    StringGridSetup()
  end;
end;

end.
