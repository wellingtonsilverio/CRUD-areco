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
  FireDAC.Comp.Client, Vcl.Mask;

type
  TFormEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    RichEditDescr: TRichEdit;
    EditName: TEdit;
    ButtonEdit: TButton;
    ButtonExit: TButton;
    FDConnectionSQLite: TFDConnection;
    FDQuerySelect: TFDQuery;
    FDQueryProductEdit: TFDQuery;
    Label4: TLabel;
    MaskEditPrice: TMaskEdit;
    procedure ButtonExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonEditClick(Sender: TObject);
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

uses List;

procedure TFormEdit.ButtonEditClick(Sender: TObject);
begin
  //Check if fields is empty
  if isEmpty(EditName.Text) then exit;
  if isEmpty(RichEditDescr.Text) then exit;
  if isEmpty(MaskEditPrice.Text) then exit;

  FDConnectionSQLite.Connected := True;

  FDQueryProductEdit.Params.ParamByName('id').Value := Id;
  FDQueryProductEdit.Params.ParamByName('name').Value := EditName.Text;
  FDQueryProductEdit.Params.ParamByName('descr').Value := RichEditDescr.Text;
  FDQueryProductEdit.Params.ParamByName('price').Value := MaskEditPrice.Text;
  FDQueryProductEdit.ExecSQL;

  FDConnectionSQLite.Connected := False;

  showMessage('Produto editado com sucesso!');
  closeAndRefresh();
end;

procedure TFormEdit.ButtonExitClick(Sender: TObject);
begin
  closeAndRefresh()
end;

//Close Dialog
class procedure TFormEdit.closeAndRefresh();
begin
  try
    FormList.StringGridSetup();
  finally
    FormEdit.Close;
  end;
end;

procedure TFormEdit.FormShow(Sender: TObject);
begin
  FDConnectionSQLite.Connected := True;

  FDQuerySelect.Params.ParamByName('id').Value := Id;
  FDQuerySelect.Open;

  EditName.Text := FDQuerySelect.FieldByName('name').Value;
  RichEditDescr.Text := FDQuerySelect.FieldByName('descr').Value;
  MaskEditPrice.Text := (FDQuerySelect.FieldByName('price').AsInteger).ToString;

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