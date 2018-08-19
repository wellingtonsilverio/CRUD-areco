program Crud_Areco;

uses
  Vcl.Forms,
  List in 'List.pas' {FormList},
  Register in 'Register.pas' {FormRegister};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormList, FormList);
  Application.Run;
end.
