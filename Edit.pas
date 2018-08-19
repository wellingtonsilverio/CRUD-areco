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
  FireDAC.Comp.Client;

type
  TFormEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RichEditDescr: TRichEdit;
    EditName: TEdit;
    EditPrice: TEdit;
    ButtonEdit: TButton;
    ButtonExit: TButton;
    FDConnectionSQLite: TFDConnection;
    FDQuerySelect: TFDQuery;
    FDQueryProductEdit: TFDQuery;
    procedure ButtonExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonEditClick(Sender: TObject);
  private
    class procedure closeAndRefresh();
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
  FDConnectionSQLite.Connected := True;

  FDQueryProductEdit.Params.ParamByName('id').Value := Id;
  FDQueryProductEdit.Params.ParamByName('name').Value := EditName.Text;
  FDQueryProductEdit.Params.ParamByName('descr').Value := RichEditDescr.Text;
  FDQueryProductEdit.Params.ParamByName('price').Value := EditPrice.Text;
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
  EditPrice.Text := FDQuerySelect.FieldByName('price').Value;

  FDConnectionSQLite.Connected := False;
end;

end.
