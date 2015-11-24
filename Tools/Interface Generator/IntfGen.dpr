program IntfGen;

uses
  Vcl.Forms,
  MainCode in 'MainCode.pas' {MainFrm},
  DMain in 'DMain.pas' {DMMain: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMMain, DMMain);
  Application.CreateForm(TMainFrm, MainFrm);
  Application.Run;
end.
