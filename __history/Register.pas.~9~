unit Register;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormRegister = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ButtonRegister: TButton;
    ButtonCancel: TButton;
    FDConnectionSQLite: TFDConnection;
    FDQueryProductInsert: TFDQuery;
    EditName: TEdit;
    EditDescr: TEdit;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonRegisterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRegister: TFormRegister;

implementation

{$R *.dfm}

procedure TFormRegister.ButtonCancelClick(Sender: TObject);
begin
  Close
end;

procedure TFormRegister.ButtonRegisterClick(Sender: TObject);
begin
  FDQueryProductInsert.Params.ParamByName('name').Value := EditName.Text;
  FDQueryProductInsert.Params.ParamByName('descr').Value := EditDescr.Text;
  FDQueryProductInsert.ExecSQL;
end;

end.
