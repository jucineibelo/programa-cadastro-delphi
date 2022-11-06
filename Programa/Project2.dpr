program Project2;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {FrmPrincipal},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Slate Classico');
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
