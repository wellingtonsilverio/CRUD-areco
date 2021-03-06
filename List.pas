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
  Vcl.StdCtrls, Vcl.ExtCtrls, consts, Vcl.Imaging.pngimage;

type
  TFormList = class(TForm)
    Label1: TLabel;
    ButtonPushRegister: TButton;
    FDQueryProductDelete: TFDQuery;
    FDConnectionSQLite: TFDConnection;
    StringGridProduct: TStringGrid;
    FDTableProducts: TFDTable;
    FDTableProductsid: TFDAutoIncField;
    FDTableProductsname: TWideMemoField;
    FDTableProductsdescr: TWideMemoField;
    FDTableProductsstock: TIntegerField;
    FDTableProductsprice: TIntegerField;
    FDQueryProductSelect: TFDQuery;
    Image1: TImage;
    Label2: TLabel;
    ImageButtonExit: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    Image2: TImage;
    Label3: TLabel;
    Image3: TImage;
    Label4: TLabel;
    procedure ButtonPushRegisterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonEditClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure ImageButtonExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    //Private vars
  public
    procedure StringGridSetup();
  end;

var
  FormList: TFormList;

implementation

{$R *.dfm}

uses Register, Edit, Products;

procedure TFormList.ButtonDeleteClick(Sender: TObject);
var
  IdRow: Integer;
  confirmDialog: Integer;
  id: string;
begin
  //Get first selection in Grid
  IdRow := StringGridProduct.Selection.Top;

  if IdRow > 0 then //Confirm leastways row select
  begin
    id := StringGridProduct.Cells[0, IdRow]; //Get id
    //translate button mensage
    TFormRegister.SetResourceString(@SMsgDlgYes, 'Sim');
    TFormRegister.SetResourceString(@SMsgDlgNo, 'N�o');

    // Show a re-register dialog
    confirmDialog := messagedlg('Deseja excluir o produto com c�digo: ' + id + '?',
      mtInformation, [ mbYes, mbNO ], 0);

    // Show the button type selected
    if confirmDialog = 6  then
    begin
      FDQueryProductDelete.Params.ParamByName('id').Value := id;
      FDQueryProductDelete.ExecSQL;

      ShowMessage('Produto excluido com sucesso!');
      StringGridSetup();
    end;
  end;
end;

procedure TFormList.ButtonEditClick(Sender: TObject);
var
  IdRow: Integer;
begin
  IdRow := StringGridProduct.Selection.Top;

  if IdRow > 0 then
  begin
    try
      Application.CreateForm(TFormEdit, FormEdit);
      //Set id in new Form
      FormEdit.Id := StringGridProduct.Cells[0, IdRow];
      FormEdit.ShowModal;
    finally
      FormEdit.Release;
    end;
  end;
end;

procedure TFormList.ButtonPushRegisterClick(Sender: TObject);
begin
  try
    Application.CreateForm(TFormRegister, FormRegister);
    FormRegister.ShowModal;
  finally
    FormRegister.Release;
  end;
end;

procedure TFormList.FormCreate(Sender: TObject);
var
  regn: HRGN;
begin
  FormList.Borderstyle := bsNone;
  regn := CreateRoundRectRgn(0, 0,ClientWidth,ClientHeight,10,10);
  SetWindowRgn(Handle, regn, True);
end;

procedure TFormList.FormShow(Sender: TObject);
begin
  StringGridSetup();
end;

procedure TFormList.ImageButtonExitClick(Sender: TObject);
begin
  Application.Terminate;
  Exit;
end;

procedure TFormList.StringGridSetup();
Var
  i: Integer;
  Button: TButton;
  R1: TRect;
  R2: TRect;
  objProducts: TProducts;
Begin
  //instantiate class
  objProducts := TProducts.Create;

  //Connect to DB
  FDConnectionSQLite.Connected := True;

  //Execute Query
  FDTableProducts.Active := True;

  //Titles
  StringGridProduct.cells[0, 0] := 'C�digo';
  StringGridProduct.cells[1, 0] := 'Nome';
  StringGridProduct.cells[2, 0] := 'Descri��o';
  StringGridProduct.cells[3, 0] := 'Estoque';
  StringGridProduct.cells[4, 0] := 'Pre�o';

  //Data of database SQLite
  i := 1;
  while not FDTableProducts.eof do
  begin
    objProducts.setProducts(
      FDTableProducts.FieldByName('id').AsInteger,
      FDTableProducts.FieldByName('name').asString,
      FDTableProducts.FieldByName('descr').asString,
      FDTableProducts.FieldByName('stock').AsInteger,
      FDTableProducts.FieldByName('price').AsInteger
    );
    StringGridProduct.cells[0, i] := objProducts.getId().ToString;
    StringGridProduct.cells[1, i] := objProducts.getName();
    StringGridProduct.cells[2, i] := objProducts.getDescr();
    StringGridProduct.cells[3, i] := objProducts.getStock().ToString;
    StringGridProduct.cells[4, i] := FormatFloat('R$ ###,###,##0.00',objProducts.getPrice()/100);

    FDTableProducts.next;
    i := i + 1;
  end;

  //Set number of lines in Grid
  StringGridProduct.RowCount := i;

  //Close connections and Query
  FDTableProducts.Active := False;
  FDConnectionSQLite.Connected := False;
End;

end.
