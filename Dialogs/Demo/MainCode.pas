unit MainCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMainFrm = class(TForm)
    OKDialogBtn: TButton;
    ConfirmDialogBtn: TButton;
    CustomDialogNoInjectionBtn: TButton;
    CustomDialogWithInjectionBtn: TButton;
    procedure OKDialogBtnClick(Sender: TObject);
    procedure ConfirmDialogBtnClick(Sender: TObject);
    procedure CustomDialogNoInjectionBtnClick(Sender: TObject);
    procedure CustomDialogWithInjectionBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainFrm: TMainFrm;

implementation

// These are all the units you need. Really. Obviously, the
// others must be available too, either in the search path or
// added to the project.
uses ARLibs.Dialogs.ClientLayer, ARLibs.Dialogs.Interfaces,
     ARLibs.Dialogs.Demo.Interfaces.CustomDialog,
     ARLibs.Dialogs.Demo.CustomDialog;

{$R *.dfm}

procedure TMainFrm.ConfirmDialogBtnClick(Sender: TObject);
var ConfirmDialog : IConfirmDialog;
    OkDialog : IOKDialog; // Yeah, you can actually do this
begin
  ConfirmDialog := ( Dialog as IConfirmDialog );
  OkDialog := ( Dialog as IOKDialog );
  ConfirmDialog.ButtonPair := cbpOkCancel;
  ConfirmDialog.Message := 'Confirm this very useful action?';
  //ConfirmDialog.HelpContext := 1;
  OkDialog.Message := 'Confirmed'; // Yeah, this works too :D Cool eh?
  if ConfirmDialog.Confirmed then
  begin
    OkDialog.OkDialogType := odtInformation;
    OkDialog.ShowDialog;
  end;
end;

procedure TMainFrm.CustomDialogNoInjectionBtnClick(Sender: TObject);
var CustomDialog : IMyDialog;
begin
  CustomDialog := ( Dialog as IMyDialog );
  CustomDialog.Display;
end;

procedure TMainFrm.CustomDialogWithInjectionBtnClick(Sender: TObject);
var CustomDialog : IMyDialog;
begin
  // This line replaces the default implementation with a new one.
  // Please note that everything will still work.
  Inject( TMyDialog );
  CustomDialog := ( Dialog as IMyDialog );
  CustomDialog.Display;
end;

procedure TMainFrm.OKDialogBtnClick(Sender: TObject);
var OkDialog: IOKDialog;
begin
  OkDialog := ( Dialog as IOKDialog );
  OkDialog.OkDialogType := odtInformation;
  OkDialog.Message := 'This is a test';
  // Uncomment this line to see the help button make an appearence.
  //OkDialog.HelpContext := 1;
  OkDialog.ShowDialog;
end;

end.
