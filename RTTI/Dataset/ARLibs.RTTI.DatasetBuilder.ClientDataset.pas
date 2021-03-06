unit ARLibs.RTTI.DatasetBuilder.ClientDataset;

interface

uses Classes, DB, DBClient, ARLibs.RTTI.DatasetBuilder, ARLibs.RTTI.Interfaces;

Type

  TCDSDatasetBuilder = class( TDatasetBuilder<TClientDataSet> )
  strict private
  strict protected
    function NewFieldDef: TFieldDef;override;
    procedure CreateDataset;override;
    function GetDatasetFields: TFields;override;
    procedure InitDataset( var ADataset: TClientDataSet );override;
    procedure ProcessField( AField: TField;PropertyData: IRttiProperty );override;
    function SupportsPrimaryKey: Boolean;override;
    procedure AddPrimaryKeyFlag( AFieldDef: TFieldDef );override;
    function SupportsUniqueValues: Boolean;override;
    procedure AddUniqueValuesFlag( AFieldDef: TFieldDef );override;
  public
    constructor Create;override;
    destructor Destroy; override;
  end;

implementation

uses ARLibs.RTTI.DatasetBuilder.Attributes;

{ TCDSDatasetBuilder }

procedure TCDSDatasetBuilder.AddPrimaryKeyFlag(AFieldDef: TFieldDef);
begin
  inherited;
// Empty because unsupported.
end;

procedure TCDSDatasetBuilder.AddUniqueValuesFlag(AFieldDef: TFieldDef);
begin
  inherited;
// Empty because unsupported.
end;

constructor TCDSDatasetBuilder.Create;
begin
  inherited;
end;

procedure TCDSDatasetBuilder.CreateDataset;
begin
  inherited;
  GetDataset.CreateDataSet;
end;

destructor TCDSDatasetBuilder.Destroy;
begin
  inherited;
end;

function TCDSDatasetBuilder.GetDatasetFields: TFields;
begin
  Result := Dataset.Fields;
end;

procedure TCDSDatasetBuilder.InitDataset(var ADataset: TClientDataSet);
begin
  inherited;
  ADataset := TClientDataSet.Create( Nil );
end;

function TCDSDatasetBuilder.NewFieldDef: TFieldDef;
begin
  Result := Dataset.FieldDefs.AddFieldDef;
end;

procedure TCDSDatasetBuilder.ProcessField(AField: TField;
  PropertyData: IRttiProperty);
var Display: DisplayAttribute;
begin
  inherited;
  if PropertyData.AttributeExists( 'Display' ) then
  begin
    Display := DisplayAttribute( PropertyData.Attribute[ 'Display' ] );
    if Display.Visible then
      AField.DisplayLabel := Display.ColumnLabel;
    AField.Visible := Display.Visible;
  end;
end;

function TCDSDatasetBuilder.SupportsPrimaryKey: Boolean;
begin
  Result := False;
end;

function TCDSDatasetBuilder.SupportsUniqueValues: Boolean;
begin
  Result := False;
end;

end.
