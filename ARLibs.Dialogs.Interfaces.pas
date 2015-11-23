unit ARLibs.Dialogs.Interfaces;

interface

Type

  // This is the base, container interface.
  // Since dialogs can come in many different shapes and forms (quite literally),
  // it is just better to leave it empty and only fill it whenever the time comes.
  IDialog = interface
  ['{A61678D3-2992-44A1-9618-A70B6F02D455}']

  end;

  // The only common thing to ALL delphi dialog is the message.
  // I have also included the help context because I am sure that
  // someone, somewhere, at some point will want JUST THAT and curse me
  // because it's not there and he/she has to add it him/herself.
  // Because this is meant to be a flexyble library, I want to leave out as
  // much as possible.
  // You might be wondering why there's no way to display a dialog in here:
  // this is because this is an intermediate interface and not one you would use
  // directly. Think about it: a Delphi dialog could be a confirmation (which
  // needs to be a function because of a boolean result) or a simple notification
  // (which needs to be a procedure because it doesn't return anything).
  // This means we'd have to have two overloads where one would always be
  // incorrect to call! Nice, eh?
  IDelphiDialog = interface( IDialog )
  ['{72D14018-6EFA-46CD-AAA2-F864518AF71F}']
    function GetMessage: String;
    procedure SetMessage( Value : String );

    function GetHelpContext : Integer;
    procedure SetHelpContext( Value : Integer );

    function GetShowHelpButton: Boolean;
    procedure SetShowHelpButton( Value: Boolean );

    property Message: String read GetMessage write SetMessage;
    property HelpContext : Integer read GetHelpContext write SetHelpContext;
    property ShowHelpButton : Boolean read GetShowHelpButton write SetShowHelpButton;
  end;

  // This type stems from the need to exclude mtConfirm which requires at
  // least 2 buttons. Plus, those buttons may vary and be either Ok and Cancel or
  // Yes and No according to context. This, instead, is a simple dialog with an ok
  // button.
  TOkDialogType = (odtInformation, odtWarning, odtError );
  IOKDialog = interface( IDelphiDialog )
  ['{E9FBA352-CEA4-4C90-B4A6-713E1650D57F}']
    function GetOkDialogType: TOkDialogType;
    procedure SetOkDialogType( Value : TOkDialogType );

    procedure ShowDialog;

    property OkDialogType : TOkDialogType read GetOkDialogType write SetOkDialogType;
  end;

  TConfirmButtonPair = ( cbpOkCancel,cbpYesNo );
  IConfirmDialog = interface( IDelphiDialog )
  ['{6F4D0EB8-5CE8-4869-8770-186DD77AE432}']
    function GetConfirmButtonPair: TConfirmButtonPair;
    procedure SetConfirmButtonPair( Value: TConfirmButtonPair );

    function GetTrueIsOkOrYes : Boolean;
    procedure SetTrueIsOkOrYes( Value: Boolean );

    // As usual, we are after functionality here: unlike the Ok Dialog where all we
    // need is to SHOW the dialog, here we need to know if there has been a
    // confirmation or not. Obviously, showing the dialog is part of this, but
    // really, what we need is the knowledge.
    function Confirmed: Boolean;

    property ButtonPair : TConfirmButtonPair read GetConfirmButtonPair write SetConfirmButtonPair;
    // The reasoning here is quite simple: because you can only have one set of two
    // buttons active (ok, three if you need to include the help button), the
    // evaluation to true can only really have two values PER dialog type.
    // Hence, if it's not one must be the other. This is why I am using a
    // boolean instead of an enumeration. By the way, this will default to true
    // because, really, that's what you want 99% of the time.
    property TrueIsOkOrYes : Boolean read GetTrueIsOkOrYes write SetTrueIsOkOrYes;
  end;

  // This is another marker interface. While it does not implement any specific
  // methods (again, you have to remember that I am trying to be as general as
  // possible), its implementation will make a number of things easier.
  ICustomDialog = interface
  ['{989E9A6F-DD5D-48BB-AEC1-2009D052F873}']
  end;

implementation

end.
