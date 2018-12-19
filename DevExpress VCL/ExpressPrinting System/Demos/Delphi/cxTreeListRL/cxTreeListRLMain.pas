unit cxTreeListRLMain;

{$I ..\cxVer.inc}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Controls, Forms, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, ActnList, ImgList, Menus,
  cxClasses, Dialogs, cxControls, ComCtrls, StdCtrls, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, cxDataStorage, ToolWin, cxTL, cxTextEdit,
  dxPScxCommon, dxPScxTL5Lnk, cxInplaceContainer, cxLookAndFeels, cxEditRepositoryItems;

type
  TcxTreeListRLMainForm = class(TForm)
    mmMain: TMainMenu;
    miHelp: TMenuItem;
    miDeveloperExpressontheweb: TMenuItem;
    ilMain: TImageList;
    sty: TActionList;
    actDXOnTheWeb: TAction;
    miFile: TMenuItem;
    miOptions: TMenuItem;
    miExit: TMenuItem;
    actExit: TAction;
    sbMain: TStatusBar;
    actShowDemoDescription: TAction;
    miShowDemoDescription: TMenuItem;
    actNativeStyle: TAction;
    miLookFeel: TMenuItem;
    miKind: TMenuItem;
    miFlat: TMenuItem;
    miStandard: TMenuItem;
    miUltraFlat: TMenuItem;
    miNativeStyle: TMenuItem;
    miSeparator2: TMenuItem;
    lbDescrip: TLabel;
    dxComponentPrinter: TdxComponentPrinter;
    ToolBar1: TToolBar;
    tbtnPageSetup: TToolButton;
    tbtnPreview: TToolButton;
    tbtnPrint: TToolButton;
    tbtnDesigner: TToolButton;
    N1: TMenuItem;
    miPirntingOptions: TMenuItem;
    N2: TMenuItem;
    Print1: TMenuItem;
    miPrintPreview: TMenuItem;
    miPageSetup: TMenuItem;
    actPageSetup: TAction;
    actPreview: TAction;
    actPrint: TAction;
    actDesigner: TAction;
    N3: TMenuItem;
    miFullExpand: TMenuItem;
    miFullCollapsing: TMenuItem;
    actFullExpand: TAction;
    actFullCollapse: TAction;
    ToolButton1: TToolButton;
    tbtnFullCollapse: TToolButton;
    tbtnFullExpand: TToolButton;
    tlPlanets: TcxTreeList;
    clName: TcxTreeListColumn;
    clOrbitNumb: TcxTreeListColumn;
    clOrbits: TcxTreeListColumn;
    clDistance: TcxTreeListColumn;
    clPeriod: TcxTreeListColumn;
    clDiscoverer: TcxTreeListColumn;
    clDate: TcxTreeListColumn;
    clRadius: TcxTreeListColumn;
    clImageIndex: TcxTreeListColumn;
    dxComponentPrinterLink1: TcxTreeListReportLink;
    ilPlanets: TImageList;
    edrepMain: TcxEditRepository;
    edrepCenterText: TcxEditRepositoryTextItem;
    edrepRightText: TcxEditRepositoryTextItem;
    StyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    stlGroupNode: TcxStyle;
    stlFixedBand: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    procedure AlwaysEnabled(Sender: TObject);
    procedure actDXOnTheWebExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actShowDemoDescriptionExecute(Sender: TObject);
    procedure actNativeStyleExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miUltraFlatClick(Sender: TObject);
    procedure miStandardClick(Sender: TObject);
    procedure miFlatClick(Sender: TObject);
    procedure actPageSetupExecute(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actDesignerExecute(Sender: TObject);
    procedure actFullExpandExecute(Sender: TObject);
    procedure actFullCollapseExecute(Sender: TObject);
  private
    procedure CustomizeColumns;
    procedure LoadData;
  end;

var
  cxTreeListRLMainForm: TcxTreeListRLMainForm;

implementation

uses
  ShellApi;

{$R *.dfm}

procedure TcxTreeListRLMainForm.AlwaysEnabled(Sender: TObject);
begin
  TCustomAction(Sender).Enabled := True;
end;

procedure TcxTreeListRLMainForm.actDXOnTheWebExecute(
  Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar('http://www.devexpress.com/index.shtm'), nil, nil, SW_SHOWMAXIMIZED);
end;

procedure TcxTreeListRLMainForm.actExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TcxTreeListRLMainForm.actShowDemoDescriptionExecute(
  Sender: TObject);
begin
  lbDescrip.Visible := not lbDescrip.Visible;
  TCustomAction(Sender).Checked := not TCustomAction(Sender).Checked;
end;

procedure TcxTreeListRLMainForm.actNativeStyleExecute(Sender: TObject);
begin
  tlPlanets.LookAndFeel.NativeStyle := not tlPlanets.LookAndFeel.NativeStyle;
  TCustomAction(Sender).Checked := tlPlanets.LookAndFeel.NativeStyle; 
end;

procedure TcxTreeListRLMainForm.FormCreate(Sender: TObject);
begin
  CustomizeColumns;
  LoadData;
  tlPlanets.FullCollapse;
  tlPlanets.Root[0].Expanded := True;
end;

procedure TcxTreeListRLMainForm.miUltraFlatClick(Sender: TObject);
begin
  tlPlanets.LookAndFeel.Kind := lfUltraFlat;
  TMenuItem(Sender).Checked := True;
end;

procedure TcxTreeListRLMainForm.miStandardClick(Sender: TObject);
begin
  tlPlanets.LookAndFeel.Kind := lfStandard;
  TMenuItem(Sender).Checked := True;
end;

procedure TcxTreeListRLMainForm.miFlatClick(Sender: TObject);
begin
  tlPlanets.LookAndFeel.Kind := lfFlat;
  TMenuItem(Sender).Checked := True;
end;

procedure TcxTreeListRLMainForm.actPageSetupExecute(Sender: TObject);
begin
  dxComponentPrinter.PageSetup(nil);
end;

procedure TcxTreeListRLMainForm.actPreviewExecute(Sender: TObject);
begin
  dxComponentPrinter.Preview(True,nil);
end;

procedure TcxTreeListRLMainForm.actPrintExecute(Sender: TObject);
begin
  dxComponentPrinter.Print(True, nil, nil);
end;

procedure TcxTreeListRLMainForm.actDesignerExecute(Sender: TObject);
begin
  dxComponentPrinter.DesignReport(nil);
end;

procedure TcxTreeListRLMainForm.actFullExpandExecute(Sender: TObject);
begin
  tlPlanets.FullExpand;
end;

procedure TcxTreeListRLMainForm.actFullCollapseExecute(Sender: TObject);
begin
  tlPlanets.FullCollapse;
end;

procedure TcxTreeListRLMainForm.CustomizeColumns;
const
  cDistance = 3;
  cPeriod = 4;
  cRadius = 7;
  cImageIndex = 8;
var
  I: Integer;
begin
  with tlPlanets do
  for I := 0 to ColumnCount - 1 do
    if I in [cDistance, cRadius, cImageIndex] then
      Columns[I].DataBinding.ValueTypeClass := TcxIntegerValueType
    else
      if I in [cPeriod] then
      Columns[I].DataBinding.ValueTypeClass := TcxFloatValueType
      else
       Columns[I].DataBinding.ValueTypeClass := TcxStringValueType;
end;

procedure TcxTreeListRLMainForm.LoadData;
const
  AFileName = 'nineplanets.txt';
  AHeaderLineCount = 2;
  AParentKeyField = 2;
  AKeyField = 0;
  AImageField = 8;

var
  ARecords, AValues: TStringList;
  I: Integer;

  function AddNode(AParentNode: TcxTreeListNode;
    const ARecord: string): TcxTreeListNode;
  var
    S1: string;
    J: Integer;
    V: Variant;
  begin
    Result := AParentNode.AddChild;
    AValues.CommaText := ARecord;
    for J := 0 to AValues.Count - 1 do
      if AValues.Strings[J] <> '-' then
      begin
        S1 := AValues.Strings[J];
        if Pos('.', S1) <> 0 then
          S1[Pos('.', S1)] := DecimalSeparator;
        V := S1;
        if not VarIsNull(V) then
          Result.Values[J] := V;
      end;
    Result.ImageIndex :=  Result.Values[AImageField];
    Result.SelectedIndex := Result.Values[AImageField];
  end;

  procedure AddNodes(AParentNode: TcxTreeListNode;
     const AParentKeyValue: string);
     function GetFieldValue(ARecord: string; AFieldIndex: Integer): string;
     begin
       AValues.CommaText := ARecord;
       Result := AValues.Strings[AFieldIndex];
     end;
  var
    J: Integer;
    ANode: TcxTreeListNode;
  begin
    for J := 0 to ARecords.Count - 1 do
      if GetFieldValue(ARecords.Strings[J], AParentKeyField) = AParentKeyValue then
      begin
        ANode := AddNode(AParentNode, ARecords.Strings[J]);
        AddNodes(ANode, GetFieldValue(ARecords.Strings[J], AKeyField));
      end;
  end;

begin
  if not FileExists(AFileName) then
    raise Exception.Create('Data file not found');

  ARecords := TStringList.Create;
  AValues := TStringList.Create;

  tlPlanets.BeginUpdate;
  with ARecords do
    try
      LoadFromFile(AFileName);
      for I := 0 to AHeaderLineCount - 1 do
        Delete(0);
      AddNodes(tlPlanets.Root, '-');
    finally
      tlPlanets.EndUpdate;
      ARecords.Free;
      AValues.Free;
    end;
end;

end.
