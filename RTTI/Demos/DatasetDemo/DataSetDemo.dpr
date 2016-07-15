program DataSetDemo;

uses
  Vcl.Forms,
  MainCode in 'MainCode.pas' {MainFrm},
  ARLibs.RTTI.DatasetBuilder in '..\..\Dataset\ARLibs.RTTI.DatasetBuilder.pas',
  ARLibs.RTTI.DatasetBuilder.Attributes in '..\..\Dataset\ARLibs.RTTI.DatasetBuilder.Attributes.pas',
  ARLibs.RTTI.Core in '..\..\Core\ARLibs.RTTI.Core.pas',
  ARLibs.RTTI.Interfaces in '..\..\Core\ARLibs.RTTI.Interfaces.pas',
  ARLibs.RTTI.DatasetBuilder.ClientDataset in '..\..\Dataset\ARLibs.RTTI.DatasetBuilder.ClientDataset.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainFrm, MainFrm);
  Application.Run;
end.
