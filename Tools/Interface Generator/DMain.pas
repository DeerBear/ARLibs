unit DMain;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDMMain = class(TDataModule)
    fdmPropertyTypeList: TFDMemTable;
    fdmPropertyTypeListID: TAutoIncField;
    fdmPropertyTypeListTYPE_STRING: TWideStringField;
    fdmProperties: TFDMemTable;
    fdmPropertiesID: TAutoIncField;
    fdmPropertiesPROPERTY_NAME: TWideStringField;
    fdmPropertiesPROPERTY_TYPE_ID: TIntegerField;
    fdmPropertiesPROPERTY_TYPE: TWideStringField;
    DSProperties: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    function GetPropertyName: String;
    function GetPropertyType: String;
    { Private declarations }
  protected
    procedure AddPropertyType( ATypeName: String );
    procedure AddPropertyTypes;

    property PropertyName : String read GetPropertyName;
    property PropertyType : String read GetPropertyType;
  public
    { Public declarations }
    procedure FirstProperty;
    function Next: Boolean;
    // Name and GUID are generated here.
    function GenerateInterfacePrologue : String;
    function GeneratePropertyGetter: String;
    function GeneratePropertySetter: String;
    function GenerateGetterMetod: String;
    function GenerateSetterMethod: String;
    function GeneratePropertyLine: String;
    function GenerateHeaderCommentForGetterAndSetter: String;
  end;

var
  DMMain: TDMMain;

implementation

uses MainCode;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMMain.AddPropertyType(ATypeName: String);
begin
  fdmPropertyTypeList.Append;
  fdmPropertyTypeList.FieldByName( 'TYPE_STRING' ).AsWideString := ATypeName;
  fdmPropertyTypeList.Post;
end;

procedure TDMMain.AddPropertyTypes;
begin
  AddPropertyType('integer');
  AddPropertyType('string');
  AddPropertyType('TDateTime');
  AddPropertyType('Boolean');
end;

procedure TDMMain.DataModuleCreate(Sender: TObject);
begin
  fdmPropertyTypeList.Open;
  fdmProperties.Open;
  AddPropertyTypes;
end;

procedure TDMMain.DataModuleDestroy(Sender: TObject);
begin
  fdmProperties.Close;
  fdmPropertyTypeList.Close;
end;

procedure TDMMain.FirstProperty;
begin
  fdmProperties.First;
end;

function TDMMain.GenerateGetterMetod: String;
begin
  Result := '  function '+GeneratePropertyGetter+' : '+PropertyType;
end;

function TDMMain.GenerateHeaderCommentForGetterAndSetter: String;
begin
  Result := '  //Getter and Setter for property '+PropertyName;
end;

function TDMMain.GenerateInterfacePrologue: String;
begin
  Result := MainFrm.InterfaceName + ' = interface';
end;

function TDMMain.GeneratePropertyGetter: String;
begin
  Result := 'Get'+PropertyName;
end;

function TDMMain.GeneratePropertyLine: String;
begin
  Result := '  property '+PropertyName+' read '+GeneratePropertyGetter + ' write '+GeneratePropertySetter;
end;

function TDMMain.GeneratePropertySetter: String;
begin
  Result := 'Set'+PropertyName;
end;

function TDMMain.GenerateSetterMethod: String;
begin
  Result := '  procedure '+GeneratePropertySetter+'( Value: '+PropertyType+' );';
end;

function TDMMain.GetPropertyName: String;
begin
  Result := fdmProperties.FieldByName( 'PROPERTY_NAME' ).AsWideString;
end;

function TDMMain.GetPropertyType: String;
begin
  Result := fdmProperties.FieldByName( 'PROPERTY_TYPE' ).AsWideString;
end;

function TDMMain.Next: Boolean;
begin
  fdmProperties.Next;
  Result := Not fdmProperties.Eof;
end;

end.
