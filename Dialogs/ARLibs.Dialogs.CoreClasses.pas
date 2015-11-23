unit ARLibs.Dialogs.CoreClasses;

interface

uses Classes, Forms, System.UITypes,ARLibs.Dialogs.Interfaces;

Type
  // The great thing about this class is that we do NOT need to
  // implement all interfaces, just the ones we want to expose.
  // This is the the thing with interfaces: you define one with a
  // certain scope in mind, but that does NOT mean you need to expose it.
  // IDialog is implemented because that's the interface that will be
  // exposed to the world.
  TDialog = class( TInterfacedObject, IDialog, IOKDialog,IConfirmDialog )
  private
    FOkDialog : IOKDialog;
    FConfirmDialog : IConfirmDialog;
    function GetOkDialog: IOKDialog;
    function GetConfirmDialog: IConfirmDialog;
  public
    constructor Create;reintroduce;virtual;
    destructor Destroy; override;

    property OkDialog: IOKDialog read GetOkDialog implements IOkDialog;
    property ConfirmDialog: IConfirmDialog read GetConfirmDialog implements IConfirmDialog;
  end;

  TDialogClass = class of TDialog;

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
    FShowHelpButton : Boolean;
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
    // This is useful when/if you need a help context, as it will be used to
    // allow the display of the help when the property is set
    function HasHelpContext: Boolean;
    function GetShowHelpButton: Boolean;
    procedure SetShowHelpButton(Value: Boolean);
    // The properties you should be using in place of the methods.
    property HelpContext : Integer read GetHelpContext write SetHelpContext;
    property Message: String read GetMessage write SetMessage;
    property ShowHelpButton : Boolean read GetShowHelpButton write SetShowHelpButton;
  public
    constructor Create(const Controller: IInterface); override;
  end;

  TDialogPosition = ( dpMainFormCentre, dpOwnerFormCentre,dpDesktopCentre,dpScreenCentre );
  // Because this is about custom dialogs, I can't just "assume" you'll want it in a
  // specific way, so I need a really base class which will simply define
  // handy methods to do the most common things and then leave you free to have it
  // your way on everything else. I also considered referencing TCustomForm
  // instead of TForm, but my thought was that it's unlikely you'd have your own
  // TCustomForm descendant.
  TBaseCustomDialog = class( TAggregateDialog, ICustomDialog )
  strict private
    FForm: TForm;
  strict protected
    procedure CreateForm;virtual;abstract;
    // To keep things separated (and because I can't know what you'll want to do
    // with it...) passing the actual form field as variable seems the best thing to do.
    procedure DestroyForm( var AForm : TForm );virtual;abstract;
    // You create the form in the way you want in the CreateForm call,
    // then, inside that, you call SetForm to assign to the private field.
    procedure SetForm( AForm : TForm );
    function GetForm: TForm;
    // Please note: your code might be much more convoluted than
    // setting the Borders property to bsDialog, this is why it's
    // abstract.
    procedure MakeDialogBorders;virtual;abstract;
    procedure SetPosition( Where : TDialogPosition );virtual;abstract;
    property Form: TForm read GetForm;
  public
    destructor Destroy; override;
  end;

implementation

uses ARLibs.Dialogs.OkDialog, ARLibs.Dialogs.ConfirmDialog;

{ TDialog }

constructor TDialog.Create;
begin
  inherited Create;
  FOkDialog := TOkDialog.Create( Self );

  FConfirmDialog := TConfirmDialog.Create( Self );
end;

destructor TDialog.Destroy;
begin
  FOkDialog := nil;
  inherited;
end;

function TDialog.GetConfirmDialog: IConfirmDialog;
begin
  Result := FConfirmDialog;
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

constructor TDelphiDialog.Create(const Controller: IInterface);
begin
  inherited;
  // If we have a help context, we certainly want to show the help button.
  // Because the Getter for this property ensures there IS a valid help context,
  // it is ok to have this to true.
  FShowHelpButton := True;
end;

function TDelphiDialog.GetHelpContext: Integer;
begin
  Result := FHelpContext;
end;

function TDelphiDialog.GetMessage: string;
begin
  Result := FMessage;
end;

function TDelphiDialog.GetShowHelpButton: Boolean;
begin
  // This is a bit different because I wanted to
  // simplify the code a bit and, really, the help
  // button should NOT be displayed if a help context is
  // missing.
  Result := HasHelpContext and FShowHelpButton;
end;

function TDelphiDialog.HasHelpContext: Boolean;
begin
  Result := HelpContext > 0;
end;

procedure TDelphiDialog.SetHelpContext(Value: Integer);
begin
  FHelpContext := Value;
end;

procedure TDelphiDialog.SetMessage(Value: string);
begin
  FMessage := Value;
end;

procedure TDelphiDialog.SetShowHelpButton(Value: Boolean);
begin
  FShowHelpButton := Value;
end;

{ TBaseCustomDialog }

destructor TBaseCustomDialog.Destroy;
begin
  DestroyForm( FForm );
  inherited;
end;

function TBaseCustomDialog.GetForm: TForm;
begin
  Result := FForm;
end;

procedure TBaseCustomDialog.SetForm(AForm: TForm);
begin
  FForm := AForm;
end;

end.
