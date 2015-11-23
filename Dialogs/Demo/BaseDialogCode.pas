unit BaseDialogCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TBaseDialogFrm = class(TForm)
    pnlStatus: TFlowPanel;
    OkBtn: TButton;
    CancelBtn: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaseDialogFrm: TBaseDialogFrm;

implementation

{$R *.dfm}

end.
