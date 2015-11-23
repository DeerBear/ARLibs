unit ARLibs.Dialogs.Demo.CustomDialog;

interface

uses Forms, ARLibs.Dialogs.Interfaces, ARLibs.Dialogs.CoreClasses,
     ARLibs.Dialogs.CustomDialogs.Classes, ARLibs.Dialogs.Demo.Interfaces.CustomDialog;

Type

  TMyCustomDialog = class( TDefaultCustomDialog, IMyDialog )
  strict protected
    procedure CreateForm; override;
    procedure Display;
    procedure DestroyForm(var AForm: TForm); override;
  public
  end;

  TMyDialog = class( TDialog,IMyDialog )
  private
    FMyCustomDialog: IMyDialog;
    function GetCustomDialog: IMyDialog;
  public
    constructor Create; override;

    property CustomDialog : IMyDialog read GetCustomDialog implements IMyDialog;
  end;

implementation

uses ActualDialogCode;

{ TMyDialog }

constructor TMyDialog.Create;
begin
  inherited;
  FMyCustomDialog := TMyCustomDialog.Create( Self );
end;

function TMyDialog.GetCustomDialog: IMyDialog;
begin
  Result := FMyCustomDialog;
end;

{ TMyCustomDialog }

procedure TMyCustomDialog.CreateForm;
begin
  inherited;
  SetForm( TActualDialogFrm.Create( Application ) );
  MakeDialogBorders;
  SetPosition( dpDesktopCentre );
end;

procedure TMyCustomDialog.DestroyForm(var AForm: TForm);
begin
  inherited;
end;

procedure TMyCustomDialog.Display;
begin
  Form.ShowModal;
end;

end.
