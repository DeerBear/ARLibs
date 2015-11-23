unit ARLibs.Dialogs.Demo.Interfaces.CustomDialog;

interface

uses ARLibs.Dialogs.Interfaces;

Type

  IMyDialog = interface( ICustomDialog )
  ['{06B75556-16C3-42DC-BACD-E99D8ACB6A6A}']
    procedure Display;
  end;

implementation

end.
