unit ARLibs.Dialogs.OKDialog;

interface

uses Classes, System.UITypes, ARLibs.Dialogs.Interfaces, ARLibs.Dialogs.CoreClasses,
     Generics.Collections, Generics.Defaults, Dialogs;

Type

  TOkDialog = class( TDelphiDialog, IOKDialog )
  strict private
    // This will help us translate from TOkDialogType to TMsgDlgType.
    // If, in the future, someone would like to add more vales, all he/she
    // has to do is to add values to TOkDialogType and register them.
    FDialogMap : TDictionary<TOkDialogType,TMsgDlgType>;
    FOkDialogType : TOkDialogType;
  strict protected
    function GetMsgDlgType: TMsgDlgType; override;
    function GetOkDialogType: TOkDialogType;
    procedure SetOkDialogType(Value: TOkDialogType);
    procedure RegisterNewOKDialogType( OkDlgType : TOkDialogType;MsgDlgType : TMsgDlgType );
    procedure ShowDialog;dynamic;
  public
    constructor Create(const Controller: IInterface); override;
    destructor Destroy; override;
  end;

implementation

{ TOkDialog }

constructor TOkDialog.Create(const Controller: IInterface);
begin
  inherited;
  FDialogMap := TDictionary<TOkDialogType,TMsgDlgType>.Create;
  RegisterNewOKDialogType( odtInformation,mtInformation );
  RegisterNewOKDialogType( odtWarning,mtWarning );
  RegisterNewOKDialogType( odtError,mtError );
end;

destructor TOkDialog.Destroy;
begin
  FDialogMap.Free;
  inherited;
end;

function TOkDialog.GetMsgDlgType: TMsgDlgType;
begin
  Result := FDialogMap.Items[ GetOkDialogType ];
end;

function TOkDialog.GetOkDialogType: TOkDialogType;
begin
  Result := FOkDialogType;
end;

procedure TOkDialog.RegisterNewOKDialogType(OkDlgType: TOkDialogType;
  MsgDlgType: TMsgDlgType);
begin
  FDialogMap.Add( OkDlgType,MsgDlgType );
end;

procedure TOkDialog.SetOkDialogType(Value: TOkDialogType);
begin
  FOkDialogType := Value;
end;

procedure TOkDialog.ShowDialog;
var Buttons : TMsgDlgButtons;
begin
  if ShowHelpButton then
    Buttons := [mbOK,mbHelp]
  else
    Buttons := [mbOK];
  MessageDlg( Message,GetMsgDlgType,Buttons,HelpContext );
end;

end.
