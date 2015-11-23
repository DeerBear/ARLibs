program DialogsDemo;

uses
  Vcl.Forms,
  MainCode in 'MainCode.pas' {MainFrm},
  ARLibs.Dialogs.Interfaces in '..\ARLibs.Dialogs.Interfaces.pas',
  ARLibs.Dialogs.CoreClasses in '..\ARLibs.Dialogs.CoreClasses.pas',
  ARLibs.Dialogs.OKDialog in '..\ARLibs.Dialogs.OKDialog.pas',
  ARLibs.Dialogs.ClientLayer in '..\ARLibs.Dialogs.ClientLayer.pas',
  ARLibs.Dialogs.ConfirmDialog in '..\ARLibs.Dialogs.ConfirmDialog.pas',
  ARlibs.Dialogs.CustomDialogs.Classes in '..\ARlibs.Dialogs.CustomDialogs.Classes.pas',
  BaseDialogCode in 'BaseDialogCode.pas' {BaseDialogFrm},
  ActualDialogCode in 'ActualDialogCode.pas' {ActualDialogFrm},
  ARLibs.Dialogs.Demo.CustomDialog in 'Custom Dialog\ARLibs.Dialogs.Demo.CustomDialog.pas',
  ARLibs.Dialogs.Demo.Interfaces.CustomDialog in 'Custom Dialog\ARLibs.Dialogs.Demo.Interfaces.CustomDialog.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainFrm, MainFrm);
  Application.CreateForm(TActualDialogFrm, ActualDialogFrm);
  Application.Run;
end.
