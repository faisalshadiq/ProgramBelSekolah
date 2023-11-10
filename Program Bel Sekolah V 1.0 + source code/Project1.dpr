program Project1;

uses
  Forms,
  Unutama in 'Unutama.pas' {futama},
  undataalarm in 'undataalarm.pas' {fdataalaram},
  UnAlarm in 'UnAlarm.pas' {falaram},
  nuest in 'nuest.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfutama, futama);
  Application.CreateForm(Tfdataalaram, fdataalaram);
  Application.CreateForm(Tfalaram, falaram);
  Application.Run;
end.
