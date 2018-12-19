unit InspectorRLMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, dxCntner, dxInspct, Grids, DBGrids, Db, DBTables,
  dxInspRw, ComCtrls, Buttons, DBCtrls, dxDBInsp, dxDBInRw, Menus,
  dxPSCore, dxPSdxInsLnk, dxPSdxDBInsLnk, dxPSGlbl, dxPSUtl, dxPSEngn,
  {dxPSPrVwAdv,} // enable for use of ExpressBars in PrintPreview
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, ImgList, dxExEdtr, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxCore, cxDrawTextUtils;

type             
  TInspectorRLMainForm = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Panel4: TPanel;
    ImageList: TImageList;
    GroupBox1: TGroupBox;
    chbColumnSizing: TCheckBox;
    chbEditing: TCheckBox;
    chbTabs: TCheckBox;
    chbTabThrough: TCheckBox;
    chbAutoWidth: TCheckBox;
    chbCancelOnExit: TCheckBox;
    Label1: TLabel;
    edMinColumnWidth: TEdit;
    UpDown1: TUpDown;
    rgPaintStyle: TRadioGroup;
    BColor: TButton;
    BFont: TButton;
    FontDialog: TFontDialog;
    ColorDialog: TColorDialog;
    BGridColor: TButton;
    chbDragDrop: TCheckBox;
    chbCustomDraw: TCheckBox;
    Image1: TImage;
    dsContacts: TDataSource;
    tProducts: TTable;
    tProductsID: TIntegerField;
    tProductsNAME: TStringField;
    tProductsDescription: TStringField;
    dxDBInspector: TdxDBInspector;
    dxDBInspectorFirstName: TdxInspectorDBMaskRow;
    dxDBInspectorLastName: TdxInspectorDBMaskRow;
    dxDBInspectorCompany: TdxInspectorDBMaskRow;
    dxDBInspectorPrefix: TdxInspectorDBMaskRow;
    dxDBInspectorTitle: TdxInspectorDBMaskRow;
    dxDBInspectorAddress: TdxInspectorDBMaskRow;
    dxDBInspectorCity: TdxInspectorDBMaskRow;
    dxDBInspectorZipCode: TdxInspectorDBMaskRow;
    dxDBInspectorSource: TdxInspectorDBMaskRow;
    dxDBInspectorPurchaseDate: TdxInspectorDBDateRow;
    dxDBInspectorHomePhone: TdxInspectorDBMaskRow;
    dxDBInspectorFaxPhone: TdxInspectorDBMaskRow;
    dxDBInspectorSpouse: TdxInspectorDBMaskRow;
    dxDBInspectorOccupation: TdxInspectorDBMaskRow;
    dxDBInspectorDescription: TdxInspectorBlobRow;
    dxDBInspectorproduct: TdxInspectorLookupRow;
    dxDBInspectorCustName: TdxInspectorDBRow;
    dxDBInspectorImage: TdxInspectorBlobRow;
    DBNavigator1: TDBNavigator;
    chbFlat: TCheckBox;
    chbEnterThrough: TCheckBox;
    dxDBInspectorRow23: TdxInspectorDBButtonRow;
    dxDBInspectorCustomer: TdxInspectorDBCheckRow;
    dxDBInspectorPaymentType: TdxInspectorDBImageRow;
    dxDBInspectorPaymentAmount: TdxInspectorDBCalcRow;
    dxDBInspectorState: TdxInspectorDBPickRow;
    chbNoCancel: TCheckBox;
    chbDrawEndEllipsis: TCheckBox;
    tContacts: TTable;
    tContactsID: TAutoIncField;
    tContactsProductID: TIntegerField;
    tContactsFirstName: TStringField;
    tContactsLastName: TStringField;
    tContactsCompany: TStringField;
    tContactsPrefix: TStringField;
    tContactsTitle: TStringField;
    tContactsAddress: TStringField;
    tContactsCity: TStringField;
    tContactsState: TStringField;
    tContactsZipCode: TStringField;
    tContactsSource: TStringField;
    tContactsCustomer: TStringField;
    tContactsPurchaseDate: TDateField;
    tContactsHomePhone: TStringField;
    tContactsFaxPhone: TStringField;
    tContactsPaymentType: TStringField;
    tContactsSpouse: TStringField;
    tContactsOccupation: TStringField;
    tContactsPaymentAmount: TBCDField;
    tContactsDescription: TMemoField;
    tContactsproduct: TStringField;
    tContactsCustName: TStringField;
    chbShowRowHint: TCheckBox;
    tContactsPicture: TGraphicField;
    tContactsCurrency: TCurrencyField;
    tContactsTime: TTimeField;
    tContactsHyperLink: TStringField;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxDBInspectorReportLink;
    BDesign: TSpeedButton;
    BPreview: TSpeedButton;
    BPrint: TSpeedButton;
    procedure dxDBInspectorRow23EditButtonClick(Sender: TObject);
    procedure chbColumnSizingClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgPaintStyleClick(Sender: TObject);
    procedure edMinColumnWidthKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UpDown1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure BColorClick(Sender: TObject);
    procedure BFontClick(Sender: TObject);
    procedure BGridColorClick(Sender: TObject);
    procedure dxDBInspectorDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dxDBInspectorDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure chbDragDropClick(Sender: TObject);
    procedure Image1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Image1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dxDBInspectorDrawCaption(Sender: TdxInspectorRow;
      ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
      var AColor: TColor; var ADone: Boolean);
    procedure chbCustomDrawClick(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure chbFlatClick(Sender: TObject);
    procedure chbShowRowHintClick(Sender: TObject);
    procedure tContactsCalcFields(DataSet: TDataSet);
    procedure BDesignClick(Sender: TObject);
    procedure BPreviewClick(Sender: TObject);
    procedure BPrintClick(Sender: TObject);
    procedure dxComponentPrinter1Link1CustomDrawCaption(
      Sender: TBasedxReportLink; ARow: TdxInspectorRow; ACanvas: TCanvas;
      ABoundsRect, AClientRect: TRect; var AText: String;
      var AColor: TColor; AFont: TFont; var ATextAlignX: TcxTextAlignX;
      var ATextAlignY: TcxTextAlignY; var ADone: Boolean);
  private
    FlagLoading: Boolean;
    procedure CustomDraw(Sender: TdxInspectorRow; var AColor: TColor; AFont: TFont);
  public
    { Public declarations }
  end;

var
  InspectorRLMainForm: TInspectorRLMainForm;

implementation

uses InspectorRLDialog;

{$R *.DFM}

procedure TInspectorRLMainForm.dxDBInspectorRow23EditButtonClick(Sender: TObject);
begin
  InspectorRLDialogForm := TInspectorRLDialogForm.Create(nil);
  try
    InspectorRLDialogForm.ShowModal;
  finally
    InspectorRLDialogForm.Free;
  end;
end;

procedure TInspectorRLMainForm.FormCreate(Sender: TObject);
begin
  tProducts.DataBaseName := ExtractFilePath(Application.ExeName) + '..\..\Data\';
  tProducts.Open;
  tContacts.DataBaseName := tProducts.DataBaseName;
  tContacts.Open;
  // check boxes
  FlagLoading := True;
  try
    chbColumnSizing.Checked := dioColumnSizing in dxDBInspector.Options;
    chbEditing.Checked := dioEditing in dxDBInspector.Options;
    chbTabs.Checked := dioTabs in dxDBInspector.Options;
    chbTabThrough.Checked := dioTabThrough in dxDBInspector.Options;
    chbAutoWidth.Checked := dioAutoWidth in dxDBInspector.Options;
    chbCancelOnExit.Checked := dioCancelOnExit in dxDBInspector.Options;
    chbEnterThrough.Checked := dioEnterThrough in dxDBInspector.Options;
    chbNoCancel.Checked := dioNoCancel in dxDBInspector.Options;
    chbDrawEndEllipsis.Checked := dioDrawEndEllipsis in dxDBInspector.Options;
  finally
     FlagLoading := False;
  end;
  // other
  rgPaintStyle.ItemIndex := Integer(dxDBInspector.PaintStyle);
  UpDown1.Position := dxDBInspector.MinColumnWidth;
  Image1.ControlStyle := Image1.ControlStyle + [csDisplayDragImage];
  chbShowRowHint.Checked := dxDBInspector.ShowRowHint;
end;

procedure TInspectorRLMainForm.chbColumnSizingClick(Sender: TObject);
begin
  if FlagLoading then Exit;
  // Change Options
  if TCheckBox(Sender).Checked then
    dxDBInspector.Options := dxDBInspector.Options + [TdxDBInspectorOption(TabOrder - chbColumnSizing.TabOrder)]
  else
    dxDBInspector.Options := dxDBInspector.Options - [TdxDBInspectorOption(TabOrder - chbColumnSizing.TabOrder)];
end;

procedure TInspectorRLMainForm.rgPaintStyleClick(Sender: TObject);
begin
  dxDBInspector.PaintStyle := TdxInspectorPaintStyle(rgPaintStyle.ItemIndex);
end;

procedure TInspectorRLMainForm.edMinColumnWidthKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  b: Boolean;
begin
  case Key of
  VK_RETURN: UpDown1Changing(nil, b);
  VK_ESCAPE: edMinColumnWidth.Text := IntToStr(dxDBInspector.MinColumnWidth);
  end;
end;

procedure TInspectorRLMainForm.UpDown1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  UpDown1.OnChanging := nil;
  dxDBInspector.MinColumnWidth := StrToInt(edMinColumnWidth.Text);
  UpDown1.Position := dxDBInspector.MinColumnWidth;
  edMinColumnWidth.Text := IntToStr(dxDBInspector.MinColumnWidth);
  UpDown1.OnChanging := UpDown1Changing;
end;

procedure TInspectorRLMainForm.BColorClick(Sender: TObject);
begin
   if ColorDialog.Execute then
     dxDBInspector.Color := ColorDialog.Color;
end;

procedure TInspectorRLMainForm.BFontClick(Sender: TObject);
begin
  if FontDialog.Execute then
    dxDBInspector.Font.Assign(FontDialog.Font);
end;

procedure TInspectorRLMainForm.BGridColorClick(Sender: TObject);
begin
   if ColorDialog.Execute then
     dxDBInspector.GridColor := ColorDialog.Color;
end;

procedure TInspectorRLMainForm.dxDBInspectorDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  hTest : TdxInspectorHitTest;
begin
  if Source = dxDBInspector then
  begin
    Accept:= True;
    if dxDBInspector.DragNode = nil then
    begin
      Accept:= False;
      Exit;
    end;
    hTest := dxDBInspector.GetHitTestInfoAt(X, Y);
    case hTest of
      ihtIndent, ihtButton, ihtDisplayLabel : dxDBInspector.DragCursor := 1;
      ihtLabel, ihtColumnEdge : dxDBInspector.DragCursor := 2;
      ihtNowhere : dxDBInspector.DragCursor := 3;
    end;
  end
  else
    Accept:= False;
end;

procedure TInspectorRLMainForm.dxDBInspectorDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  AItem, AnItem: TdxInspectorNode;
  AttachMode: TdxInspectorNodeAttachMode;
  HT: TdxInspectorHitTest;
begin
  if Source = dxDBInspector then
  with dxDBInspector do
  begin
    HT := GetHitTestInfoAt(X, Y);
    AnItem := GetNodeAt(X, Y);
    if HT in [ihtNowhere, ihtColumnEdge, ihtIndent, ihtButton, ihtLabel, ihtDisplayLabel] then
    begin
      AttachMode := inaAddChild;
      if HT in [ihtLabel] then
        AttachMode := inaAddChild
      else if HT = ihtNowhere then
      begin
        AnItem := Items[0];
        AttachMode := inaAdd;
      end
      else
        if HT in [ihtIndent, ihtButton, ihtDisplayLabel] then AttachMode := inaInsert;
      AItem := DragNode;
      // move rows in DBInspector
      if (AItem <> nil) and (AnItem <> nil) then
      begin
        AItem.MoveTo(AnItem, AttachMode);
      end;
    end;
  end;
end;

procedure TInspectorRLMainForm.chbDragDropClick(Sender: TObject);
begin
  with (SEnder as TCheckBox) do
  if Checked then
    dxDBInspector.DragMode := dmAutomatic
  else dxDBInspector.DragMode := dmManual;
end;

procedure TInspectorRLMainForm.Image1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := True;
  dxDBInspector.DragCursor := 4;
end;

procedure TInspectorRLMainForm.Image1DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  if Source = dxDBInspector then
  with dxDBInspector do
  begin
    if DragNode <> nil then
      DragNode.Free;
  end;
end;

procedure TInspectorRLMainForm.dxDBInspectorDrawCaption(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  CustomDraw(Sender, AColor, AFont);
end;

procedure TInspectorRLMainForm.chbCustomDrawClick(Sender: TObject);
begin
  dxDBInspector.Refresh;
end;

procedure TInspectorRLMainForm.DBGrid1ColEnter(Sender: TObject);
begin
  dxDBInspector.FocusedField := DBGrid1.SelectedField;
end;

procedure TInspectorRLMainForm.chbFlatClick(Sender: TObject);
begin
  dxDBInspector.Flat := not dxDBInspector.Flat;
end;

procedure TInspectorRLMainForm.chbShowRowHintClick(Sender: TObject);
begin
  dxDBInspector.ShowRowHint := chbShowRowHint.Checked;
end;

procedure TInspectorRLMainForm.tContactsCalcFields(DataSet: TDataSet);
begin
 tcontactsCustName.Value :=  tcontactsFirstName.Value + ' ' + tcontactsLastName.Value;
end;

procedure TInspectorRLMainForm.BDesignClick(Sender: TObject);
begin
  dxComponentPrinter1.DesignReport(nil);
end;

procedure TInspectorRLMainForm.BPreviewClick(Sender: TObject);
begin
  dxComponentPrinter1.Preview(True, nil);
end;

procedure TInspectorRLMainForm.BPrintClick(Sender: TObject);
begin
  dxComponentPrinter1.Print(True, nil, nil);
end;

procedure TInspectorRLMainForm.dxComponentPrinter1Link1CustomDrawCaption(
  Sender: TBasedxReportLink; ARow: TdxInspectorRow; ACanvas: TCanvas;
  ABoundsRect, AClientRect: TRect; var AText: String; var AColor: TColor;
  AFont: TFont; var ATextAlignX: TcxTextAlignX;
  var ATextAlignY: TcxTextAlignY; var ADone: Boolean);
begin
  CustomDraw(ARow, AColor, AFont);
end;

procedure TInspectorRLMainForm.CustomDraw(Sender: TdxInspectorRow; var AColor: TColor; AFont: TFont);
begin
  if not chbCustomDraw.Checked then Exit;
  if Sender.Node.Count > 0 then
  begin
    AFont.Style := [fsBold];
    if Sender.Node.Focused then
      AFont.Color := clBlue;
    AColor := clAqua;
  end
  else
  if Sender.Node.Parent <> nil then
  begin
    AFont.Style := [fsItalic];
    AColor := clLime;
    if Sender.Node.Focused then
      AFont.Color := clBlue;
  end
  else
    if Sender.Node.Focused then
    if (dxDBInspector.PaintStyle <> ipsSimple) then
      AFont.Color := clNavy;
end;


initialization
  Screen.Cursors[1] := LoadCursor(HInstance, 'DRAG_INSERT');
  Screen.Cursors[2] := LoadCursor(HInstance, 'DRAG_ADDCHILD');
  Screen.Cursors[3] := LoadCursor(HInstance, 'DRAG_ADD');
  Screen.Cursors[4] := LoadCursor(HInstance, 'DRAG_KILL');

end.
