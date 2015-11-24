unit MainCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, SynEdit,
  SynEditHighlighter, SynHighlighterPas, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TMainFrm = class(TForm)
    txtInterfaceName: TLabeledEdit;
    pnlTop: TPanel;
    grpProperties: TGroupBox;
    grpGeneratedInterface: TGroupBox;
    pnlBottom: TPanel;
    GenerateBtn: TButton;
    CloseBtn: TButton;
    txtGeneratedInterface: TSynEdit;
    PascalSyntax: TSynPasSyn;
    grdProperties: TDBGrid;
    procedure CloseBtnClick(Sender: TObject);
    procedure GenerateBtnClick(Sender: TObject);
  private
    function GetInterfaceName: String;
    { Private declarations }
  public
    { Public declarations }
    property InterfaceName: String read GetInterfaceName;
  end;

var
  MainFrm: TMainFrm;

implementation

uses DMain;

{$R *.dfm}

{ TMainFrm }

procedure TMainFrm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TMainFrm.GenerateBtnClick(Sender: TObject);
var PropertyLines: TStringList;
    PropertyLine: String;
begin
  // This is needed so that we can iterate the properties only once.
  // Because the actual property declarations must be at the bottom,
  // using this list allows us to add them immediately after we've finished
  // processing the methods.
  PropertyLines := TStringList.Create;
  txtGeneratedInterface.Lines.BeginUpdate;
  txtGeneratedInterface.Lines.Clear;
  // First of all, the prologue!
  txtGeneratedInterface.Lines.Add( DMMain.GenerateInterfacePrologue );
  // Now, we need to iterate all properties, one by one, adding the methods and
  // then, further down the line, the properties.
  DMMain.FirstProperty;
  repeat
    txtGeneratedInterface.Lines.Add( DMMain.GenerateHeaderCommentForGetterAndSetter );
    txtGeneratedInterface.Lines.Add( DMMain.GenerateGetterMetod );
    txtGeneratedInterface.Lines.Add( DMMain.GenerateSetterMethod );
    // Save the property line declaration
    PropertyLines.Add( DMMain.GeneratePropertyLine );
  until Not DMMain.Next ;
  for PropertyLine in PropertyLines do
  begin
    txtGeneratedInterface.Lines.Add( PropertyLine );
  end;
  txtGeneratedInterface.Lines.Add( 'end;' );
  txtGeneratedInterface.Lines.EndUpdate;
end;

function TMainFrm.GetInterfaceName: String;
begin
  Result := 'I'+txtInterfaceName.Text;
end;

end.
