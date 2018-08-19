unit Register;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, consts;

type
  TFormRegister = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ButtonRegister: TButton;
    ButtonCancel: TButton;
    FDConnectionSQLite: TFDConnection;
    FDQueryProductInsert: TFDQuery;
    EditName: TEdit;
    RichEditDescr: TRichEdit;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonRegisterClick(Sender: TObject);
  private
    class procedure SetResourceString(xOldResourceString: PResStringRec;
                                         xValueChanged: PChar);
  public
    { Public declarations }
  end;

var
  FormRegister: TFormRegister;

implementation

{$R *.dfm}

uses List;

procedure TFormRegister.ButtonCancelClick(Sender: TObject);
begin
  FormList.StringGridSetup();
  Close
end;

procedure TFormRegister.ButtonRegisterClick(Sender: TObject);
var
  confirmDialog : Integer;
  mbYesCustom: Tbutton;
  mbNoCustom: Tbutton;
begin
  if Length(EditName.Text) < 1 then exit;
  if Length(RichEditDescr.Text) < 1 then exit;

  //Definir Parametros e executar Insert
  FDQueryProductInsert.Params.ParamByName('name').Value := EditName.Text;
  FDQueryProductInsert.Params.ParamByName('descr').Value := RichEditDescr.Text;
  FDQueryProductInsert.ExecSQL;

  //Traduzir os bot�es
  SetResourceString(@SMsgDlgYes, 'Sim');
  SetResourceString(@SMsgDlgNo, 'N�o');

  // Show a re-register dialog
  confirmDialog := messagedlg('Produto cadastrado com sucesso! deseja fazer outro cadastro?',
    mtInformation, [ mbYes, mbNO ], 0);

  // Show the button type selected
  if confirmDialog = 6  then
  begin
    EditName.Text := '';
    RichEditDescr.Text := '';
  end;
  if confirmDialog = 7 then Close;
end;

//Procedure para tradu��o
class procedure TFormRegister.SetResourceString(xOldResourceString: PResStringRec;
                                           xValueChanged: PChar);
var
  POldProtect: DWORD;
begin
  VirtualProtect(xOldResourceString, SizeOf(xOldResourceString^),
                 PAGE_EXECUTE_READWRITE, @POldProtect);
   xOldResourceString^.Identifier := Integer(xValueChanged);
   VirtualProtect(xOldResourceString,SizeOf(xOldResourceString^),POldProtect,
                  @POldProtect);
end;

end.
