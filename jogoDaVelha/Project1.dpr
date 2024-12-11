program Project1;

uses
  Vcl.Forms,
  unJogoDaVelha in 'unJogoDaVelha.pas' {TJogodaVelha},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TTJogodaVelha, TJogodaVelha);
  Application.Run;
end.
