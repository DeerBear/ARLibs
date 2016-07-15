{
  Usage: Simply override GetDatasource to map it onto your datasource.
  Reason: Many people will argue that you should not be dong this. And
          they would be right in principle. Alas, production code has a way of
          being stubbornly difficult to overhaul without causing harm :)
          Hence, something like this would help transition from a dataset-based
          approach to a slightly more insulated one.
}

unit ARLibs.Dialogs.Base.Data.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ARLibs.Dialogs.Base.Form, DB;

type
  TARBaseDialogDataForm = class(TARBaseDialogForm)
  private
    function GetDataset: TDataset;
    { Private declarations }
  strict protected
    // Map the needed datasource to the form.
    function GetDataSource: TDataSource;virtual;abstract;

    property DataSource : TDataSource read GetDataSource;
    property Dataset : TDataset read GetDataset;
  public
    { Public declarations }
  end;

var
  ARBaseDialogDataForm: TARBaseDialogDataForm;

implementation

{$R *.dfm}

{ TARBaseDialogDataForm }

function TARBaseDialogDataForm.GetDataset: TDataset;
begin
  Result := DataSource.DataSet;
end;

end.
