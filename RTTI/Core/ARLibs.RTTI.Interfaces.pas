unit ARLibs.RTTI.Interfaces;

interface

uses Classes;

Type

  IRttiProperty = interface
  ['{99001448-8B5F-4EB2-8C8C-D7E546324E15}']
    function GetType : TTypeKind;

    function GetAttribute( Index: String ) : TCustomAttribute;
    function AttributeExists( AName: String ) : Boolean;
    function GetTypeName: String;

    property Attribute[ Index : String ] : TCustomAttribute read GetAttribute;
    property TypeName: String read GetTypeName;
  end;

  TRttiPropertyFunc = reference to function( AName: String;AProperty: IRttiProperty ): Boolean;
  TRttiPropertyProc = reference to procedure( AName: String;AProperty: IRttiProperty );

  IRttiPropertyHandler = interface
  ['{D621471A-C1A1-41E6-8A26-8D912DA79FD3}']
    function GetProperty( Index : String ) : IRttiProperty;
    function GetPropertyCount : Integer;

    procedure Examine( AClass: TClass );
    procedure FillPropertyNames( var NameList: TStringList );
    // If you need to prcess all properties, simply pass a function with the correct
    // parameters that returns true
    procedure ForEach( AProc: TRttiPropertyProc;IncludeFunc: TRttiPropertyFunc );

    property RttiProperty[ Index : String ] : IRttiProperty read GetProperty;
    property PropertyCount: Integer read GetPropertyCount;
  end;

// Here, have one on me.
function AlwaysInclude( AName: String;AProperty: IRttiProperty ) : Boolean;

implementation

function AlwaysInclude( AName: String;AProperty: IRttiProperty ) : Boolean;
begin
  Result := True;
end;

end.
