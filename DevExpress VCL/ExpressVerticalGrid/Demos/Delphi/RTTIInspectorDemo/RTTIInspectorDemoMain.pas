unit RTTIInspectorDemoMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, DemoBasicMain, cxLookAndFeels, ActnList, ImgList, Menus,
  StdCtrls, ComCtrls, cxVGrid, cxControls, cxInplaceContainer, cxOI,
  cxClasses, cxStyles, RTTIInspectorDemoVGEditor, cxGraphics, cxEdit,
  cxCalc, cxExportVGLink, cxDBVGrid, ExtCtrls, cxLookAndFeelPainters;

type
  TRTTIInspectorDemoMainForm = class(TDemoBasicMainForm)
    actVGEdit: TAction;
    VerticalEdit1: TMenuItem;
    PopupMenu: TPopupMenu;
    VerticalGridEdit1: TMenuItem;
    VerticalGridLayoutEditor1: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    actExportVGToHTML: TAction;
    actExportVGToExcel: TAction;
    N1: TMenuItem;
    ExportToExcel1: TMenuItem;
    ExportToHTML1: TMenuItem;
    N2: TMenuItem;
    cxVerticalGridStyleSheetDevExpress: TcxVerticalGridStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxDBVerticalGrid: TcxDBVerticalGrid;
    ImageList: TImageList;
    Splitter1: TSplitter;
    cxDBVerticalGridID: TcxDBEditorRow;
    cxDBVerticalGridCustomerID: TcxDBEditorRow;
    cxDBVerticalGridProductID: TcxDBEditorRow;
    cxDBVerticalGridPurchaseDate: TcxDBEditorRow;
    cxDBVerticalGridPaymentType: TcxDBEditorRow;
    cxDBVerticalGridTime: TcxDBEditorRow;
    cxDBVerticalGridPaymentAmount: TcxDBEditorRow;
    cxDBVerticalGridDescription: TcxDBEditorRow;
    cxDBVerticalGridQuantity: TcxDBEditorRow;
    cxDBVerticalGridCustomerEmail: TcxDBEditorRow;
    actShowCustomize: TAction;
    Aboutthisdemo1: TMenuItem;
    Panel1: TPanel;
    cxRTTIInspector: TcxRTTIInspector;
    lbInspectedObject: TLabel;
    procedure actVGEditExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxRTTIInspectorPropertyChanged(Sender: TObject);
    procedure cxVerticalGridClick(Sender: TObject);
    procedure actExportVGToHTMLExecute(Sender: TObject);
    procedure actExportVGToExcelExecute(Sender: TObject);
    procedure cxDBVerticalGridLayoutChanged(Sender: TObject);
    procedure actShowCustomizeExecute(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
  private
    FSelectedObjectEvent: TNotifyEvent;
    procedure ObjectSelected(Sender: TObject);
    procedure UpdateLabel(AObject: TComponent);
  end;

var
  RTTIInspectorDemoMainForm: TRTTIInspectorDemoMainForm;

implementation

uses DemoBasicAbout, DemoRating, ShellAPI, RTTIInspectorDemoData;

{$R *.dfm}

procedure TRTTIInspectorDemoMainForm.actVGEditExecute(Sender: TObject);
begin
  GetVerticalGridEditor(cxDBVerticalGrid, FSelectedObjectEvent).Show;
end;

procedure TRTTIInspectorDemoMainForm.FormCreate(Sender: TObject);
begin
  inherited;
  FSelectedObjectEvent := ObjectSelected;
  ObjectSelected(cxDBVerticalGrid);
end;

procedure TRTTIInspectorDemoMainForm.ObjectSelected(Sender: TObject);
begin
  cxRTTIInspector.InspectedObject := TPersistent(Sender);
  UpdateLabel(TComponent(Sender));
end;

procedure TRTTIInspectorDemoMainForm.cxRTTIInspectorPropertyChanged(
  Sender: TObject);
begin
  if TcxEditorRow(TcxRTTIInspector(Sender).FocusedRow).Properties.Caption = 'Name' then
    GetVerticalGridEditor(cxDBVerticalGrid, FSelectedObjectEvent).DoItemsModified;
end;

procedure TRTTIInspectorDemoMainForm.cxVerticalGridClick(Sender: TObject);
begin
  ObjectSelected(Sender);
end;

procedure TRTTIInspectorDemoMainForm.actExportVGToHTMLExecute(Sender: TObject);
begin
  cxExportVGToHTML('temp.html', cxDBVerticalGrid, False);
  OpenWebPage('temp.html');
end;

procedure TRTTIInspectorDemoMainForm.actExportVGToExcelExecute(
  Sender: TObject);
begin
  cxExportVGToExcel('temp.xls', cxDBVerticalGrid, False);
  ShellExecute(Handle, 'OPEN', 'temp.xls', nil, nil, SW_SHOWMAXIMIZED);
end;

procedure TRTTIInspectorDemoMainForm.cxDBVerticalGridLayoutChanged(
  Sender: TObject);
begin
  GetVerticalGridEditor(cxDBVerticalGrid, FSelectedObjectEvent).DoItemsModified;
end;

procedure TRTTIInspectorDemoMainForm.actShowCustomizeExecute(Sender: TObject);
begin
  cxDBVerticalGrid.Customizing.Visible := True;
end;

procedure TRTTIInspectorDemoMainForm.UpdateLabel(AObject: TComponent);
begin
  if AObject <> nil then
    lbInspectedObject.Caption := Format('%s: %s', [AObject.Name, AObject.ClassName])
  else
    lbInspectedObject.Caption := '<not selected>';
end;

procedure TRTTIInspectorDemoMainForm.actAboutExecute(Sender: TObject);
begin
  ShowAbout(False, True);
end;

initialization
  cxRegisterPropertyEditor(TypeInfo(string), TcxCustomEditorRowProperties, 'EditPropertiesClassName', nil);
end.
