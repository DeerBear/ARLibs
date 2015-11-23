unit ARLibs.Dialogs.Implementations;

interface

uses Classes, ARLibs.Dialogs.Interfaces;

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
    property OkDialog: IOKDialog read GetOkDialog;
  end;

  // Right now there's no common interface to ALL dialogs.
  TAggregateDialog = class( TAggregatedObject )
  public
    // A virtual constructor is needed to allow integration with
    // custom and "unforeseen" dialogs.
    constructor Create;reintroduce;virtual;
  end;

implementation

{ TDialog }

function TDialog.GetOkDialog: IOKDialog;
begin
  Result := FOkDialog;
end;

{ TAggregateDialog }

constructor TAggregateDialog.Create;
begin
  inherited Create;
end;

end.
