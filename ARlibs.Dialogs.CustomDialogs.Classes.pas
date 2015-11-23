unit ARlibs.Dialogs.CustomDialogs.Classes;

interface

uses Forms, ARLibs.Dialogs.Interfaces, ARLibs.Dialogs.CoreClasses,
     Generics.Collections, Generics.Defaults;

Type

  TDefaultCustomDialog = class( TBaseCustomDialog )
  strict private
    FPositionTable : TDictionary<TDialogPosition,TPosition>;
  strict protected
    // This simply sets the Borders property to bsDialog.
    procedure MakeDialogBorders; override;
    // Gives you a simple way to translate across the positions.
    procedure SetPosition(Where: TDialogPosition); override;
    procedure AddPositionMatch( ADlgPosition : TDialogPosition;AFormPosition : TPosition );
    function GetFormPositionFromDialogPosition( DlgPosition : TDialogPosition ) : TPosition;
  public
    constructor Create(const Controller: IInterface); override;
    destructor Destroy; override;
  end;

implementation

{ TDefaultCustomDialog }

procedure TDefaultCustomDialog.AddPositionMatch(ADlgPosition: TDialogPosition;
  AFormPosition: TPosition);
begin
  FPositionTable.Add( ADlgPosition,AFormPosition);
end;

constructor TDefaultCustomDialog.Create(const Controller: IInterface);
begin
  inherited;
  FPositionTable := TDictionary<TDialogPosition,TPosition>.Create;
  // The other values really aren't needed.
  AddPositionMatch( dpMainFormCentre,poMainFormCenter );
  AddPositionMatch( dpOwnerFormCentre,poOwnerFormCenter );
  AddPositionMatch( dpDesktopCentre,poDesktopCenter );
  AddPositionMatch( dpScreenCentre,poScreenCenter );
  CreateForm;
end;

destructor TDefaultCustomDialog.Destroy;
begin
  FPositionTable.Free;
  inherited;
end;

function TDefaultCustomDialog.GetFormPositionFromDialogPosition(
  DlgPosition: TDialogPosition): TPosition;
begin
  Result := FPositionTable.Items[ DlgPosition ];
end;

procedure TDefaultCustomDialog.MakeDialogBorders;
begin
  inherited;
  GetForm.BorderStyle := bsDialog;
end;

procedure TDefaultCustomDialog.SetPosition(Where: TDialogPosition);
begin
  inherited;
  GetForm.Position := GetFormPositionFromDialogPosition( Where );
end;

end.
