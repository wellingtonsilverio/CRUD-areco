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
    OnInit: TTimer;
    procedure ButtonPushRegisterClick(Sender: TObject);
    procedure OnInitTimer(Sender: TObject);

  private
    { Private declarations }
  public
    procedure StringGridSetup();
    { Public declarations }
  end;

var
  FormList: TFormList;

implementation

{$R *.dfm}

uses Register;

procedure TFormList.ButtonPushRegisterClick(Sender: TObject);
begin
  with TFormRegister.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TFormList.OnInitTimer(Sender: TObject);
begin
  StringGridSetup();

  //Don't Execute over
  OnInit.Enabled := False;
end;

procedure TFormList.StringGridSetup();
Var
  i: Integer;
Begin
  //Connect to DB
  FDConnectionSQLite.Connected := True;

  //Execute Query
  FDTableProducts.Active := True;

  //Titles
  StringGridProduct.cells[0, 0] := 'Código';
  StringGridProduct.cells[1, i] := 'Nome';
  StringGridProduct.cells[2, i] := 'Descrição';
  StringGridProduct.cells[3, i] := 'Em Estoque';
  StringGridProduct.cells[4, i] := 'Preço';

  //Data of database SQLite
  i := 1;
  while not FDTableProducts.eof do
  begin
    StringGridProduct.cells[0, i] := FDTableProducts.FieldByName('id').asString;
    StringGridProduct.cells[1, i] := FDTableProducts.FieldByName('name').asString;
    StringGridProduct.cells[2, i] := FDTableProducts.FieldByName('descr').asString;
    StringGridProduct.cells[3, i] := FDTableProducts.FieldByName('stock').asString;
    StringGridProduct.cells[4, i] := FDTableProducts.FieldByName('price').asString;
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
