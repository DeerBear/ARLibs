unit ARLibs.Dialogs.BaseClasses;

interface

uses Classes, System.UITypes,ARLibs.Dialogs.Interfaces;

Type
  // The great thing about this class is that we do NOT need to
  // implement all interfaces, just the ones we want to expose.
  // This is the the thing with interfaces: you define one with a
  // certain scope in mind, but that does NOT mean you need to expose it.
  // IDialog is implemented because that's the interface that will be
  // exposed to the world.
  TDialog = class( TInterfacedObject, IDialog, IOKDialog )
  private
    FOkDialog : IOKDialog;
    function GetOkDialog: IOKDialog;
  public
    constructor Create;
    property OkDialog: IOKDialog read GetOkDialog implements IOkDialog;
  end;

  // Right now there's no common interface to ALL dialogs.
  TAggregateDialog = class( TAggregatedObject )
  public
    // A virtual constructor is needed to allow integration with
    // custom and "unforeseen" dialogs.
    constructor Create( const Controller: IInterface ) ;reintroduce;virtual;
  end;

  // Here things get interesting: Delphi dialogs, in this library's world-view, ARE-A
  // TAggregateDialog, so the class inherits and implements an interface.
  TDelphiDialog = class( TAggregateDialog, IDelphiDialog )
  strict private
    FHelpContext : Integer;
    FMessage: String;
  strict protected
    // No need to make these virtual or dynamic: they are already encapsulating the
    // concepts quite well. However, we need them protected because they have to
    // be visible to descendents.
    function GetHelpContext: Integer;
    function GetMessage: string;
    procedure SetHelpContext(Value: Integer);
    procedure SetMessage(Value: string);
    // This will be used polymorphically.
    function GetMsgDlgType : TMsgDlgType;virtual;abstract;
    // The properties you should be using in place of the methods.
    property HelpContext : Integer read GetHelpContext write SetHelpContext;
    property Message: String read GetMessage write SetMessage;
  end;

implementation

{ TDialog }

constructor TDialog.Create;
begin

end;

function TDialog.GetOkDialog: IOKDialog;
begin
  Result := FOkDialog;
end;

{ TAggregateDialog }

constructor TAggregateDialog.Create( const Controller: IInterface );
begin
  inherited Create( Controller );
end;

{ TDelphiDialog }

function TDelphiDialog.GetHelpContext: Integer;
begin
  Result := FHelpContext;
end;

function TDelphiDialog.GetMessage: string;
begin
  Result := FMessage;
end;

procedure TDelphiDialog.SetHelpContext(Value: Integer);
begin
  FHelpContext := Value;
end;

procedure TDelphiDialog.SetMessage(Value: string);
begin
  FMessage := Value;
end;

end.
