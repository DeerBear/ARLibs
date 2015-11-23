unit ARLibs.Dialogs.ClientLayer;

interface

uses ARLibs.Dialogs.Interfaces, ARLibs.Dialogs.CoreClasses;

var Dialog: IDialog;

procedure Inject( ANewClass: TDialogClass );

implementation

uses SysUtils;

procedure Inject( ANewClass: TDialogClass );
var NewObject: TDialog;
begin
  // Dispose the previous implementation.
  Dialog := nil;
  NewObject := ANewClass.Create;
  Dialog := ( NewObject as IDialog );
end;

initialization
begin
  Dialog := TDialog.Create as IDialog;
end;

finalization
begin
  Dialog := nil;
end;

end.
