unit EQGrid4RLMain;

{$I ..\cxVer.inc}

interface

uses
  Windows, Messages, SysUtils{$IFDEF DELPHI6}, Variants{$ENDIF}, Classes, Controls,
  Forms, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit,
  cxEditRepositoryItems, cxGridTableView,  ActnList, ImgList,
  Menus, cxGridLevel, cxGridCustomTableView, cxClasses, Dialogs,
  cxControls, cxGridCustomView, cxGrid, ComCtrls, StdCtrls, ShellAPI,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  dxPScxGrid6Lnk, cxDataStorage, ToolWin;

type
  TEQGrid4RLMainForm = class(TForm)
    mmMain: TMainMenu;
    miHelp: TMenuItem;
    miDeveloperExpressontheweb: TMenuItem;
    miForum: TMenuItem;
    miDownloads: TMenuItem;
    miProducts: TMenuItem;
    ilMain: TImageList;
    sty: TActionList;
    actProducts: TAction;
    actDownloads: TAction;
    actForum: TAction;
    actDXOnTheWeb: TAction;
    miFile: TMenuItem;
    miOptions: TMenuItem;
    miExit: TMenuItem;
    actExit: TAction;
    sbMain: TStatusBar;
    actShowDemoDescription: TAction;
    miShowDemoDescription: TMenuItem;
    actGridNativeStyle: TAction;
    cxGrid: TcxGrid;
    miGridLookFeel: TMenuItem;
    miKind: TMenuItem;
    miFlat: TMenuItem;
    miStandard: TMenuItem;
    miUltraFlat: TMenuItem;
    miNativeStyle: TMenuItem;
    miSeparator2: TMenuItem;
    StyleRepository: TcxStyleRepository;
    tvssDevExpress: TcxGridTableViewStyleSheet;
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
    cxStyle14: TcxStyle;
    lvPlanets: TcxGridLevel;
    tvPlanets: TcxGridTableView;
    lbDescrip: TLabel;
    tvPlanetsNAME: TcxGridColumn;
    tvPlanetsNO: TcxGridColumn;
    tvPlanetsORBITS: TcxGridColumn;
    tvPlanetsDISTANCE: TcxGridColumn;
    tvPlanetsPERIOD: TcxGridColumn;
    tvPlanetsDISCOVERER: TcxGridColumn;
    tvPlanetsDATE: TcxGridColumn;
    tvPlanetsRADIUS: TcxGridColumn;
    edrepMain: TcxEditRepository;
    edrepCenterText: TcxEditRepositoryTextItem;
    edrepRightText: TcxEditRepositoryTextItem;
    dxComponentPrinter: TdxComponentPrinter;
    dxComponentPrinterLink: TdxGridReportLink;
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
    procedure AlwaysEnabled(Sender: TObject);
    procedure actProductsExecute(Sender: TObject);
    procedure actDownloadsExecute(Sender: TObject);
    procedure actForumExecute(Sender: TObject);
    procedure actDXOnTheWebExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actShowDemoDescriptionExecute(Sender: TObject);
    procedure actGridNativeStyleExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  EQGrid4RLMainForm: TEQGrid4RLMainForm;

implementation

uses
  cxLookAndFeels;

{$R *.dfm}

procedure TEQGrid4RLMainForm.AlwaysEnabled(Sender: TObject);
begin
  TCustomAction(Sender).Enabled := True;
end;

procedure TEQGrid4RLMainForm.actProductsExecute(Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar('http://www.devexpress.com/products/index.asp'), nil, nil, SW_SHOWMAXIMIZED);
end;

procedure TEQGrid4RLMainForm.actDownloadsExecute(Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar('http://www.devexpress.com/downloads/index.asp'), nil, nil, SW_SHOWMAXIMIZED);
end;

procedure TEQGrid4RLMainForm.actForumExecute(Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar('http://24.234.251.34/dxforum/dxforumisapi.dll/'), nil, nil, SW_SHOWMAXIMIZED);
end;

procedure TEQGrid4RLMainForm.actDXOnTheWebExecute(
  Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar('http://www.devexpress.com/index.shtm'), nil, nil, SW_SHOWMAXIMIZED);
end;

procedure TEQGrid4RLMainForm.actExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TEQGrid4RLMainForm.actShowDemoDescriptionExecute(
  Sender: TObject);
begin
  lbDescrip.Visible := not lbDescrip.Visible;
  TCustomAction(Sender).Checked := not TCustomAction(Sender).Checked;
end;

procedure TEQGrid4RLMainForm.actGridNativeStyleExecute(Sender: TObject);
begin
  cxGrid.LookAndFeel.NativeStyle := not cxGrid.LookAndFeel.NativeStyle;
  TCustomAction(Sender).Checked := cxGrid.LookAndFeel.NativeStyle; 
end;

procedure TEQGrid4RLMainForm.FormShow(Sender: TObject);
begin
  tvPlanets.DataController.Groups.FullExpand;
end;


procedure TEQGrid4RLMainForm.FormCreate(Sender: TObject);
begin
  CustomizeColumns;
  LoadData;
end;


procedure TEQGrid4RLMainForm.CustomizeColumns;
const
  cDistance = 3;
  cPeriod = 4;
  cRadius = 7;
var
  I: Integer;
begin
  DecimalSeparator := '.';
  with tvPlanets do
  for I := 0 to ColumnCount - 1 do
    if I in [cDistance, cRadius] then
      Columns[I].DataBinding.ValueTypeClass := TcxIntegerValueType
    else
      if I in [cPeriod] then
      Columns[I].DataBinding.ValueTypeClass := TcxFloatValueType
      else
       Columns[I].DataBinding.ValueTypeClass := TcxStringValueType;
end;

procedure TEQGrid4RLMainForm.LoadData;
const
  AFileName = 'nineplanets.txt';
  AHeaderLineCount = 2;

var
  ARecords, AValues: TStringList;
  I: Integer;

  procedure InitRecord(const Str: string);
  var
    J: Integer;
    V: Variant;
  begin
    AValues.CommaText := Str;
    for J := 0 to AValues.Count - 1 do
     if AValues.Strings[J] <> '-' then
     begin
      V := AValues.Strings[J];
      if not VarIsNull(V) then
      begin
        if tvPlanets.Columns[J].DataBinding.ValueTypeClass = TcxFloatValueType then
          V := StrToFloat(V);
        tvPlanets.DataController.Values[I, J] := V;
      end;
     end;
  end;

begin
  if not FileExists(AFileName) then
    raise Exception.Create('Data file not found');

  ARecords := TStringList.Create;
  AValues := TStringList.Create;

  with ARecords do
  try
    LoadFromFile(AFileName);
    tvPlanets.BeginUpdate;
    tvPlanets.DataController.RecordCount := Count - AHeaderLineCount;
    for I := 0 to Count - (AHeaderLineCount + 1) do
      InitRecord(Strings[I + AHeaderLineCount]);
  finally
    tvPlanets.EndUpdate;
    ARecords.Free;
    AValues.Free;
  end;
end;

procedure TEQGrid4RLMainForm.miUltraFlatClick(Sender: TObject);
begin
  cxGrid.LookAndFeel.Kind := lfUltraFlat;
  TMenuItem(Sender).Checked := True;
end;

procedure TEQGrid4RLMainForm.miStandardClick(Sender: TObject);
begin
  cxGrid.LookAndFeel.Kind := lfStandard;
  TMenuItem(Sender).Checked := True;
end;

procedure TEQGrid4RLMainForm.miFlatClick(Sender: TObject);
begin
  cxGrid.LookAndFeel.Kind := lfFlat;
  TMenuItem(Sender).Checked := True;
end;

procedure TEQGrid4RLMainForm.actPageSetupExecute(Sender: TObject);
begin
  dxComponentPrinter.PageSetup(nil);
end;

procedure TEQGrid4RLMainForm.actPreviewExecute(Sender: TObject);
begin
  dxComponentPrinter.Preview(True,nil);
end;

procedure TEQGrid4RLMainForm.actPrintExecute(Sender: TObject);
begin
  dxComponentPrinter.Print(True,nil,nil);
end;

procedure TEQGrid4RLMainForm.actDesignerExecute(Sender: TObject);
begin
  dxComponentPrinter.DesignReport(nil);
end;

procedure TEQGrid4RLMainForm.actFullExpandExecute(Sender: TObject);
begin
  tvPlanets.DataController.Groups.FullExpand;
end;

procedure TEQGrid4RLMainForm.actFullCollapseExecute(Sender: TObject);
begin
  tvPlanets.DataController.Groups.FullCollapse;
end;

end.
