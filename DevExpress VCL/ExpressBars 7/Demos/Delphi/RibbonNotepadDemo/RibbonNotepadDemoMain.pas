unit RibbonNotepadDemoMain;

{$I cxVer.inc}

interface

uses
{$IFDEF EXPRESSSKINS}
  {$I dxSkins.inc}
{$ENDIF}
  Types, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, dxBar, StdCtrls, dxBarExtItems, cxControls,
  ImgList, ActnList, cxLookAndFeels, dxStatusBar, cxGraphics, EBarsUtils,
  dxRibbonForm, dxRibbon, cxClasses, Menus, dxRibbonStatusBar, cxStyles,
  dxRibbonGallery, dxOffice11, cxGeometry, dxRibbonGalleryFilterEd,
  cxLookAndFeelPainters, dxRibbonSkins, dxRibbonBackstageView,
  dxBarApplicationMenu, RibbonNotepadDemoOptions, cxContainer, cxEdit,
{$IFDEF EXPRESSSKINS}
  dxSkinChooserGallery, dxSkinsdxRibbon7Painter,
{$ENDIF}
  cxTextEdit, cxHyperLinkEdit, cxLabel, dxGDIPlusClasses, dxRibbonMiniToolbar;

const
  SchemeColorCount = 10;

type
  TColorMap = array [0..SchemeColorCount-1] of TColor;

  TColorPickerController = class
  private
    FColor: TColor;
    FColorGlyphSize: Integer;
    FColorDialog: TColorDialog;
    FColorItem: TdxRibbonGalleryItem;
    FColorMapItem: TdxRibbonGalleryItem;
    FRibbon: TdxCustomRibbon;

    FThemeColorsGroup: TdxRibbonGalleryGroup;
    FAccentColorsGroup: TdxRibbonGalleryGroup;
    FStandardColorsGroup: TdxRibbonGalleryGroup;
    FCustomColorsGroup: TdxRibbonGalleryGroup;

    FMoreColorsButton: TdxBarButton;
    FNoColorButton: TdxBarButton;
    FColorDialogSetup: TdxBarButton;
    FOnColorChanged: TNotifyEvent;

    function GetBarManager: TdxBarManager;
    procedure SetColor(Value: TColor);

    procedure ColorItemClick(Sender: TdxRibbonGalleryItem; AItem: TdxRibbonGalleryGroupItem);
    procedure ColorMapItemClick(Sender: TdxRibbonGalleryItem; AItem: TdxRibbonGalleryGroupItem);
    procedure NoColorButtonClick(Sender: TObject);
    procedure MoreColorsClick(Sender: TObject);
    procedure ColorDialogSetupButtonClick(Sender: TObject);

    property BarManager: TdxBarManager read GetBarManager;
  protected
    function AddColorItem(AGalleryGroup: TdxRibbonGalleryGroup; AColor: TColor): TdxRibbonGalleryGroupItem;
    function CreateColorBitmap(AColor: TColor; AGlyphSize: Integer = 0): TcxAlphaBitmap;
    procedure CreateColorRow(AGalleryGroup: TdxRibbonGalleryGroup; AColorMap: TColorMap);
    procedure BuildThemeColorGallery;
    procedure BuildStandardColorGallery;
    procedure BuildColorSchemeGallery;

    procedure ColorChanged;
    procedure ColorMapChanged;
  public
    constructor Create(AColorItem, AColorMapItem: TdxRibbonGalleryItem;
      AFontColorPopupMenu: TdxRibbonPopupMenu; ARibbon: TdxCustomRibbon);
    destructor Destroy; override;

    property Color: TColor read FColor;
    property OnColorChanged: TNotifyEvent read FOnColorChanged write FOnColorChanged;
  end;

  TRichEdit = class(ComCtrls.TRichEdit)
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

  TRichEditUndoController = class
  private
    FLastMessageID: Integer;
    FIsLocked: Boolean;
    FGalleryItem: TdxRibbonGalleryItem;
    FEditor: TRichEdit;
  protected
    procedure AddAction(AnActionID: Integer);
    procedure PopUndo;
    procedure PushUndo(AnAction: string);
  public
    constructor Create(AGalleryItem: TdxRibbonGalleryItem; AEditor: TRichEdit);
    procedure AnalyseMessage;
    procedure Lock;
    procedure UnLock;
  end;

  TRibbonDemoMainForm = class(TdxRibbonForm)
    BarManager: TdxBarManager;
    dxBarButtonNew: TdxBarLargeButton;
    dxBarButtonOpen: TdxBarLargeButton;
    dxBarButtonSave: TdxBarLargeButton;
    dxBarSubItemSaveAs: TdxBarSubItem;
    dxBarButtonSaveAsRTF: TdxBarButton;
    dxBarButtonSaveAsText: TdxBarButton;
    dxBarButtonPrint: TdxBarLargeButton;
    dxBarButtonExit: TdxBarLargeButton;
    dxBarButtonUndo: TdxBarLargeButton;
    dxBarButtonCut: TdxBarLargeButton;
    dxBarButtonCopy: TdxBarLargeButton;
    dxBarButtonPaste: TdxBarLargeButton;
    dxBarButtonClear: TdxBarLargeButton;
    dxBarButtonSelectAll: TdxBarLargeButton;
    dxBarButtonFind: TdxBarLargeButton;
    dxBarButtonReplace: TdxBarLargeButton;
    dxBarComboFontSize: TdxBarCombo;
    dxBarButtonBold: TdxBarLargeButton;
    dxBarButtonItalic: TdxBarLargeButton;
    dxBarButtonUnderline: TdxBarLargeButton;
    dxBarButtonBullets: TdxBarLargeButton;
    dxBarButtonProtected: TdxBarLargeButton;
    dxBarButtonAlignLeft: TdxBarLargeButton;
    dxBarButtonCenter: TdxBarLargeButton;
    dxBarButtonAlignRight: TdxBarLargeButton;
    dxBarButtonFont: TdxBarLargeButton;
    dxBarSeparator: TdxBarSeparator;

    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    PrintDialog: TPrintDialog;
    FontDialog: TFontDialog;
    dxBarPopupMenu: TdxRibbonPopupMenu;
    dxBarGroup1: TdxBarGroup;
    dxBarButton1: TdxBarLargeButton;
    dxBarButton2: TdxBarLargeButton;
    dxBarButton3: TdxBarLargeButton;
    dxBarButton4: TdxBarLargeButton;
    dxBarButton5: TdxBarLargeButton;
    dxBarButton6: TdxBarLargeButton;
    dxBarButton7: TdxBarLargeButton;
    dxBarComboFontName: TdxBarFontNameCombo;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    ilStatusBarImages: TImageList;
    dxStatusBar: TdxRibbonStatusBar;
    FindDialog: TFindDialog;
    ReplaceDialog: TReplaceDialog;
    tabHome: TdxRibbonTab;
    Ribbon: TdxRibbon;
    tabHelp: TdxRibbonTab;
    tabAppearance: TdxRibbonTab;
    BarManagerBar4: TdxBar;
    BarManagerBar5: TdxBar;
    BarManagerBar7: TdxBar;
    ApplicationMenu: TdxBarApplicationMenu;
    BarManagerBar8: TdxBar;
    BarManagerBar1: TdxBar;
    dxBarLargeButtonBlueScheme: TdxBarLargeButton;
    dxBarLargeButtonBlackScheme: TdxBarLargeButton;
    dxBarLargeButtonSilverScheme: TdxBarLargeButton;
    BarManagerBar9: TdxBar;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    BarManagerBar10: TdxBar;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    BarManagerBar11: TdxBar;
    BarManagerBar12: TdxBar;
    Editor: TRichEdit;
    dxBarScreenTipRepository1: TdxBarScreenTipRepository;
    cxLargeImages: TcxImageList;
    cxSmallImages: TcxImageList;
    BarManagerBar6: TdxBar;
    BarManagerBar13: TdxBar;
    btnLineNumber: TdxBarButton;
    btnColumnNumber: TdxBarButton;
    btnLocked: TdxBarButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    stModified: TdxBarStatic;
    stFontDialog: TdxBarScreenTip;
    stHelpButton: TdxBarScreenTip;
    dxBarButtonOptions: TdxBarButton;
    rgiFontColor: TdxRibbonGalleryItem;
    rgiColorTheme: TdxRibbonGalleryItem;
    dxBarButtonFontColor: TdxBarButton;
    rgiItemSymbol: TdxRibbonGalleryItem;
    Panel1: TPanel;
    UndoDropDownGallery: TdxRibbonDropDownGallery;
    rgiUndo: TdxRibbonGalleryItem;
    bstSelectionInfo: TdxBarStatic;
    dxBarSubItem1: TdxBarSubItem;
    dxBarStatic1: TdxBarStatic;
    dxBarButton8: TdxBarButton;
    tabSelection: TdxRibbonTab;
    BarManagerBar14: TdxBar;
    BackstageView: TdxRibbonBackstageView;
    bvtsHelp: TdxRibbonBackstageViewTabSheet;
    pbFrameBackground: TPaintBox;
    lblSupport: TLabel;
    pbSeparator: TPaintBox;
    lblHelpBars: TLabel;
    imDot1: TImage;
    imDot2: TImage;
    lblHelpDocking: TLabel;
    lblSupportCenter: TLabel;
    imDot3: TImage;
    lblLinks: TLabel;
    pbSeparator2: TPaintBox;
    lblProducts: TLabel;
    imDot4: TImage;
    imDot5: TImage;
    lblClientCenter: TLabel;
    lblDXonWeb: TLabel;
    imDot6: TImage;
    lblDownloads: TLabel;
    Image1: TImage;
    bvtsAbout: TdxRibbonBackstageViewTabSheet;
    pbFrameBackground2: TPaintBox;
    lbAboutDemo: TLabel;
    pbSeparator3: TPaintBox;
    meAbout: TMemo;
    imLogo: TImage;
    MiniToolbar: TdxRibbonMiniToolbar;
    ppmFontColor: TdxRibbonPopupMenu;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

    procedure dxBarButtonNewClick(Sender: TObject);
    procedure dxBarButtonOpenClick(Sender: TObject);
    procedure dxBarButtonCloseClick(Sender: TObject);
    procedure dxBarButtonSaveClick(Sender: TObject);
    procedure dxBarButtonSaveAsRTFClick(Sender: TObject);
    procedure dxBarButtonSaveAsTextClick(Sender: TObject);
    procedure dxBarButtonPrintClick(Sender: TObject);
    procedure dxBarButtonExitClick(Sender: TObject);

    procedure dxBarButtonUndoClick(Sender: TObject);
    procedure dxBarButtonCutClick(Sender: TObject);
    procedure dxBarButtonCopyClick(Sender: TObject);
    procedure dxBarButtonPasteClick(Sender: TObject);
    procedure dxBarButtonClearClick(Sender: TObject);
    procedure dxBarButtonSelectAllClick(Sender: TObject);
    procedure dxBarButtonFindClick(Sender: TObject);
    procedure dxBarButtonReplaceClick(Sender: TObject);

    procedure dxBarComboFontNameChange(Sender: TObject);
    procedure dxBarComboFontSizeChange(Sender: TObject);
    procedure dxBarButtonBoldClick(Sender: TObject);
    procedure dxBarButtonItalicClick(Sender: TObject);
    procedure dxBarButtonUnderlineClick(Sender: TObject);
    procedure dxBarButtonBulletsClick(Sender: TObject);
    procedure dxBarButtonAlignClick(Sender: TObject);
    procedure dxBarButtonProtectedClick(Sender: TObject);
    procedure FontClick(Sender: TObject);
    procedure FindOne(Sender: TObject);
    procedure ReplaceOne(Sender: TObject);
    procedure dxBarLargeButtonBlueSchemeClick(Sender: TObject);
    procedure dxBarLargeButtonBlackSchemeClick(Sender: TObject);
    procedure dxBarLargeButtonSilverSchemeClick(Sender: TObject);
    procedure dxBarLargeButton10Click(Sender: TObject);
    procedure dxBarLargeButton8Click(Sender: TObject);
    procedure dxBarLargeButton9Click(Sender: TObject);
    procedure dxBarLargeButton6Click(Sender: TObject);
    procedure dxBarLargeButton7Click(Sender: TObject);

    procedure EditorChange(Sender: TObject);
    procedure EditorSelectionChange(Sender: TObject);
    procedure EditorMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RibbonResize(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure ApplicationMenuRecentDocumentsClick(Sender: TObject; AIndex: Integer);
    procedure btnLockedClick(Sender: TObject);
    procedure RibbonHelpButtonClick(Sender: TdxCustomRibbon);
    procedure RibbonHideMinimizedByClick(Sender: TdxCustomRibbon; AWnd: Cardinal;
      AShift: TShiftState; const APos: TPoint; var AAllowProcessing: Boolean);
    procedure dxBarButtonOptionsClick(Sender: TObject);
    procedure dxBarButtonFontColorClick(Sender: TObject);
    procedure rgiItemSymbolGroupItemClick(Sender: TdxRibbonGalleryItem; AItem: TdxRibbonGalleryGroupItem);
    procedure rgiUndoHotTrackedItemChanged(APrevHotTrackedGroupItem, ANewHotTrackedGroupItem: TdxRibbonGalleryGroupItem);
    procedure rgiUndoGroupItemClick(Sender: TdxRibbonGalleryItem; AItem: TdxRibbonGalleryGroupItem);
    procedure pbFrameBackgroundPaint(Sender: TObject);
    procedure pbSeparatorPaint(Sender: TObject);
    procedure bvtsHelpResize(Sender: TObject);
    procedure bvtsAboutResize(Sender: TObject);
    procedure EditorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FCanOnChange: Boolean;
    FFileName: string;
    FUpdating: Boolean;
    FColorPickerController: TColorPickerController;
    FEditorUndoController: TRichEditUndoController;

    function GetEditorCol: Integer;
    function GetEditorRow: Integer;
    procedure InitSymbolGallery;
    procedure MakeNewDocument;
    procedure SetFileName(Value: string);
{$IFDEF EXPRESSSKINS}
    procedure SkinChange(Sender: TObject; const ASkinName: String);
    procedure SkinChooserSetup;
{$ENDIF}
    procedure UpdateActionsImages;
    procedure UpdateRibbonDemoStyle(AStyle: TRibbonDemoStyle);

    procedure AssignFontColorGlyph;
    procedure FontColorChanged(Sender: TObject);
    procedure SetFontColor;
    procedure Undo(Count: Integer);
  public
    procedure OpenFile(const AFileName: string);
    function QuerySaveFile: Integer;
    function SaveFile(ASaveAs: Boolean; APlainText: Boolean = False): Boolean;
    procedure SetColorScheme(const AName: string);
    procedure SetModified(Value: Boolean);
    procedure ShowItems(AShow: Boolean);

    property EditorCol: Integer read GetEditorCol;
    property EditorRow: Integer read GetEditorRow;
    property FileName: string read FFileName write SetFileName;
  end;

var
  RibbonDemoMainForm: TRibbonDemoMainForm;

implementation

{$R *.DFM}
{$R windowsxp.res}
{$R RibbonNotepadDemoAppGlyphs.res}

uses
{$IFDEF EXPRESSSKINS}
  dxSkinInfo,
{$ENDIF}
  RichEdit, ClipBrd, RibbonNotepadDemoGallerySetup, Math, dxGDIPlusAPI;

type
  TColorMapInfo = record
    Name: string;
    Map: TColorMap;
  end;
  TAccent = (aLight80, aLight60, aLight50, aLight40, aLight35, aLight25, aLight15, aLight5, aDark10, aDark25, aDark50, aDark75, aDark90);

const
  sRichEditFoundResultCaption = 'Information';
  sRichEditTextNotFound = 'The search text is not found.';
  sRichEditReplaceAllResult = 'Replaced %d occurrences.';
  sDefaultDocName = 'Document1.rtf';

  RTFFilter = 'Rich Text Files (*.RTF)|*.RTF';
  TXTFilter = 'Plain text (*.TXT)|*.TXT';

  AStandardColorMap: TColorMap =
    ($0000C0, $0000FF, $00C0FF, $00FFFF, $50D092, $50B000, $F0B000, $C07000, $602000, $A03070);
  AColorMaps: array [0..5] of TColorMapInfo =(
    (Name: 'Default'; Map: (clWindow, clWindowText, $D2B48C, $00008B, $0000FF, $FF0000, $556B2F, $800080, clAqua, $FFA500)),
    (Name: 'Theme1'; Map: (clWindow, clWindowText, $7D491F, $E1ECEE, $BD814F, $4D50C0, $59BB9B, $A26480, $C6AC4B, $4696F7)),
    (Name: 'Theme2'; Map: (clWindow, clWindowText, $6D6769, $D1C2C9, $66B9CE, $84B09C, $C9B16B, $CF8565, $C96B7E, $BB79A3)),
    (Name: 'Theme3'; Map: (clWindow, clWindowText, $323232, $D1DEE3, $097FF0, $36299F, $7C581B, $42854E, $784860, $5998C1)),
    (Name: 'Theme4'; Map: (clWindow, clWindowText, $866B64, $D7D1C5, $4963D1, $00B4CC, $AEAD8C, $707B8C, $8CB08F, $4990D1)),
    (Name: 'Theme5'; Map: (clWindow, clWindowText, $464646, $FAF5DE, $BFA22D, $281FDA, $1B64EB, $9D6339, $784B47, $4A3C7D))
  );

function DPIRatio: Single;
begin
  Result := Screen.PixelsPerInch / 96;
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

function TRibbonDemoMainForm.GetEditorCol: Integer;
begin
  with Editor do
    Result := SelStart - SendMessage(Handle, EM_LINEINDEX, EditorRow, 0);
end;

function TRibbonDemoMainForm.GetEditorRow: Integer;
begin
  with Editor do
    Result := SendMessage(Handle, EM_LINEFROMCHAR, SelStart, 0);
end;

procedure TRibbonDemoMainForm.MakeNewDocument;
begin
  Editor.Clear;
  SetModified(False);
  FileName := sDefaultDocName;
end;

procedure TRibbonDemoMainForm.SetFileName(Value: string);
var
  AIndex: Integer;
begin
  Ribbon.DocumentName := ExtractFileName(Value);
  FFileName := Value;

  if FileExists(FFileName) then
  begin
    AIndex := ApplicationMenu.ExtraPaneItems.IndexOf(FFileName);
    if AIndex > -1 then
      ApplicationMenu.ExtraPaneItems.Delete(AIndex);
    ApplicationMenu.ExtraPaneItems.Insert(0).Text := FFileName;
  end;
end;

{$IFDEF EXPRESSSKINS}
procedure TRibbonDemoMainForm.SkinChange(Sender: TObject; const ASkinName: String);
begin
  Ribbon.ColorSchemeName := ASkinName;
end;

procedure TRibbonDemoMainForm.SkinChooserSetup;
var
  ABar: TdxBar;
  AChooser: TdxSkinChooserGalleryItem;
begin
  BarManagerBar4.Visible := False;
  ABar := BarManager.Bars.Add;
  ABar.Caption := 'Skins';
  Ribbon.Tabs[1].AddToolBar(ABar);
  AChooser := TdxSkinChooserGalleryItem.Create(BarManager);
  AChooser.GalleryInRibbonOptions.Collapsed := False;
  AChooser.OnSkinChange := SkinChange;
  ABar.ItemLinks.Add(AChooser);
  ABar.Visible := True;
end;
{$ENDIF}

procedure TRibbonDemoMainForm.FindOne(Sender: TObject);
var
  StartPos, FindLength, FoundAt: Integer;
  Flags: TSearchTypes;
  P: TPoint;
  CaretR, R, IntersectR: TRect;
begin
  with Editor, TFindDialog(Sender) do
  begin
    if frDown in Options then
    begin
      if SelLength = 0 then StartPos := SelStart
      else StartPos := SelStart + SelLength;
      FindLength := Length(Text) - StartPos;
    end
    else
    begin
      StartPos := SelStart;
      FindLength := -StartPos;
    end;
    Flags := [];
    if frMatchCase in Options then Include(Flags, stMatchCase);
    if frWholeWord in Options then Include(Flags, stWholeWord);
    Screen.Cursor := crHourglass;
    FoundAt := Editor.FindText(FindText, StartPos, FindLength, Flags);
    if not (frReplaceAll in Options) then Screen.Cursor := crDefault;
    if FoundAt > -1 then
      if frReplaceAll in Options then
      begin
        SelStart := FoundAt;
        SelLength := Length(FindText);
      end
      else
      begin
        SetFocus;
        SelStart := FoundAt;
        SelLength := Length(FindText);

        Windows.GetCaretPos(P);
        P := ClientToScreen(P);
        CaretR := Rect(P.X, P.Y, P.X + 2, P.Y + 20);
        GetWindowRect(Handle, R);
        if IntersectRect(IntersectR, CaretR, R) then
          if P.Y < Screen.Height div 2 then
            Top := P.Y + 40
          else
            Top := P.Y - (R.Bottom - R.Top + 20);
      end
    else
      if not (frReplaceAll in Options) then
        Application.MessageBox(sRichEditTextNotFound,
          sRichEditFoundResultCaption, MB_ICONINFORMATION);
  end;
end;

procedure TRibbonDemoMainForm.ReplaceOne(Sender: TObject);
var
  ReplacedCount, OldSelStart, PrevSelStart: Integer;
  S: string;
begin
  with Editor, TReplaceDialog(Sender) do
  begin
    ReplacedCount := 0;
    OldSelStart := SelStart;
    if frReplaceAll in Options then
      Screen.Cursor := crHourglass;
    repeat
      if (SelLength > 0) and ((SelText = FindText) or
        (not (frMatchCase in Options) and
         (AnsiUpperCase(SelText) = AnsiUpperCase(FindText)))) then
      begin
        SelText := ReplaceText;
        Inc(ReplacedCount);
      end;
      PrevSelStart := SelStart;
      FindOne(Sender);
    until not (frReplaceAll in Options) or (SelStart = PrevSelStart);
    if frReplaceAll in Options then
    begin
      Screen.Cursor := crDefault;
      if ReplacedCount = 0 then S := sRichEditTextNotFound
      else
      begin
        SelStart := OldSelStart;
        S := Format(sRichEditReplaceAllResult, [ReplacedCount]);
      end;
      Application.MessageBox(PChar(S), sRichEditFoundResultCaption,
        MB_ICONINFORMATION);
    end;
  end;
end;

procedure TRibbonDemoMainForm.RibbonResize(Sender: TObject);
begin
  if Ribbon.QuickAccessToolbar.Position = qtpAboveRibbon then
    dxBarLargeButton8.Down := True
  else
    dxBarLargeButton9.Down := True;
end;

procedure TRibbonDemoMainForm.EditorChange(Sender: TObject);
begin
  if Editor = nil then Exit;

  Editor.OnSelectionChange(Editor);
  SetModified(Editor.Modified);
  dxBarButtonUndo.Enabled := SendMessage(Editor.Handle, EM_CANUNDO, 0, 0) <> 0;
  RibbonDemoMainForm.FEditorUndoController.AnalyseMessage;
end;

procedure TRibbonDemoMainForm.EditorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
    dxBarPopupMenu.PopupFromCursorPos;
end;

procedure TRibbonDemoMainForm.EditorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (Editor.SelLength <> 0) then
    MiniToolbar.Popup;
end;

procedure TRibbonDemoMainForm.EditorSelectionChange(Sender: TObject);

  procedure CheckSelectionContext;
  const
    SelectionContextIndex = 0;
  begin
    if dxBarButtonCopy.Enabled then
      Ribbon.Contexts[SelectionContextIndex].Activate(False)
    else
      Ribbon.Contexts[SelectionContextIndex].Visible := False;
  end;

begin
  with Editor, SelAttributes do
  begin
    FUpdating := True;
    dxBarComboFontSize.OnChange := nil;
    dxBarComboFontName.OnChange := nil;
    try
       btnLineNumber.Caption := Format(' Line: %3d ', [1 + EditorRow]);
       btnColumnNumber.Caption := Format(' Row: %3d ', [1 + EditorCol]);

       dxBarButtonCopy.Enabled := SelLength > 0;
       dxBarButtonCut.Enabled := dxBarButtonCopy.Enabled;
       dxBarButtonPaste.Enabled := SendMessage(Editor.Handle, EM_CANPASTE, 0, 0) <> 0;
       dxBarButtonClear.Enabled := dxBarButtonCopy.Enabled;

       dxBarComboFontSize.Text := IntToStr(Size);
       dxBarComboFontName.Text := Name;

       dxBarButtonBold.Down := fsBold in Style;
       dxBarButtonItalic.Down := fsItalic in Style;
       dxBarButtonUnderline.Down := fsUnderline in Style;

       dxBarButtonBullets.Down := Boolean(Paragraph.Numbering);
       case Ord(Paragraph.Alignment) of
         0: dxBarButtonAlignLeft.Down := True;
         1: dxBarButtonAlignRight.Down := True;
         2: dxBarButtonCenter.Down := True;
       end;
       dxBarButtonProtected.Down := Protected;
    finally
      FUpdating := False;
      dxBarComboFontSize.OnChange := dxBarComboFontSizeChange;
      dxBarComboFontName.OnChange := dxBarComboFontNameChange;
    end;
  end;
  CheckSelectionContext;
end;

procedure TRibbonDemoMainForm.OpenFile(const AFileName: string);
begin
  if Editor.Modified then
    case QuerySaveFile of
      ID_YES:
        if not SaveFile(False) then
          Exit;
      ID_CANCEL:
        Exit;
    end;
  OpenDialog.FileName := AFileName;
  if (AFileName <> '') or OpenDialog.Execute then
  begin
    FileName := OpenDialog.FileName;
    Editor.Lines.LoadFromFile(FileName);
    SetModified(False);
  end;
end;

procedure TRibbonDemoMainForm.pbFrameBackgroundPaint(Sender: TObject);
begin
  with Sender as TPaintBox do
  begin
    dxGpFillRect(Canvas.Handle, ClientRect, clWhite, 200);
    ExcludeClipRect(Canvas.Handle, 1, 1, Width - 1, Height - 1);
    dxGpFillRect(Canvas.Handle, ClientRect, clWhite);
  end;
end;

procedure TRibbonDemoMainForm.pbSeparatorPaint(Sender: TObject);
begin
  with Sender as TPaintBox do
    Ribbon.ColorScheme.DrawMenuSeparatorHorz(Canvas.Handle, ClientRect);
end;

function TRibbonDemoMainForm.QuerySaveFile: Integer;
begin
  Result := Application.MessageBox(
    PChar(Format('Do you want to save the changes you made to "%s"?', [Ribbon.DocumentName])),
    PChar(Application.Title), MB_ICONQUESTION or MB_YESNOCANCEL);
end;

function TRibbonDemoMainForm.SaveFile(ASaveAs: Boolean; APlainText: Boolean = False): Boolean;
begin
  SaveDialog.FileName := ChangeFileExt(ExtractFileName(FileName), '');

  if APlainText then
    SaveDialog.Filter := TXTFilter
  else
    SaveDialog.Filter := RTFFilter;

  ASaveAs := ASaveAs or (FileName = '') or (FileName = sDefaultDocName);
  Result := not ASaveAs or SaveDialog.Execute;
  if Result then
  begin
    Editor.PlainText := APlainText;
    Editor.Lines.SaveToFile(SaveDialog.FileName);
    if not APlainText then
    begin
      SetModified(False);
      if ASaveAs then
        FileName := SaveDialog.FileName;
    end;
    Editor.PlainText := False;
  end;
end;

procedure TRibbonDemoMainForm.SetColorScheme(const AName: string);
begin
  Ribbon.ColorSchemeName := AName;
  Panel1.Color := Ribbon.ColorScheme.GetPartColor(rfspRibbonForm);
  dxStatusBar.Invalidate;
end;

procedure TRibbonDemoMainForm.SetModified(Value: Boolean);
begin
  Editor.Modified := Value;
  if Value then
  begin
    stModified.ImageIndex := 2;
    stModified.Caption := 'Modified';
  end
  else
  begin
    stModified.ImageIndex := -1;
    stModified.Caption := '';
  end;
  dxBarButtonSave.Enabled := Value;
end;

procedure TRibbonDemoMainForm.ShowItems(AShow: Boolean);
begin
  BarManager.LockUpdate := True;
  try
    if not AShow then
    begin
      btnLineNumber.Caption := '';
      btnColumnNumber.Caption := '';
      stModified.Caption := '';
    end;
    BarManager.Groups[0].Enabled := AShow;
  finally
    BarManager.LockUpdate := False;
  end;
end;

procedure TRibbonDemoMainForm.UpdateActionsImages;
begin
  dxBarButton7.LargeImageIndex := 18;
  dxBarButton7.ImageIndex := 18;
  dxBarLargeButton1.LargeImageIndex := 18;
  dxBarLargeButton1.ImageIndex := 18;
  dxBarButton1.LargeImageIndex := 19;
  dxBarButton1.ImageIndex := 19;
  dxBarButton3.LargeImageIndex := 20;
  dxBarButton3.ImageIndex := 20;
  dxBarButton4.LargeImageIndex := 21;
  dxBarButton4.ImageIndex := 21;
  dxBarButton5.LargeImageIndex := 22;
  dxBarButton5.ImageIndex := 22;
end;

procedure TRibbonDemoMainForm.UpdateRibbonDemoStyle(AStyle: TRibbonDemoStyle);
const
  NamesMap: array[TdxRibbonStyle] of string = ('RIBBONAPPGLYPH', 'RIBBONAPPGLYPH2010');
  StyleMap: array[TRibbonDemoStyle] of TdxRibbonStyle = (rs2007, rs2010, rs2010);
begin
  Ribbon.Style := StyleMap[AStyle];
  Ribbon.EnableTabAero := AStyle = rdsOffice2010;
  if AStyle = rdsOffice2010 then
    Ribbon.ApplicationButton.Menu := BackstageView
  else
    Ribbon.ApplicationButton.Menu := ApplicationMenu;

  Ribbon.ApplicationButton.Glyph.LoadFromResourceName(HInstance, NamesMap[Ribbon.Style]);
  Ribbon.ApplicationButton.StretchGlyph := Ribbon.Style = rs2007;
  tabHelp.Visible := AStyle <> rdsOffice2010;
end;

procedure TRibbonDemoMainForm.AssignFontColorGlyph;
begin
  dxBarButtonFontColor.Glyph := rgiFontColor.Glyph;
end;

procedure TRibbonDemoMainForm.FontColorChanged(Sender: TObject);
begin
  AssignFontColorGlyph;
  dxBarButtonFontColorClick(nil);
end;

procedure TRibbonDemoMainForm.SetFontColor;
begin
  Editor.SelAttributes.Color := FColorPickerController.Color;
  FEditorUndoController.AddAction(6);
end;

procedure TRibbonDemoMainForm.Undo(Count: Integer);
begin
  FEditorUndoController.Lock;
  try
    while Count > 0 do
    begin
      SendMessage(Editor.Handle, EM_UNDO, 0, 0);
      FEditorUndoController.PopUndo;
      Dec(Count);
    end;
  finally
    FEditorUndoController.Unlock;
  end;
end;

procedure TRibbonDemoMainForm.FormActivate(Sender: TObject);
begin
  if FCanOnChange then
    Editor.OnChange(Editor)
  else
    FCanOnChange := True;
end;

procedure TRibbonDemoMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Editor.Modified then
    case QuerySaveFile of
      ID_YES: CanClose := SaveFile(False);
      ID_NO: CanClose := True;
      ID_CANCEL: CanClose := False;
    end;
end;

procedure TRibbonDemoMainForm.FormCreate(Sender: TObject);
var
  ATextWidth: Integer;
begin
  OpenDialog.Filter := RTFFilter;
  OpenDialog.InitialDir := ExtractFilePath(ParamStr(0));
  SaveDialog.InitialDir := OpenDialog.InitialDir;
  ShowItems(True);
  UpdateActionsImages;

  FColorPickerController := TColorPickerController.Create(rgiFontColor, rgiColorTheme, ppmFontColor, Ribbon);
  FColorPickerController.OnColorChanged := FontColorChanged;
  AssignFontColorGlyph;

  InitSymbolGallery;
  SetColorScheme('Blue');

  FEditorUndoController := TRichEditUndoController.Create(rgiUndo, Editor);
  Editor.OnChange(Editor);

  ATextWidth := cxTextWidth(BarManager.Font, 'Undo 9999 Actions');
  with rgiUndo do
  begin
    GalleryOptions.ItemPullHighlighting.Active := True;
    GalleryOptions.ColumnCount := 1;

    GalleryOptions.SubMenuResizing := gsrNone;

    GalleryOptions.ItemSize.Width := ATextWidth;
    GalleryOptions.ItemSize.Height := Max(cxTextHeight(BarManager.Font), Round(21 * DPIRatio));

    GalleryGroups.Add;
  end;
  bstSelectionInfo.Width := ATextWidth;
  bstSelectionInfo.Caption := 'Cancel';
  UpdateRibbonDemoStyle(rdsOffice2010);

  meAbout.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + 'About.txt');
  lblSupport.OnClick := dmCommonData.actSupport.OnExecute;
  lblHelpBars.OnClick := dmCommonData.actBarsHelp.OnExecute;
  lblHelpDocking.OnClick := dmCommonData.actDockingHelp.OnExecute;
  lblProducts.OnClick := dmCommonData.actProducts.OnExecute;
  lblClientCenter.OnClick := dmCommonData.actMyDX.OnExecute;
  lblDXonWeb.OnClick := dmCommonData.actDXOnTheWeb.OnExecute;
  lblDownloads.OnClick := dmCommonData.actDownloads.OnExecute;

  if FileExists(sDefaultDocName) then
    OpenFile(ExpandFileName(sDefaultDocName))
  else
    FileName := sDefaultDocName;

{$IFDEF EXPRESSSKINS}
  SkinChooserSetup;
{$ENDIF}
end;

procedure TRibbonDemoMainForm.InitSymbolGallery;

  procedure AddItem(AGroup: TdxRibbonGalleryGroup; ACode: Integer);

    function CreateBitmap(const AFont: string; AChar: WideChar): TcxAlphaBitmap;
    var
      AGlyphSize: Integer;
      R: TRect;
    begin
      AGlyphSize := Round(32 * DPIRatio);
      R := Rect(0, 0, AGlyphSize, AGlyphSize);
      Result := TcxAlphaBitmap.CreateSize(R);
      Result.Canvas.Brush.Color := $FAFAFA;
      Result.Canvas.FillRect(R);
      Result.Canvas.Font.Name := AFont;
      Result.Canvas.Font.Color := $5C534C;
      Result.Canvas.Font.Size := Round(16 * DPIRatio);
      DrawTextW(Result.Canvas.Handle, @AChar, 1, R, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
      Result.TransformBitmap(btmSetOpaque);
    end;

  var
    AItem: TdxRibbonGalleryGroupItem;
    AFont: string;
    ABitmap: TcxAlphaBitmap;
  begin
    AItem := AGroup.Items.Add;
    AFont := 'Times New Roman';
    AItem.Caption := AFont + ' #' + IntToStr(ACode);
    AItem.Description := AFont;
    AItem.Tag := ACode;
    ABitmap := CreateBitmap(AFont, WideChar(ACode));
    AItem.Glyph := ABitmap;
    ABitmap.Free;
  end;

  procedure PopulateGroup(AGroupIndex: Integer; AMap: array of Integer);
  var
    I: Integer;
  begin
    for I := Low(AMap) to High(AMap) do
      AddItem(rgiItemSymbol.GalleryGroups[AGroupIndex], AMap[I]);
  end;

const
  AMathMap: array [0..7] of Integer = ($B1, $2260, $2264, $2265, $F7, $D7, $221E, $2211);
  AGreekMap: array [0..9] of integer = ($03B1, $03B2, $03B3, $03B4, $03B5, $03B6, $03B7, $03B8, $03B9, $03BA);
  ASymbolMap: array [0..2] of Integer = ($A9, $AE, $2122);
  ACurrencyMap: array [0..4] of Integer = ($20AC, $24, $A3, $A5, $20A3);
begin
  BarManager.BeginUpdate;
  try
    PopulateGroup(0, AMathMap);
    PopulateGroup(1, AGreekMap);
    PopulateGroup(2, ASymbolMap);
    PopulateGroup(3, ACurrencyMap);
  finally
    BarManager.EndUpdate;
  end;
end;

procedure TRibbonDemoMainForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FEditorUndoController);
  FreeAndNil(FColorPickerController);
end;

procedure TRibbonDemoMainForm.dxBarButtonNewClick(Sender: TObject);
begin
  if Editor.Modified then
    case QuerySaveFile of
      ID_YES:
        if SaveFile(False) then
          MakeNewDocument;
      ID_NO:
        MakeNewDocument;
    end
  else
    MakeNewDocument;
end;

procedure TRibbonDemoMainForm.dxBarButtonOpenClick(Sender: TObject);
begin
  OpenFile('');
end;

procedure TRibbonDemoMainForm.dxBarButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TRibbonDemoMainForm.dxBarButtonSaveClick(Sender: TObject);
begin
  SaveFile(False);
end;

procedure TRibbonDemoMainForm.dxBarButtonSaveAsRTFClick(Sender: TObject);
begin
  SaveFile(True);
end;

procedure TRibbonDemoMainForm.dxBarButtonSaveAsTextClick(Sender: TObject);
begin
  SaveFile(True, True);
end;

procedure TRibbonDemoMainForm.dxBarButtonPrintClick(Sender: TObject);
begin
  if PrintDialog.Execute then Editor.Print(FileName);
end;

procedure TRibbonDemoMainForm.dxBarButtonExitClick(Sender: TObject);
begin
  Close;
end;

procedure TRibbonDemoMainForm.dxBarButtonUndoClick(Sender: TObject);
begin
  Undo(1);
end;

procedure TRibbonDemoMainForm.dxBarButtonCutClick(Sender: TObject);
begin
  Editor.CutToClipboard;
end;

procedure TRibbonDemoMainForm.dxBarButtonCopyClick(Sender: TObject);
begin
  Editor.CopyToClipboard;
end;

procedure TRibbonDemoMainForm.dxBarButtonPasteClick(Sender: TObject);
begin
  Editor.PasteFromClipboard;
end;

procedure TRibbonDemoMainForm.dxBarButtonClearClick(Sender: TObject);
begin
  Editor.ClearSelection;
end;

procedure TRibbonDemoMainForm.dxBarButtonSelectAllClick(Sender: TObject);
begin
  Editor.SelectAll;
end;

procedure TRibbonDemoMainForm.dxBarButtonFindClick(Sender: TObject);
begin
  Editor.SelLength := 0;
  FindDialog.Execute;
end;

procedure TRibbonDemoMainForm.dxBarButtonReplaceClick(Sender: TObject);
begin
  Editor.SelLength := 0;
  ReplaceDialog.Execute;
end;

procedure TRibbonDemoMainForm.dxBarComboFontNameChange(Sender: TObject);
begin
  if not FUpdating then
    Editor.SelAttributes.Name := dxBarComboFontName.Text;
end;

procedure TRibbonDemoMainForm.dxBarComboFontSizeChange(Sender: TObject);
begin
  if not FUpdating then
    Editor.SelAttributes.Size := StrToInt(dxBarComboFontSize.Text);
end;

procedure TRibbonDemoMainForm.dxBarButtonBoldClick(Sender: TObject);
begin
  with Editor.SelAttributes do
    if dxBarButtonBold.Down then
      Style := Style + [fsBold]
    else
      Style := Style - [fsBold];
end;

procedure TRibbonDemoMainForm.dxBarButtonItalicClick(Sender: TObject);
begin
  with Editor.SelAttributes do
    if dxBarButtonItalic.Down then
      Style := Style + [fsItalic]
    else
      Style := Style - [fsItalic];
end;

procedure TRibbonDemoMainForm.dxBarButtonUnderlineClick(Sender: TObject);
begin
  with Editor.SelAttributes do
    if dxBarButtonUnderline.Down then
      Style := Style + [fsUnderline]
    else
      Style := Style - [fsUnderline];
end;

procedure TRibbonDemoMainForm.dxBarButtonBulletsClick(Sender: TObject);
begin
  Editor.Paragraph.Numbering := TNumberingStyle(dxBarButtonBullets.Down);
end;

procedure TRibbonDemoMainForm.btnLockedClick(Sender: TObject);
var
  AHint: string;
begin
  Editor.ReadOnly := TdxBarButton(Sender).Down;
  if Editor.ReadOnly then
  begin
    AHint := 'Editing protection: Read only. Click for editing.';
    cxStyle1.TextColor := clMaroon;
  end
  else
  begin
    AHint := 'Editing protection: Writable. Click for read-only mode.';
    cxStyle1.TextColor := clGray;
  end;
  TdxBarButton(Sender).Hint := AHint;
  EditorSelectionChange(nil);
end;

procedure TRibbonDemoMainForm.bvtsAboutResize(Sender: TObject);
var
  AOffset: Integer;
begin
  AOffset := Round(DPIRatio * 8);
  meAbout.SetBounds(AOffset, meAbout.Top, meAbout.Parent.ClientWidth - 2 * AOffset,
    meAbout.Parent.ClientHeight - AOffset - meAbout.Top);
  pbSeparator3.SetBounds(AOffset + 1, pbSeparator3.Top, meAbout.Width, 1);
end;

procedure TRibbonDemoMainForm.bvtsHelpResize(Sender: TObject);
begin
  imLogo.Left := imLogo.Parent.ClientWidth - imLogo.Width - Round(DPIRatio * 10);
end;

procedure TRibbonDemoMainForm.dxBarButtonAlignClick(Sender: TObject);
begin
  if TdxBarLargeButton(Sender).Down then
    Editor.Paragraph.Alignment := TAlignment(TdxBarLargeButton(Sender).Tag)
  else
    Editor.Paragraph.Alignment := taLeftJustify;
end;

procedure TRibbonDemoMainForm.dxBarButtonProtectedClick(Sender: TObject);
begin
  with Editor.SelAttributes do Protected := not Protected;
end;

procedure TRibbonDemoMainForm.FontClick(Sender: TObject);
begin
  FontDialog.Font.Assign(Editor.SelAttributes);
  if FontDialog.Execute then
    Editor.SelAttributes.Assign(FontDialog.Font);
end;

procedure TRibbonDemoMainForm.dxBarLargeButton10Click(Sender: TObject);
begin
  with Ribbon.QuickAccessToolbar do
  begin
    Visible := not Visible;
    dxBarLargeButton8.Enabled := Visible;
    dxBarLargeButton9.Enabled := Visible;
  end;
end;

procedure TRibbonDemoMainForm.dxBarLargeButtonBlueSchemeClick(Sender: TObject);
begin
  SetColorScheme('Blue');
end;

procedure TRibbonDemoMainForm.dxBarLargeButtonBlackSchemeClick(Sender: TObject);
begin
  SetColorScheme('Black');
end;

procedure TRibbonDemoMainForm.dxBarLargeButtonSilverSchemeClick(Sender: TObject);
begin
  SetColorScheme('Silver');
end;

procedure TRibbonDemoMainForm.dxBarLargeButton6Click(Sender: TObject);
begin
  with Ribbon do
  begin
    SupportNonClientDrawing := not SupportNonClientDrawing;
    dxBarLargeButton7.Enabled := SupportNonClientDrawing;
  end;
end;

procedure TRibbonDemoMainForm.dxBarLargeButton7Click(Sender: TObject);
begin
  Ribbon.ApplicationButton.Visible := not Ribbon.ApplicationButton.Visible;
end;

procedure TRibbonDemoMainForm.dxBarLargeButton8Click(Sender: TObject);
begin
  Ribbon.QuickAccessToolbar.Position := qtpAboveRibbon;
end;

procedure TRibbonDemoMainForm.dxBarLargeButton9Click(Sender: TObject);
begin
  Ribbon.QuickAccessToolbar.Position := qtpBelowRibbon;
end;

procedure TRibbonDemoMainForm.ApplicationMenuRecentDocumentsClick(
  Sender: TObject; AIndex: Integer);
begin
  OpenFile(ApplicationMenu.ExtraPaneItems[AIndex].Text);
end;

procedure TRibbonDemoMainForm.RibbonHelpButtonClick(
  Sender: TdxCustomRibbon);
begin
  ShowMessage('Clicked!');
end;

procedure TRibbonDemoMainForm.RibbonHideMinimizedByClick(
  Sender: TdxCustomRibbon; AWnd: Cardinal; AShift: TShiftState;
  const APos: TPoint; var AAllowProcessing: Boolean);
begin
  AAllowProcessing := AWnd <> Editor.Handle;
end;

procedure TRibbonDemoMainForm.dxBarButtonOptionsClick(Sender: TObject);

  function GetRibbonDemoStyle: TRibbonDemoStyle;
  begin
    if Ribbon.Style = rs2007 then
      Result := rdsOffice2007
    else
      if Ribbon.EnableTabAero then
        Result := rdsOffice2010
      else
        Result := rdsScenic;
  end;

  procedure UpdateColorScheme(AColorSchemeName: string);
  begin
    dxBarLargeButtonBlueScheme.Down := AColorSchemeName = 'Blue';
    dxBarLargeButtonBlackScheme.Down := AColorSchemeName = 'Black';
    dxBarLargeButtonSilverScheme.Down := AColorSchemeName = 'Silver';
    SetColorScheme(AColorSchemeName);
  end;

var
  AColorSchemeName: string;
  AScreenTipOptions: TScreenTipOptions;
  AStyle: TRibbonDemoStyle;
begin
  AStyle := GetRibbonDemoStyle;
  AColorSchemeName := Ribbon.ColorSchemeName;
  AScreenTipOptions.ShowScreenTips := BarManager.ShowHint;
  AScreenTipOptions.ShowDescripitons := dxBarScreenTipRepository1.ShowDescription;
  if ExecuteRibbonDemoOptions(AColorSchemeName, AScreenTipOptions, AStyle) then
  begin
    UpdateRibbonDemoStyle(AStyle);
    UpdateColorScheme(AColorSchemeName);
    BarManager.ShowHint := AScreenTipOptions.ShowScreenTips;
    dxBarScreenTipRepository1.ShowDescription := AScreenTipOptions.ShowDescripitons;
  end;
end;

procedure TRibbonDemoMainForm.dxBarButtonFontColorClick(Sender: TObject);
begin
  SetFontColor;
end;

{ TColorPickerController }

constructor TColorPickerController.Create(AColorItem,
  AColorMapItem: TdxRibbonGalleryItem; AFontColorPopupMenu: TdxRibbonPopupMenu; ARibbon: TdxCustomRibbon);

  procedure InitColorItem;
  begin
    FColorItem.GalleryOptions.EqualItemSizeInAllGroups := False;
    FColorItem.GalleryOptions.ColumnCount := SchemeColorCount;
    FColorItem.GalleryOptions.SpaceBetweenGroups := 4;
    FColorItem.GalleryOptions.ItemTextKind := itkNone;
    FColorItem.OnGroupItemClick := ColorItemClick;

    FThemeColorsGroup := FColorItem.GalleryGroups.Add;
    FThemeColorsGroup.Header.Caption := 'Theme Colors';
    FThemeColorsGroup.Header.Visible := True;
    FAccentColorsGroup := FColorItem.GalleryGroups.Add;
    FStandardColorsGroup := FColorItem.GalleryGroups.Add;
    FStandardColorsGroup.Header.Caption := 'Standard Colors';
    FStandardColorsGroup.Header.Visible := True;
    FCustomColorsGroup := FColorItem.GalleryGroups.Add;
    FCustomColorsGroup.Header.Caption := 'Custom Colors';
    AColorItem.GalleryGroups[1].Options.SpaceBetweenItemsVertically := -1;
  end;

  procedure InitColorMapItem;
  begin
    FColorMapItem.GalleryOptions.ColumnCount := 1;
    FColorMapItem.GalleryOptions.SpaceBetweenItemsAndBorder := 0;
    FColorMapItem.GalleryOptions.ItemTextKind := itkCaption;
    FColorMapItem.GalleryGroups.Add;
    FColorMapItem.OnGroupItemClick := ColorMapItemClick;
  end;

  procedure InitDropDownGallery;
  var
    ANoColorGlyph: TBitmap;
  begin
    FNoColorButton := TdxBarButton(AFontColorPopupMenu.ItemLinks.AddButton.Item);
    FNoColorButton.ButtonStyle := bsChecked;
    FNoColorButton.Caption := '&No Color';
    FNoColorButton.OnClick := NoColorButtonClick;
    ANoColorGlyph := CreateColorBitmap(clNone, 16);
    FNoColorButton.Glyph := ANoColorGlyph;
    ANoColorGlyph.Free;
    AFontColorPopupMenu.ItemLinks.Add(AColorItem);
    FMoreColorsButton := TdxBarButton(AFontColorPopupMenu.ItemLinks.AddButton.Item);
    FMoreColorsButton.Caption := '&More Colors...';
    FMoreColorsButton.OnClick := MoreColorsClick;
    FColorDialogSetup := TdxBarButton(AFontColorPopupMenu.ItemLinks.AddButton.Item);
    FColorDialogSetup.Caption := '&Setup...';
    FColorDialogSetup.OnClick := ColorDialogSetupButtonClick;
  end;

  procedure PopulateGalleries;
  begin
    BuildColorSchemeGallery;
    BuildStandardColorGallery;
  end;

  procedure SelectDefaultColor;
  begin
    FNoColorButton.Click;
  end;

begin
  inherited Create;
  FRibbon := ARibbon;
  FColorItem := AColorItem;
  FColorMapItem := AColorMapItem;
  FColorGlyphSize := cxTextHeight(FRibbon.Fonts.Group);
  FColorDialog := TColorDialog.Create(nil);

  InitColorMapItem;
  InitColorItem;
  InitDropDownGallery;
  PopulateGalleries;
  SelectDefaultColor;
end;

destructor TColorPickerController.Destroy;
begin
  FreeAndNil(FColorDialog);
  inherited;
end;

function TColorPickerController.AddColorItem(AGalleryGroup: TdxRibbonGalleryGroup; AColor: TColor): TdxRibbonGalleryGroupItem;
var
  ABitmap: TcxAlphaBitmap;
  AColorName: string;
begin
  Result := AGalleryGroup.Items.Add;

  ABitmap := CreateColorBitmap(AColor);
  try
    Result.Glyph := ABitmap;
    if cxNameByColor(AColor, AColorName) then
      Result.Caption := AColorName
    else
      Result.Caption := '$' + IntToHex(AColor, 6);
    Result.Tag := AColor;
  finally
    ABitmap.Free;
  end;
end;

function TColorPickerController.CreateColorBitmap(AColor: TColor; AGlyphSize: Integer): TcxAlphaBitmap;
begin
  if AGlyphSize = 0 then
    AGlyphSize := FColorGlyphSize;
  Result := TcxAlphaBitmap.CreateSize(AGlyphSize, AGlyphSize);
  FillRectByColor(Result.Canvas.Handle, Result.ClientRect, AColor);
  FrameRectByColor(Result.Canvas.Handle, Result.ClientRect, clGray);
  if AColor = clNone then
    Result.RecoverAlphaChannel(0)
  else
    Result.TransformBitmap(btmSetOpaque);
end;

procedure TColorPickerController.CreateColorRow(AGalleryGroup: TdxRibbonGalleryGroup; AColorMap: TColorMap);
var
  I: Integer;
begin
  for I := Low(AColorMap) to High(AColorMap) do
    AddColorItem(AGalleryGroup, AColorMap[I]);
end;

procedure TColorPickerController.BuildThemeColorGallery;

const
  AnAccentCount = 5;

  function GetBrightness(ARGBColor: DWORD): Integer;
  begin
    Result := (GetBValue(ARGBColor) + GetGValue(ARGBColor) + GetRValue(ARGBColor)) div 3;
  end;

  procedure GetAccentColorScheme(AColorMap: TColorMap; var AnAccentColorScheme: array of TColorMap);

    procedure CreateAccent(AnAccents: array of TAccent; AMapIndex: Integer);
    var
      I: Integer;
      AColor: TColor;
    begin
      for I := Low(AnAccents) to High(AnAccents) do
      begin
        case AnAccents[I] of
          aLight80: AColor := Light(AColorMap[AMapIndex], 80);
          aLight60: AColor := Light(AColorMap[AMapIndex], 60);
          aLight50: AColor := Light(AColorMap[AMapIndex], 50);
          aLight40: AColor := Light(AColorMap[AMapIndex], 40);
          aLight35: AColor := Light(AColorMap[AMapIndex], 35);
          aLight25: AColor := Light(AColorMap[AMapIndex], 25);
          aLight15: AColor := Light(AColorMap[AMapIndex], 15);
          aLight5: AColor := Light(AColorMap[AMapIndex], 5);
          aDark10: AColor := Dark(AColorMap[AMapIndex], 90);
          aDark25: AColor := Dark(AColorMap[AMapIndex], 75);
          aDark50: AColor := Dark(AColorMap[AMapIndex], 50);
          aDark75: AColor := Dark(AColorMap[AMapIndex], 25);
        else {aDark90}
          AColor := Dark(AColorMap[I], 10);
        end;
        AnAccentColorScheme[I][AMapIndex] := AColor;
      end;
    end;

  var
    I: Integer;
  begin
    for I := Low(AColorMap) to High(AColorMap) do
      if GetBrightness(ColorToRGB(AColorMap[I])) < 20 then
        CreateAccent([aLight50, aLight35, aLight25, aLight15, aLight5], I)
      else
        if GetBrightness(ColorToRGB(AColorMap[I])) < 230 then
          CreateAccent([aLight80, aLight60, aLight60, aDark25, aDark50], I)
        else
          CreateAccent([aDark10, aDark25, aDark50, aDark75, aDark90], I)
  end;

var
  I: Integer;
  AColorMap: TColorMap;
  AnAccentColorScheme: array [0..AnAccentCount-1] of TColorMap;
begin
  BarManager.BeginUpdate;
  try
    FThemeColorsGroup.Items.Clear;
    AColorMap := AColorMaps[FColorMapItem.SelectedGroupItem.Index].Map;
    CreateColorRow(FThemeColorsGroup, AColorMap);

    FAccentColorsGroup.Items.Clear;
    GetAccentColorScheme(AColorMap, AnAccentColorScheme);
    for I := Low(AnAccentColorScheme) to High(AnAccentColorScheme) do
      CreateColorRow(FAccentColorsGroup, AnAccentColorScheme[I]);
  finally
    BarManager.EndUpdate;
  end;
end;

procedure TColorPickerController.BuildStandardColorGallery;
begin
  BarManager.BeginUpdate;
  try
    FStandardColorsGroup.Items.Clear;
    CreateColorRow(FStandardColorsGroup, AStandardColorMap);
  finally
    BarManager.EndUpdate;
  end;
end;

procedure TColorPickerController.BuildColorSchemeGallery;
const
  ASystemColorCount = 2;
  AGlyphOffset = 1;
var
  I, J: Integer;
  ABitmap, AColorBitmap: TcxAlphaBitmap;
  ARect: TRect;
  AGroupItem: TdxRibbonGalleryGroupItem;
  AThemeColorCount: Integer;
begin
  BarManager.BeginUpdate;
  try
    AThemeColorCount := SchemeColorCount - ASystemColorCount;
    ABitmap := TcxAlphaBitmap.CreateSize(FColorGlyphSize * AThemeColorCount + (AThemeColorCount - 1) * AGlyphOffset, FColorGlyphSize);
    try
      for I := High(AColorMaps) downto Low(AColorMaps) do
      begin
        AGroupItem := FColorMapItem.GalleryGroups[0].Items.Insert(0);
        for J := Low(AColorMaps[I].Map) + ASystemColorCount to High(AColorMaps[I].Map) do
        begin
          AColorBitmap := CreateColorBitmap(AColorMaps[I].Map[J]);
          try
            ARect := cxRectOffset(AColorBitmap.ClientRect, (AColorBitmap.Width + AGlyphOffset) * (J - ASystemColorCount), 0);
            ABitmap.CopyBitmap(AColorBitmap, ARect, cxNullPoint);
          finally
            AColorBitmap.Free;
          end;
        end;
        AGroupItem.Glyph := ABitmap;
        AGroupItem.Caption := AColorMaps[I].Name;
      end;
      AGroupItem.Selected := True;
    finally
      ABitmap.Free;
    end;
  finally
    BarManager.EndUpdate;
  end;
end;

procedure TColorPickerController.ColorChanged;
var
  AGlyph: TcxAlphaBitmap;
begin
  AGlyph := CreateColorBitmap(Color, Round(16 * DPIRatio));
  try
    FColorItem.Glyph := AGlyph;
  finally
    AGlyph.Free;
  end;

  if Assigned(OnColorChanged) then
    OnColorChanged(Self);
end;

procedure TColorPickerController.ColorMapChanged;

  procedure FillGlyph(AGlyph: TcxAlphaBitmap);
  var
    ARect: TRect;
    ADC: HDC;
  begin
    ARect := Rect(0, 0, AGlyph.Width div 2, AGlyph.Height div 2);
    ADC := AGlyph.Canvas.Handle;
    FillRectByColor(ADC, ARect, AColorMaps[FColorMapItem.SelectedGroupItem.Index].Map[2]);
    FillRectByColor(ADC, cxRectOffset(ARect, cxRectWidth(ARect), 0), AColorMaps[FColorMapItem.SelectedGroupItem.Index].Map[3]);
    FillRectByColor(ADC, cxRectOffset(ARect, 0, cxRectHeight(ARect)), AColorMaps[FColorMapItem.SelectedGroupItem.Index].Map[4]);
    FillRectByColor(ADC, cxRectOffset(ARect, cxRectWidth(ARect), cxRectHeight(ARect)), AColorMaps[FColorMapItem.SelectedGroupItem.Index].Map[5]);
    FrameRectByColor(ADC, AGlyph.ClientRect, clGray);
    AGlyph.TransformBitmap(btmSetOpaque);
  end;

var
  AGlyph: TcxAlphaBitmap;
begin
  BarManager.BeginUpdate;
  try
    AGlyph := TcxAlphaBitmap.CreateSize(16, 16);
    FillGlyph(AGlyph);
    FColorMapItem.Glyph := AGlyph;
    AGlyph.SetSize(32, 32);
    FillGlyph(AGlyph);
    FColorMapItem.LargeGlyph := AGlyph;
    AGlyph.Free;
  finally
    BarManager.EndUpdate(False);
  end
end;

function TColorPickerController.GetBarManager: TdxBarManager;
begin
  Result := FColorItem.BarManager;
end;

procedure TColorPickerController.SetColor(Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    ColorChanged;
  end;
end;

procedure TColorPickerController.ColorItemClick(Sender: TdxRibbonGalleryItem; AItem: TdxRibbonGalleryGroupItem);
begin
  FNoColorButton.Down := False;
  if FColorItem.SelectedGroupItem <> nil then
    SetColor(FColorItem.SelectedGroupItem.Tag);
end;

procedure TColorPickerController.ColorMapItemClick(Sender: TdxRibbonGalleryItem; AItem: TdxRibbonGalleryGroupItem);
begin
  BuildThemeColorGallery;
  ColorMapChanged;
end;

procedure TColorPickerController.NoColorButtonClick(Sender: TObject);
begin
  if FColorItem.SelectedGroupItem <> nil then
    FColorItem.SelectedGroupItem.Selected := False;
  SetColor(clNone);
end;

procedure TColorPickerController.MoreColorsClick(Sender: TObject);
begin
  FColorDialog.Color := Color;
  if FColorDialog.Execute then
  begin
    FCustomColorsGroup.Header.Visible := True;
    AddColorItem(FCustomColorsGroup, FColorDialog.Color).Selected := True;
  end;
end;

procedure TColorPickerController.ColorDialogSetupButtonClick(Sender: TObject);
var
  RemoveHorizontalPadding, RemoveVerticalPadding: Boolean;
begin
  RemoveHorizontalPadding := FColorItem.GalleryOptions.SpaceBetweenItemsHorizontally = -1;
  RemoveVerticalPadding := FColorItem.GalleryGroups[1].Options.SpaceBetweenItemsVertically = -1;
  if ColorDialogSetupForm.GetSettings(RemoveHorizontalPadding,
    RemoveVerticalPadding) then
  begin
    FColorItem.GalleryOptions.SpaceBetweenItemsHorizontally :=
      -Ord(RemoveHorizontalPadding);
    FColorItem.GalleryGroups[1].Options.SpaceBetweenItemsVertically :=
      -Ord(RemoveVerticalPadding);
  end;
end;

type
  TClipboardAccess = class(TClipboard);

procedure TRibbonDemoMainForm.rgiItemSymbolGroupItemClick(
  Sender: TdxRibbonGalleryItem; AItem: TdxRibbonGalleryGroupItem);

  procedure InsertSymbol(AChar: WideChar);
  var
    S: WideString;
  begin
    Editor.SelAttributes.Name := AItem.Description;
    with TClipboardAccess(Clipboard) do
    begin
      Open;
      try
        S := AChar;
        SetBuffer(CF_UNICODETEXT, PWideChar(S)^, (Length(S) + 1) * SizeOf(WideChar));
      finally
        Close;
      end;
    end;
    Editor.PasteFromClipboard;
  end;

begin
  InsertSymbol(WideChar(AItem.Tag));
end;

{ TRichEdit }

type
  TStringsArray = array of string;

var
  FRichEditLibrary: HMODULE = 0;

procedure TRichEdit.CreateParams(var Params: TCreateParams);

  procedure InitRichEditClassNames(var ARichEditClassNames: TStringsArray);
  const
    RichEditClassNamesCount = 5;
  begin
    SetLength(ARichEditClassNames, RichEditClassNamesCount);
    ARichEditClassNames[0] := 'RICHEDIT';
    ARichEditClassNames[1] := 'RICHEDIT20';
    ARichEditClassNames[2] := 'RICHEDIT30';
    ARichEditClassNames[3] := 'RICHEDIT41';
    ARichEditClassNames[4] := 'RICHEDIT50';
  end;

var
  ARichClassName: string;
  AWndClass: TWndClass;
  I: Integer;
  ARichEditClassNames: TStringsArray;
begin
  inherited;

  if FRichEditLibrary <> 0 then
  begin
    InitRichEditClassNames(ARichEditClassNames);
    for I := High(ARichEditClassNames) downto Low(ARichEditClassNames) do
    begin
      ARichClassName := ARichEditClassNames[I] + 'A';
      if GetClassInfo(HInstance, PChar(ARichClassName), AWndClass) then
        Break;
      ARichClassName := ARichEditClassNames[I];
      if GetClassInfo(HInstance, PChar(ARichClassName), AWndClass) then
        Break;
    end;
    if GetClassInfo(HInstance, PChar(ARichClassName), AWndClass) then
      CreateSubClass(Params, PChar(ARichClassName));
  end;
end;

procedure LoadRichDll;

  procedure InitRichEditDLLNames(var ARichEditDLLNames: TStringsArray);
  const
    RichEditDLLNamesCount = 3;
  begin
    SetLength(ARichEditDLLNames, RichEditDLLNamesCount);
    ARichEditDLLNames[0] :=  'Riched32.dll';
    ARichEditDLLNames[1] :=  'Riched20.dll';
    ARichEditDLLNames[2] :=  'Msftedit.dll';
  end;

var
  ARichEditDLLNames: TStringsArray;
  I: Integer;
begin
  InitRichEditDLLNames(ARichEditDLLNames);
  for I := High(ARichEditDLLNames) downto Low(ARichEditDLLNames) do
  begin
    FRichEditLibrary := LoadLibrary(PChar(ARichEditDLLNames[I]));
    if FRichEditLibrary <> 0 then
      Break;
  end;
end;

constructor TRichEditUndoController.Create(AGalleryItem: TdxRibbonGalleryItem;
  AEditor: TRichEdit);
begin
  inherited Create;
  FGalleryItem := AGalleryItem;
  FEditor := AEditor;
end;

procedure TRichEditUndoController.AnalyseMessage;
var
  AMessageID: Integer;
begin
  if FIsLocked then Exit;
  AMessageID := SendMessage(FEditor.Handle, EM_GETUNDONAME, 0, 0);
  if (AMessageID > 1) or (AMessageID = 1) and (AMessageID <> FLastMessageID) then
    AddAction(AMessageID);
end;

procedure TRichEditUndoController.Lock;
begin
  FIsLocked := True;
  FLastMessageID := 0;
end;

procedure TRichEditUndoController.UnLock;
begin
  FIsLocked := False;
end;

procedure TRichEditUndoController.AddAction(AnActionID: Integer);
const
  RichEditAction: array[0..6] of string = ('Unknown', 'Typing', 'Delete',
    'Drag And Drop', 'Cut', 'Paste', 'Color Change');
begin
  if (AnActionID <> 6) or (FEditor.GetSelLength <> 0) then
    PushUndo(RichEditAction[AnActionID]);
  FLastMessageID := AnActionID;
end;

procedure TRichEditUndoController.PopUndo;
var
  AGroup: TdxRibbonGalleryGroup;
begin
  AGroup := FGalleryItem.GalleryGroups[0];
  if AGroup.Items.Count > 0 then
    AGroup.Items.Delete(0);
end;

procedure TRichEditUndoController.PushUndo(AnAction: string);
var
  AGroup: TdxRibbonGalleryGroup;
begin
  AGroup := FGalleryItem.GalleryGroups[0];
  AGroup.Items.Insert(0);
  AGroup.Items[0].Caption := AnAction;
end;

procedure TRibbonDemoMainForm.rgiUndoHotTrackedItemChanged(
  APrevHotTrackedGroupItem,
  ANewHotTrackedGroupItem: TdxRibbonGalleryGroupItem);
var
  ACount: Integer;
  AString: string;
begin
  if ANewHotTrackedGroupItem <> nil then
  begin
    ACount := ANewHotTrackedGroupItem.Index + 1;
    bstSelectionInfo.Caption := 'Undo ' + IntToStr(ACount);
    if ACount = 1 then
      AString := ' Action'
    else
      AString := ' Actions';
    bstSelectionInfo.Caption := bstSelectionInfo.Caption + AString;
  end
  else
    bstSelectionInfo.Caption := 'Cancel';
end;

procedure TRibbonDemoMainForm.rgiUndoGroupItemClick(
  Sender: TdxRibbonGalleryItem; AItem: TdxRibbonGalleryGroupItem);
begin
  Undo(AItem.Index + 1);
end;

initialization
  LoadRichDll;

finalization
  if FRichEditLibrary <> 0 then
    FreeLibrary(FRichEditLibrary);

end.

