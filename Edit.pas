unit Edit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TFormEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    RichEditDescr: TRichEdit;
    EditName: TEdit;
    FDConnectionSQLite: TFDConnection;
    FDQuerySelect: TFDQuery;
    FDQueryProductEdit: TFDQuery;
    Label4: TLabel;
    MaskEditPrice: TMaskEdit;
    Label6: TLabel;
    Panel3: TPanel;
    Panel1: TPanel;
    Image2: TImage;
    Label3: TLabel;
    Panel2: TPanel;
    Image1: TImage;
    Label5: TLabel;
    procedure ButtonExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonEditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    class procedure closeAndRefresh();
    class function isEmpty(text: string): Boolean;
  public
    Id: string;
  end;

var
  FormEdit: TFormEdit;

implementation

{$R *.dfm}

uses List, Products;

procedure TFormEdit.ButtonEditClick(Sender: TObject);
var
  objProducts: TProducts;
begin
  //instantiate class
  objProducts := TProducts.Create;

  //Set vars
  objProducts.setId(strtoint(Id));
  objProducts.setName(EditName.Text);
  objProducts.setDescr(RichEditDescr.Text);
  objProducts.setPrice(Round(strtofloat(MaskEditPrice.Text)*100));

  //Check if fields is empty
  if isEmpty(objProducts.getName()) then exit;
  if isEmpty(objProducts.getDescr()) then exit;
  if isEmpty(objProducts.getPrice().ToString) then exit;

  //Opne Connection
  FDConnectionSQLite.Connected := True;

  //Sett Params of Query and Execute
  FDQueryProductEdit.Params.ParamByName('id').Value := objProducts.getId();
  FDQueryProductEdit.Params.ParamByName('name').Value := objProducts.getName();
  FDQueryProductEdit.Params.ParamByName('descr').Value := objProducts.getDescr();
  FDQueryProductEdit.Params.ParamByName('price').Value := objProducts.getPrice();
  FDQueryProductEdit.ExecSQL;

  FDConnectionSQLite.Connected := False;

  //Success
  showMessage('Produto editado com sucesso!');
  closeAndRefresh(); //Refresh Grid
end;

procedure TFormEdit.ButtonExitClick(Sender: TObject);
begin
  closeAndRefresh()
end;

//Close Dialog and refresh Grid
class procedure TFormEdit.closeAndRefresh();
begin
  try
    FormList.StringGridSetup();
  finally
    FormEdit.Close;
  end;
end;

//In OnShow Form
procedure TFormEdit.FormCreate(Sender: TObject);
var
  regn: HRGN;
begin
  FormEdit.Borderstyle := bsNone;
  regn := CreateRoundRectRgn(0, 0,ClientWidth,ClientHeight, 10, 10);
  SetWindowRgn(Handle, regn, True);
end;

procedure TFormEdit.FormShow(Sender: TObject);
begin
  //Open Connection
  FDConnectionSQLite.Connected := True;

  //Set Param and Create Cursor
  FDQuerySelect.Params.ParamByName('id').Value := Id;
  FDQuerySelect.Open;

  //Set TEdits with Cursor
  EditName.Text := FDQuerySelect.FieldByName('name').Value;
  RichEditDescr.Text := FDQuerySelect.FieldByName('descr').Value;
  MaskEditPrice.Text := (FDQuerySelect.FieldByName('price').AsInteger/100).ToString;

  //Close Connection
  FDConnectionSQLite.Connected := False;
end;

//message of empty
class function TFormEdit.isEmpty(text: string): Boolean;
begin
  if Length(text) < 1 then
  begin
    ShowMessage('Campo em branco');
    Result := True;
  end
  else Result := False;
end;

end.
