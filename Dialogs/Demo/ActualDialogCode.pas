unit ActualDialogCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDialogCode, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TActualDialogFrm = class(TBaseDialogFrm)
    DialogMessage: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ActualDialogFrm: TActualDialogFrm;

implementation

{$R *.dfm}

end.
