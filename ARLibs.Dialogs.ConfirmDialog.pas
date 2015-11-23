unit ARLibs.Dialogs.ConfirmDialog;

interface

uses Controls, Dialogs, ARLibs.Dialogs.Interfaces, ARLibs.Dialogs.CoreClasses,
     Generics.Collections, Generics.Defaults;

Type
  TModalResultsArray = array[ Boolean ] of TModalResult;

  TButtonPairButtonsArray = array[ TConfirmButtonPair ] of TMsgDlgButtons;

  TConfirmDialog = class( TDelphiDialog,IConfirmDialog )
  strict private
    FConfirmButtonPair : TConfirmButtonPair;
    FTrueIsOkOrYes : Boolean;
    FConfirmModalResults : TDictionary<TConfirmButtonPair,TModalResultsArray>;
  strict protected
    function Confirmed: Boolean;
    function GetConfirmButtonPair: TConfirmButtonPair;
    procedure SetConfirmButtonPair(Value: TConfirmButtonPair);
    function GetTrueIsOkOrYes: Boolean;
    procedure SetTrueIsOkOrYes(Value: Boolean);
    function GetDialogButtons : TMsgDlgButtons;
    function GetModalResultForTrue: TModalResult;
    function GetMsgDlgType: TMsgDlgType; override;

    property ButtonPair : TConfirmButtonPair read GetConfirmButtonPair write SetConfirmButtonPair;
    property TrueIsOkOrYes : Boolean read GetTrueIsOkOrYes write SetTrueIsOkOrYes;
    property DialogButtons : TMsgDlgButtons read GetDialogButtons;
    property ModalResultForTrue : TModalResult read GetModalResultForTrue;
  public
    constructor Create(const Controller: IInterface); override;
  end;

implementation

uses System.UITypes;

// Why are we not doing the same thing for the buttons as we are for the modal result?
// Essentially, because this is easier to read as a whole in the code where it is used.
// While the same enumeration in the other case is used to identify ONE value,
// these are between two and three values, so it becomes unintuitive to use
// boolean flags as it were done in the other case.
const ButtonPairsNoHelp : TButtonPairButtonsArray = ( [mbOK,mbCancel],[mbYes,mbNo] );
      ButtonPairsWithHelp : TButtonPairButtonsArray = ( [mbOK,mbCancel,mbHelp],[mbYes,mbNo,mbHelp] );
      OkCancelModalResults : TModalResultsArray = ( mrCancel,mrOk );
      YesNoModalResults : TModalResultsArray = ( mrNo,mrYes );

{ TConfirmDialog }

function TConfirmDialog.Confirmed: Boolean;
begin
  Result := MessageDlg( Message,GetMsgDlgType,GetDialogButtons,HelpContext ) = ModalResultForTrue;
end;

constructor TConfirmDialog.Create(const Controller: IInterface);
begin
  inherited;
  FTrueIsOkOrYes := True;
  FConfirmButtonPair := cbpYesNo;
  FConfirmModalResults := TDictionary<TConfirmButtonPair,TModalResultsArray>.Create;
  // Because we don't really need to manage this and it's unlikely that it's going to be
  // extended, we put everything in here.
  FConfirmModalResults.Add( cbpOkCancel,OkCancelModalResults );
  FConfirmModalResults.Add( cbpYesNo,YesNoModalResults );
end;

function TConfirmDialog.GetConfirmButtonPair: TConfirmButtonPair;
begin
  Result := FConfirmButtonPair;
end;

function TConfirmDialog.GetDialogButtons: TMsgDlgButtons;
var ButtonPairToUse: TButtonPairButtonsArray;
begin
  if ShowHelpButton then
    ButtonPairToUse := ButtonPairsWithHelp
  else
    ButtonPairToUse := ButtonPairsNoHelp;
  Result := ButtonPairToUse[ ButtonPair ];
  if HasHelpContext then
    Include( Result,mbHelp );
end;

function TConfirmDialog.GetModalResultForTrue: TModalResult;
begin
  Result := FConfirmModalResults.Items[ GetConfirmButtonPair ][ TrueIsOkOrYes ];
end;

function TConfirmDialog.GetMsgDlgType: TMsgDlgType;
begin
  Result := mtConfirmation;
end;

function TConfirmDialog.GetTrueIsOkOrYes: Boolean;
begin
  Result := FTrueIsOkOrYes;
end;

procedure TConfirmDialog.SetConfirmButtonPair(Value: TConfirmButtonPair);
begin
  FConfirmButtonPair := Value;
end;

procedure TConfirmDialog.SetTrueIsOkOrYes(Value: Boolean);
begin
  FTrueIsOkOrYes := Value;
end;

end.
