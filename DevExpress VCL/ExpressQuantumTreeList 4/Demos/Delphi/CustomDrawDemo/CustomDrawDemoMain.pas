unit CustomDrawDemoMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  cxStyles, cxTL, cxMaskEdit, cxCurrencyEdit, cxMemo, cxCheckBox, Menus,
  cxLookAndFeels, ActnList, ImgList, cxInplaceContainer, cxDBTL,
  cxControls, cxTLData, ComCtrls, StdCtrls, DemoBasicMain,
  cxDBLookupComboBox, cxEdit, cxEditRepositoryItems, Grids, DBGrids, cxGraphics,
  CustomDrawDemoConsts, cxContainer, cxTextEdit, cxCustomData;

type
  TcxItemCustomDrawInfo = class;

  TcxCustomDrawInfo = class
  private
    FBitmaps: TList;
    FDefaultFont: TFont;
    FCustomDrawData: TList;
    FOwnerDrawText: Boolean;
    function GetBkBitmap(ABkImage: TBkImage): TBitmap;
    function GetCount: Integer;
    function GetItem(ADrawArea: TCustomDrawArea): TcxItemCustomDrawInfo;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddNewItem(ADrawArea: TCustomDrawArea;
      AItemType: TcxItemCustomDrawType);
    function GetItemByIndex(AIndex: Integer): TcxItemCustomDrawInfo;
    property Bitmaps[ABkImage: TBkImage]: TBitmap read GetBkBitmap;
    property Count: Integer read GetCount;
    property DefaultFont: TFont read FDefaultFont;
    property Items[ADrawArea: TCustomDrawArea]: TcxItemCustomDrawInfo read GetItem; default;
    property OwnerDrawText: Boolean read FOwnerDrawText write FOwnerDrawText;
  end;

  TcxItemCustomDrawInfo = class
  private
    FOwner: TcxCustomDrawInfo;
    FBitmap: TBitmap;
    FBkImageType: TBkImage;
    FDrawArea: TCustomDrawArea;
    FDrawingStyle: TCustomDrawingStyle;
    FColorScheme: TColorScheme;
    FFont: TFont;
    FIsBitmapAssigned: Boolean;
    FIsFontAssigned: Boolean;
    FItemType: TcxItemCustomDrawType;
    FOwnerTextDraw: Boolean;
    function GetBitmap: TBitmap;
    function GetFont: TFont;
    procedure SetBitmap(const Value: TBitmap);
    procedure SetFont(const Value: TFont);
  public
    constructor Create(AOwner: TcxCustomDrawInfo; ADrawArea: TCustomDrawArea;
      AItemType: TcxItemCustomDrawType);
    destructor Destroy; override;
    property Owner: TcxCustomDrawInfo read FOwner;
    property Bitmap: TBitmap read GetBitmap write SetBitmap;
    property BkImageType: TBkImage read FBkImageType write FBkImageType;
    property DrawArea: TCustomDrawArea read FDrawArea;
    property DrawingStyle: TCustomDrawingStyle read FDrawingStyle write FDrawingStyle;
    property ColorScheme: TColorScheme read FColorScheme write FColorScheme;
    property Font: TFont read GetFont write SetFont;
    property ItemType: TcxItemCustomDrawType read FItemType;
    property OwnerTextDraw: Boolean read FOwnerTextDraw write FOwnerTextDraw;
  end;

  TCustomDrawDemoMainForm = class(TDemoBasicMainForm)
    miSeparator1: TMenuItem;
    miGridLookFeel: TMenuItem;
    miKind: TMenuItem;
    miFlat: TMenuItem;
    miStandard: TMenuItem;
    miUltraFlat: TMenuItem;
    miNativeStyle: TMenuItem;
    miSeparator2: TMenuItem;
    cxDBTreeList: TcxDBTreeList;
    miShowCustomDrawEditor: TMenuItem;
    cxDBTreeListID: TcxDBTreeListColumn;
    cxDBTreeListPARENTID: TcxDBTreeListColumn;
    cxDBTreeListNAME: TcxDBTreeListColumn;
    cxDBTreeListBUDGET: TcxDBTreeListColumn;
    cxDBTreeListPHONE: TcxDBTreeListColumn;
    cxDBTreeListFAX: TcxDBTreeListColumn;
    cxDBTreeListVACANCY: TcxDBTreeListColumn;
    cxDBTreeListManager: TcxDBTreeListColumn;
    cxDBTreeListManagerPhone: TcxDBTreeListColumn;
    cxDBTreeListManagerEmail: TcxDBTreeListColumn;
    cxEditRepository1: TcxEditRepository;
    eriTelephoneMaskEdit: TcxEditRepositoryMaskItem;
    cxDBTreeListManagerAdress: TcxDBTreeListColumn;
    imIndicatorImages: TImageList;
    Office111: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LookAndFeelChange(Sender: TObject);
    procedure actCustomizationFormExecute(Sender: TObject);
    procedure cxDBTreeListInitInsertingRecord(Sender: TObject;
      AFocusedNode: TcxTreeListDataNode; var AHandled: Boolean);
    procedure cxDBTreeListCustomDrawBackground(Sender: TObject;
      ACanvas: TcxCanvas; const R: TRect; var ADone: Boolean);
    procedure cxDBTreeListCustomDrawBandHeader(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListHeaderViewInfo;
      var ADone: Boolean);
    procedure cxDBTreeListCustomDrawCellsGroup(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListCellsGroupViewInfo;
      var ADone: Boolean);
    procedure cxDBTreeListCustomDrawFooter(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListBandViewInfo;
      var ADone: Boolean);
    procedure cxDBTreeListCustomDrawFooterCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListFooterItemViewInfo;
      var ADone: Boolean);
    procedure cxDBTreeListCustomDrawHeaderCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListHeaderViewInfo;
      var ADone: Boolean);
    procedure cxDBTreeListCustomDrawIndentCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListIndentViewInfo;
      var ADone: Boolean);
    procedure cxDBTreeListCustomDrawIndicatorCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListIndicatorViewInfo;
      var ADone: Boolean);
    procedure cxDBTreeListCustomDrawPreview(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure cxDBTreeListCustomDrawCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure cxDBTreeListCustomDrawHeader(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListBandViewInfo;
      var ADone: Boolean);
    procedure cxDBTreeListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
    FCustomDrawInfo: TcxCustomDrawInfo;
    FTempCustomDrawItem: TcxItemCustomDrawInfo;
    function DrawCellItem(AItem: TcxItemCustomDrawInfo; ACanvas: TcxCanvas;
      AViewInfo: TcxTreeListEditCellViewInfo; Sender: TObject): Boolean;
    function DrawHeaderItem(AItem: TcxItemCustomDrawInfo; ACanvas: TcxCanvas;
      AViewInfo: TcxTreeListHeaderViewInfo; Sender: TObject): Boolean;
    function DrawItem(AItem: TcxItemCustomDrawInfo; ACanvas: TcxCanvas;
      const R: TRect): Boolean;
    function DrawItemOutside(ACanvas: TcxCanvas; const ABounds: TRect): Boolean;
  public
    property CustomDrawInfo: TcxCustomDrawInfo read FCustomDrawInfo;
  end;

var
  CustomDrawDemoMainForm: TCustomDrawDemoMainForm;

implementation

uses CustomDrawDemoData, ShellAPI, DB, Dialogs, cxListBox, cxGeometry,
  cxLookAndFeelPainters, CustomDrawDemoEditor;

{$R *.dfm}

{ TcxCustomDrawInfo }


destructor TcxCustomDrawInfo.Destroy;
var
  I: Integer;
begin
  for I := 0 to FCustomDrawData.Count - 1 do
    TcxItemCustomDrawInfo(FCustomDrawData[I]).Free;
  for I := 0 to FBitmaps.Count - 1 do
    TBitmap(FBitmaps[I]).Free;
  FCustomDrawData.Free;  
  FBitmaps.Free;
  FDefaultFont.Free;
end;

constructor TcxCustomDrawInfo.Create;
  procedure LoadResourceBitmaps;
  var
    I: TBkImage;
    ABitmap: TBitmap;
  begin
    for I := Low(BkImageResNames) to High(BkImageResNames) do
    begin
      ABitmap := TBitmap.Create;
      LoadImageFromRes(ABitmap, BkImageResNames[I]);
      FBitmaps.Add(ABitmap);
    end;
  end;
begin
  FBitmaps := TList.Create;
  LoadResourceBitmaps;
  FDefaultFont := TFont.Create;
  FCustomDrawData := TList.Create;
  FOwnerDrawText := True;
end;

procedure TcxCustomDrawInfo.AddNewItem(ADrawArea: TCustomDrawArea;
  AItemType: TcxItemCustomDrawType);
begin
  FCustomDrawData.Add(TcxItemCustomDrawInfo.Create(Self, ADrawArea, AItemType));
end;

function TcxCustomDrawInfo.GetItemByIndex(
  AIndex: Integer): TcxItemCustomDrawInfo;
begin
  Result := TcxItemCustomDrawInfo(FCustomDrawData[AIndex]);
end;

function TcxCustomDrawInfo.GetBkBitmap(ABkImage: TBkImage): TBitmap;
begin
  Result := TBitmap(FBitmaps[Integer(ABkImage)]);
end;

function TcxCustomDrawInfo.GetCount: Integer;
begin
  Result := FCustomDrawData.Count;
end;

function TcxCustomDrawInfo.GetItem(ADrawArea: TCustomDrawArea): TcxItemCustomDrawInfo;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to FCustomDrawData.Count - 1 do
    if TcxItemCustomDrawInfo(FCustomDrawData[I]).DrawArea = ADrawArea then
    begin
      Result := TcxItemCustomDrawInfo(FCustomDrawData[I]);
      Break;
    end;
end;

{ TcxItemCustomDrawInfo }

constructor TcxItemCustomDrawInfo.Create(AOwner: TcxCustomDrawInfo;
  ADrawArea: TCustomDrawArea; AItemType: TcxItemCustomDrawType);
begin
  FOwner := AOwner;
  FDrawArea := ADrawArea;
  FItemType := AItemType;
  if FOwner <> nil then
    FBitmap := AOwner.Bitmaps[TBkImage(0)]
  else
    FBitmap := nil;
  if FOwner <> nil then
    FFont := AOwner.DefaultFont
  else
    FBitmap := nil;
  FBkImageType := TBkImage(0);
  FDrawingStyle := TCustomDrawingStyle(0);
  FColorScheme := TColorScheme(0);
  FIsBitmapAssigned := False;
  FIsFontAssigned := False;
  FOwnerTextDraw := False;
end;

destructor TcxItemCustomDrawInfo.Destroy;
begin
  if FIsBitmapAssigned then
    FBitmap.Free;
  if FIsFontAssigned then
    FFont.Free;
  inherited Destroy;
end;

function TcxItemCustomDrawInfo.GetBitmap: TBitmap;
begin
  if ((FBkImageType <> bkiUserDefined) or not FIsBitmapAssigned) and
    (FOwner <> nil) then
    Result := FOwner.Bitmaps[FBkImageType]
  else
    Result := FBitmap;
end;

function TcxItemCustomDrawInfo.GetFont: TFont;
begin
  Result := FFont;
end;

procedure TcxItemCustomDrawInfo.SetBitmap(const Value: TBitmap);
begin
  if FIsBitmapAssigned then
    FBitmap.Free;
  FBitmap := Value;
  FIsBitmapAssigned := True;
  FBkImageType := bkiUserDefined;
end;

procedure TcxItemCustomDrawInfo.SetFont(const Value: TFont);
begin
  if FIsFontAssigned then
    FFont.Free;
  FFont := Value;
  FIsFontAssigned := True;
end;

{TCustomDrawDemoMainForm}

procedure TCustomDrawDemoMainForm.FormCreate(Sender: TObject);
  procedure AddCustomDrawInfos;
  begin
    FCustomDrawInfo.AddNewItem(cdaBackground, itNormal);
    FCustomDrawInfo.AddNewItem(cdaBandHeader, itText);
    FCustomDrawInfo.AddNewItem(cdaCell, itCell);
    FCustomDrawInfo.AddNewItem(cdaCellsGroup, itNormal);
    FCustomDrawInfo.AddNewItem(cdaFooter, itNormal);
    FCustomDrawInfo.AddNewItem(cdaFooterCell, itText);
    FCustomDrawInfo.AddNewItem(cdaHeader, itNormal);
    FCustomDrawInfo.AddNewItem(cdaHeaderCell, itText);
    FCustomDrawInfo.AddNewItem(cdaIndentCell, itNormal);
    FCustomDrawInfo.AddNewItem(cdaIndicatorCell, itNormal);
    FCustomDrawInfo.AddNewItem(cdaPreview, itCell);
  end;
  procedure AdjustCustomDrawItems;
  begin
    FCustomDrawInfo[cdaHeaderCell].DrawingStyle := cdsBkImage;
    FCustomDrawInfo[cdaBackground].BkImageType := bkiEgypt;
    FCustomDrawInfo[cdaIndentCell].BkImageType := bkiEgypt;
    FCustomDrawInfo[cdaFooter].BkImageType := bkiMyFace;
    FCustomDrawInfo[cdaFooterCell].BkImageType := bkiMyFace;
    FCustomDrawInfo[cdaPreview].BkImageType := bkiMyFace;
    FCustomDrawInfo[cdaHeaderCell].DrawingStyle := cdsGradient;
    FCustomDrawInfo[cdaBandHeader].DrawingStyle := cdsGradient;
    FCustomDrawInfo[cdaBandHeader].ColorScheme := csBlue;
    FCustomDrawInfo[cdaIndicatorCell].DrawingStyle := cdsGradient;
  end;
begin
  FCustomDrawInfo := TcxCustomDrawInfo.Create;
  AddCustomDrawInfos;
  AdjustCustomDrawItems;
end;

procedure TCustomDrawDemoMainForm.FormDestroy(Sender: TObject);
begin
  FCustomDrawInfo.Free;
end;

procedure TCustomDrawDemoMainForm.FormShow(Sender: TObject);
begin
  cxDBTreeList.FullExpand;
  CustomDrawDemoEditorForm.Show;

{ remove/add the closing brace on this line to disable/enable the following code

  ShowMessage('WARNING: tutorial not completed. First, please apply the steps '+
              'shown in the doc file');

//}
end;

procedure TCustomDrawDemoMainForm.LookAndFeelChange(Sender: TObject);
begin
  if TMenuItem(Sender).Tag > 3 then
  begin
    cxLookAndFeelController.NativeStyle :=
      not cxLookAndFeelController.NativeStyle;
    TMenuItem(Sender).Checked := cxLookAndFeelController.NativeStyle;
  end
  else
  begin
    TMenuItem(Sender).Checked := True;
    cxLookAndFeelController.Kind := TcxLookAndFeelKind(TMenuItem(Sender).Tag);
    cxLookAndFeelController.NativeStyle := False;
    miNativeStyle.Checked := False;
  end;
end;

procedure TCustomDrawDemoMainForm.actCustomizationFormExecute(Sender: TObject);
begin
  CustomDrawDemoEditorForm.Show;
end;

procedure TCustomDrawDemoMainForm.cxDBTreeListInitInsertingRecord(
  Sender: TObject; AFocusedNode: TcxTreeListDataNode;
  var AHandled: Boolean);
begin
  if AFocusedNode <> nil then  
    CustomDrawDemoDataDM.SetParentValue(AFocusedNode.ParentValue);
end;

procedure TCustomDrawDemoMainForm.cxDBTreeListCustomDrawBackground(
  Sender: TObject; ACanvas: TcxCanvas; const R: TRect; var ADone: Boolean);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  ADone := DrawItem(FCustomDrawInfo[cdaBackground], ACanvas, R);

//}
end;

procedure TCustomDrawDemoMainForm.cxDBTreeListCustomDrawBandHeader(
  Sender: TObject; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListHeaderViewInfo; var ADone: Boolean);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  ADone := DrawHeaderItem(FCustomDrawInfo[cdaBandHeader], ACanvas, AViewInfo, Sender);

//}
end;

procedure TCustomDrawDemoMainForm.cxDBTreeListCustomDrawCell(
  Sender: TObject; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  ADone := DrawCellItem(FCustomDrawInfo[cdaCell], ACanvas, AViewInfo, Sender);

//}
end;

procedure TCustomDrawDemoMainForm.cxDBTreeListCustomDrawCellsGroup(
  Sender: TObject; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListCellsGroupViewInfo; var ADone: Boolean);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  if AViewInfo.Selected then Exit;
  ADone := DrawItem(FCustomDrawInfo[cdaCellsGroup], ACanvas, AViewInfo.VisibleRect);
  if not ADone then Exit;
  ACanvas.Pen.Color := TcxDBTreeList(Sender).OptionsView.GridLineColor;
  ACanvas.Brush.Style := bsClear;
  with AViewInfo.BoundsRect do
    ACanvas.Canvas.Rectangle(Left, Top, Right, Bottom);

//}
end;

procedure TCustomDrawDemoMainForm.cxDBTreeListCustomDrawFooter(
  Sender: TObject; ACanvas: TcxCanvas; AViewInfo: TcxTreeListBandViewInfo;
  var ADone: Boolean);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  ADone := DrawItem(FCustomDrawInfo[cdaFooter], ACanvas, AViewInfo.VisibleRect);

//}
end;

procedure TCustomDrawDemoMainForm.cxDBTreeListCustomDrawFooterCell(
  Sender: TObject; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListFooterItemViewInfo; var ADone: Boolean);
var
 AItem: TcxItemCustomDrawInfo;
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  AItem := FCustomDrawInfo[cdaFooterCell];
  if AItem.DrawingStyle = cdsDefaultDrawing then Exit;
  if AItem.OwnerTextDraw then
  begin
    ADone := DrawItem(AItem, ACanvas, AViewInfo.VisibleRect);
    AViewInfo.LookAndFeelPainter.DrawFooterCellBorder(ACanvas, AViewInfo.BoundsRect);
    ACanvas.Font := AItem.Font;
    ACanvas.Brush.Style := bsClear;
    ACanvas.DrawTexT(AViewInfo.Text, cxRectInflate(AViewInfo.BoundsRect, -2, -2),0);
  end
  else
    with AViewInfo do
    begin
      FTempCustomDrawItem := AItem;
      LookAndFeelPainter.DrawFooterCell(ACanvas, BoundsRect, AlignHorz, AlignVert,
        MultiLine, Text, ViewParams.Font, ViewParams.TextColor, ViewParams.Color,
        DrawItemOutside);
      ADone := True;
    end;

//}
end;

procedure TCustomDrawDemoMainForm.cxDBTreeListCustomDrawHeader(
  Sender: TObject; ACanvas: TcxCanvas; AViewInfo: TcxTreeListBandViewInfo;
  var ADone: Boolean);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  ADone := DrawItem(FCustomDrawInfo[cdaHeader], ACanvas, AViewInfo.VisibleRect);

//}
end;

procedure TCustomDrawDemoMainForm.cxDBTreeListCustomDrawHeaderCell(
  Sender: TObject; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListHeaderViewInfo; var ADone: Boolean);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  ADone := DrawHeaderItem(FCustomDrawInfo[cdaHeaderCell], ACanvas, AViewInfo, Sender);

//}
end;

procedure TCustomDrawDemoMainForm.cxDBTreeListCustomDrawIndentCell(
  Sender: TObject; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListIndentViewInfo; var ADone: Boolean);
  procedure DrawTreeLines;
  begin
    with AViewInfo do
    begin
      if [tltVertUp, tltVertDown] * TreeLines <> [] then
        cxFillHalfToneRect(ACanvas.Canvas, VertTreeLine, ViewParams.Color,
          TcxTreeList(Sender).OptionsView.TreeLineColor);
      if tltHorz in TreeLines then
        cxFillHalfToneRect(ACanvas.Canvas, HorzTreeLine, ViewParams.Color,
          TcxTreeList(Sender).OptionsView.TreeLineColor);
    end;
  end;
  procedure DrawRectWithBorders;
  begin
    ACanvas.Brush.Color := TcxTreeList(Sender).OptionsView.GridLineColor;
    with AViewInfo, AViewInfo.BoundsRect  do
    begin
      if bLeft in Borders then
        ACanvas.FillRect(cxRect(Left, Top, Left + 1, Bottom));
      if bRight in Borders then
        ACanvas.FillRect(cxRect(Right - 1, Top, Right, Bottom));
      if bTop in Borders then
        ACanvas.FillRect(cxRect(Left, Top, Right, Top + 1));
      if bBottom in Borders then
        ACanvas.FillRect(cxRect(Left, Bottom - 1, Right, Bottom));
    end;
  end;

begin
{ remove/add the closing brace on this line to disable/enable the following code}

  ADone := DrawItem(FCustomDrawInfo[cdaIndentCell], ACanvas, AViewInfo.VisibleRect);
  if not ADone then Exit;
  with AViewInfo do
  begin
    DrawRectWithBorders;
    DrawTreeLines;
    if HasButton then
    begin
      DrawItem(FCustomDrawInfo[cdaIndentCell], ACanvas, ButtonRect);
      ACanvas.Brush.Color := TcxTreeList(Sender).OptionsView.TreeLineColor;
      LookAndFeelPainter.DrawSmallExpandButton(ACanvas, ButtonRect, IsExpanded, clBtnFace);
    end;
  end;

//}
end;

procedure TCustomDrawDemoMainForm.cxDBTreeListCustomDrawIndicatorCell(
  Sender: TObject; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListIndicatorViewInfo; var ADone: Boolean);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  FTempCustomDrawItem := FCustomDrawInfo[cdaIndicatorCell];
  if FTempCustomDrawItem.DrawingStyle = cdsDefaultDrawing then Exit;
  with AViewInfo do
    LookAndFeelPainter.DrawIndicatorItemEx(ACanvas, BoundsRect, Kind, ViewParams.Color, DrawItemOutside);
  ADone := True;

//}
end;

procedure TCustomDrawDemoMainForm.cxDBTreeListCustomDrawPreview(
  Sender: TObject; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  ADone := DrawCellItem(FCustomDrawInfo[cdaPreview], ACanvas, AViewInfo, Sender);

  //}
end;

function TCustomDrawDemoMainForm.DrawHeaderItem(
  AItem: TcxItemCustomDrawInfo; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListHeaderViewInfo; Sender: TObject): Boolean;
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  Result := False;
  if AItem.DrawingStyle = cdsDefaultDrawing then Exit;
  if AItem.OwnerTextDraw then
  begin
    Result := DrawItem(AItem, ACanvas, AViewInfo.VisibleRect);
    AViewInfo.LookAndFeelPainter.DrawHeaderBorder(ACanvas,
      cxRectInflate(AViewInfo.BoundsRect, -1, -1),
      AViewInfo.Neighbors, AViewInfo.Borders);
    ACanvas.Font := AItem.Font;
    ACanvas.Brush.Style := bsClear;
    ACanvas.DrawTexT(AViewInfo.Text, cxRectInflate(AViewInfo.TextBounds, -2, 0), cxAlignCenter);
  end
  else
  begin
    FTempCustomDrawItem := AItem;
    with AViewInfo do
      LookAndFeelPainter.DrawHeaderEx(ACanvas,
        BoundsRect, TextBounds, Neighbors, Borders, State, AlignHorz, AlignVert,
        MultiLine, ShowEndEllipsis, Text, ViewParams.Font, ViewParams.TextColor,
        ViewParams.Color, DrawItemOutside);
    Result := True;
  end;
  if AViewInfo is TcxTreeListColumnHeaderViewInfo then
    with TcxTreeListColumnHeaderViewInfo(AViewInfo) do
      if SortOrder <> soNone then
        TcxDBTreeList(Sender).LookAndFeel.Painter.DrawSortingMark(ACanvas,
          SortMarkBounds, SortOrder = soAscending);
  if AViewInfo.State = cxbsPressed then
     AViewInfo.LookAndFeelPainter.DrawHeaderPressed(ACanvas, AViewInfo.BoundsRect);
  
//}
end;

function TCustomDrawDemoMainForm.DrawItem(AItem: TcxItemCustomDrawInfo;
  ACanvas: TcxCanvas; const R: TRect): Boolean;
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  case AItem.DrawingStyle of
    cdsBkImage:
       ACanvas.FillRect(R, AItem.Bitmap);
    cdsGradient:
       DrawGradient(ACanvas.Canvas, R,
        ColorScheme[Integer(AItem.ColorScheme), 1],
        ColorScheme[Integer(AItem.ColorScheme), 0], 40,
        Integer(AItem.ColorScheme) > 1);
  end;
  Result := (AItem.DrawingStyle <> cdsDefaultDrawing);

//}
end;

function TCustomDrawDemoMainForm.DrawItemOutside(ACanvas: TcxCanvas;
  const ABounds: TRect): Boolean;
begin
  DrawItem(FTempCustomDrawItem, ACanvas, ABounds);
  Result := True;
end;

function TCustomDrawDemoMainForm.DrawCellItem(AItem: TcxItemCustomDrawInfo;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  Sender: TObject): Boolean;
  procedure OwnerDrawText(ALinesColor: TColor; AFont: TFont);
  var
    ARect: TRect;
  begin
    ACanvas.Pen.Color := ALinesColor;
    ACanvas.Brush.Style := bsClear;
    ACanvas.Font := AFont;
    ARect := cxRectInflate(AViewInfo.BoundsRect, 0, 1, 0, 0);
    with ARect do
      ACanvas.Canvas.Rectangle(Left, Top, Right, Bottom);
    if AViewInfo.EditViewInfo is TcxCustomCheckBoxViewInfo then
      with TcxCustomCheckBoxViewInfo(AViewInfo.EditViewInfo) do
      AViewInfo.Painter.DrawCheckButton(ACanvas,
        cxRectOffset(CheckBoxRect, AViewInfo.BoundsRect.Left, AViewInfo.BoundsRect.Top),
        cxbsDefault, State = cbsChecked)
    else
      if AViewInfo.EditViewInfo is TcxCustomTextEditViewInfo then
        with TcxCustomTextEditViewInfo(AViewInfo.EditViewInfo) do
          ACanvas.DrawTexT(Text, cxRectInflate(AViewInfo.BoundsRect, -2, -2), 0);
  end;
var
 AStyle: TcxStyle;
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  Result := False;
  AViewInfo.Transparent := (AViewInfo.ViewParams.Bitmap <> nil) and
    (not AViewInfo.ViewParams.Bitmap.Empty);
  if AViewInfo.Selected then Exit;
  if AItem.DrawingStyle = cdsDefaultDrawing then Exit;
  if AItem.DrawingStyle = cdsDependsOnData then
    with CustomDrawDemoDataDM do
    begin
      if AViewInfo.Node.Values[cxDBTreeListVACANCY.ItemIndex] then
        AStyle := styVacancy
      else
        AStyle := styNoVacancy;
      ACanvas.Brush.Color := AStyle.Color;
      ACanvas.FillRect(AViewInfo.VisibleRect);
      OwnerDrawText(AStyle.TextColor, AStyle.Font);
      Result := True;
    end
  else
  begin
    Result := DrawItem(AItem, ACanvas, AViewInfo.VisibleRect);
    if AItem.OwnerTextDraw then
      OwnerDrawText(TcxTreeList(Sender).OptionsView.GridLineColor, AItem.Font)
    else
    begin
      AViewInfo.Transparent := True;
      Result := False;
    end;
  end;

//}
end;

procedure TCustomDrawDemoMainForm.cxDBTreeListDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  //
end;

end.

