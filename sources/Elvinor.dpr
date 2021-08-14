program Elvinor;

uses
  Vcl.Forms,
  Elvinor.MainForm in 'Elvinor.MainForm.pas' {MainForm},
  Elvinor.Player in 'Elvinor.Player.pas',
  Elvinor.Locations in 'Elvinor.Locations.pas',
  Elvinor.Items in 'Elvinor.Items.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
