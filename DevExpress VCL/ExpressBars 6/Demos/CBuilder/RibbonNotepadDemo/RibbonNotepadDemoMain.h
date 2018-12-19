//---------------------------------------------------------------------------

#ifndef RibbonNotepadDemoMainH
#define RibbonNotepadDemoMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ActnList.hpp>
#include <Dialogs.hpp>
#include <ImgList.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
#include <Menus.hpp>
#include <math.hpp>

#include "cxControls.hpp"
#include "cxClasses.hpp"
#include "cxGraphics.hpp"
#include "dxBar.hpp"
#include "dxBarExtItems.hpp"
#include "dxStatusBar.hpp"
#include "dxRibbon.hpp"
#include "dxRibbonForm.hpp"
#include "dxRibbonStatusBar.hpp"
#include "dxsbar.hpp"
#include "EBarsUtils.h"
#include "RibbonDemoAbout.h"
#include "cxStyles.hpp"
#include "dxRibbonGallery.hpp"
//---------------------------------------------------------------------------

const
  SchemeColorCount = 10;

struct TColorMapInfo
{
  char *Name;
  TColor Map[SchemeColorCount];
};

enum TAccent {aLight80, aLight60, aLight50, aLight40, aLight35, aLight25, aLight15, aLight5, aDark10, aDark25, aDark50, aDark75, aDark90};

class TColorPickerController : public TObject
{
  private:
    TColor FColor;
    int FColorGlyphSize;
    TColorDialog *FColorDialog;
    TdxRibbonDropDownGallery *FColorDropDownGallery;
    TdxRibbonGalleryItem *FColorItem;
    TdxRibbonGalleryItem *FColorMapItem;

    TdxRibbonGalleryGroup *FThemeColorsGroup;
    TdxRibbonGalleryGroup *FAccentColorsGroup;
    TdxRibbonGalleryGroup *FStandardColorsGroup;
    TdxRibbonGalleryGroup *FCustomColorsGroup;

    TdxBarButton *FMoreColorsButton;
	TdxBarButton *FNoColorButton;
	TdxBarButton *FColorDialogSetup;
	TNotifyEvent FOnColorChanged;

	TdxBarManager* GetBarManager();
	TdxCustomRibbon* GetRibbon();

	void InitColorItem();
	void InitColorMapItem();
	void InitDropDownGallery();
	void PopulateGalleries();
	void SelectDefaultColor();

	void FillGlyph(TcxAlphaBitmap *AGlyph);

	void SetColor(TColor Value);

	void __fastcall ColorItemClick(TdxRibbonGalleryItem *Sender, TdxRibbonGalleryGroupItem *AItem);
	void __fastcall ColorMapItemClick(TdxRibbonGalleryItem *Sender, TdxRibbonGalleryGroupItem *AItem);
	void __fastcall NoColorButtonClick(TObject *Sender);
	void __fastcall MoreColorsClick(TObject *Sender);
	void __fastcall ColorDialogSetupButtonClick(TObject *Sender);

	__property TdxBarManager* BarManager = {read = GetBarManager};
	__property TdxCustomRibbon* Ribbon = {read = GetRibbon};

  protected:
	TdxRibbonGalleryGroupItem* AddColorItem(TdxRibbonGalleryGroup *AGalleryGroup, TColor AColor);
	TcxAlphaBitmap* CreateColorBitmap(TColor AColor, int AGlyphSize);
	void CreateColorRow(TdxRibbonGalleryGroup *AGalleryGroup, const TColor *AColorMap);
	void BuildThemeColorGallery();
	void BuildStandardColorGallery();
	void BuildColorSchemeGallery();

	void ColorChanged();
	void ColorMapChanged();

  public:
	__fastcall TColorPickerController(TdxRibbonGalleryItem *AColorItem, TdxRibbonGalleryItem *AColorMapItem, TdxRibbonDropDownGallery *AColorDropDownGallery);
	__fastcall ~TColorPickerController();

	__property TColor Color = {read = FColor, write = SetColor};
	__property TNotifyEvent OnColorChanged = {read = FOnColorChanged, write = FOnColorChanged};
};

class  TRichEditUndoController : public TObject
{
  private:
	int FLastMessageID;
	bool FIsLocked;
	TdxRibbonGalleryItem *FGalleryItem;
	TRichEdit *FEditor;
  protected:
  public:
	__fastcall TRichEditUndoController(TdxRibbonGalleryItem *AGalleryItem, TRichEdit *AEditor);
	void AddAction(int AnActionID);
	void AnalyseMessage();
	void Lock();
	void PopUndo();
	void PushUndo(AnsiString AnAction);
	void UnLock();
};

class TRibbonDemoMainForm : public TdxCustomRibbonForm
{
__published:	// IDE-managed Components
    TdxBarManager *BarManager;

    TdxBarLargeButton *dxBarButtonNew;
    TdxBarLargeButton *dxBarButtonOpen;
    TdxBarLargeButton *dxBarButtonSave;
    TdxBarSubItem *dxBarSubItemSaveAs;
    TdxBarButton *dxBarButtonSaveAsRTF;
    TdxBarButton *dxBarButtonSaveAsText;
    TdxBarLargeButton *dxBarButtonPrint;
    TdxBarLargeButton *dxBarButtonExit;
    TdxBarLargeButton *dxBarButtonUndo;
    TdxBarLargeButton *dxBarButtonCut;
    TdxBarLargeButton *dxBarButtonCopy;
    TdxBarLargeButton *dxBarButtonPaste;
    TdxBarLargeButton *dxBarButtonClear;
	TdxBarLargeButton *dxBarButtonSelectAll;
    TdxBarLargeButton *dxBarButtonFind;
    TdxBarLargeButton *dxBarButtonReplace;
    TdxBarCombo *dxBarComboFontSize;
    TdxBarLargeButton *dxBarButtonBold;
    TdxBarLargeButton *dxBarButtonItalic;
    TdxBarLargeButton *dxBarButtonUnderline;
    TdxBarLargeButton *dxBarButtonBullets;
    TdxBarLargeButton *dxBarButtonProtected;
    TdxBarLargeButton *dxBarButtonAlignLeft;
    TdxBarLargeButton *dxBarButtonCenter;
    TdxBarLargeButton *dxBarButtonAlignRight;
    TdxBarLargeButton *dxBarButtonFont;
    TdxBarSeparator *dxBarSeparator;

    TOpenDialog *OpenDialog;
    TSaveDialog *SaveDialog;
    TPrintDialog *PrintDialog;
    TFontDialog *FontDialog;
    TdxRibbonPopupMenu *dxBarPopupMenu;
    TdxBarGroup *dxBarGroup1;
    TdxBarLargeButton *dxBarButton1;
    TdxBarLargeButton *dxBarButton2;
    TdxBarLargeButton *dxBarButton3;
    TdxBarLargeButton *dxBarButton4;
    TdxBarLargeButton *dxBarButton5;
    TdxBarLargeButton *dxBarButton6;
    TdxBarLargeButton *dxBarButton7;
    TdxBarFontNameCombo *dxBarComboFontName;
    TdxBarLargeButton *dxBarLargeButton1;
    TdxBarLargeButton *dxBarLargeButton2;
    TImageList *ilStatusBarImages;
    TdxRibbonStatusBar *dxStatusBar;
    TFindDialog *FindDialog;
    TReplaceDialog *ReplaceDialog;
    TdxRibbonTab *tabHome;
    TdxRibbon *Ribbon;
    TdxRibbonTab *tabAppearance;
    TdxBar *BarManagerBar5;
    TdxBar *BarManagerBar7;
	TdxBarApplicationMenu *ApplicationMenu;
    TdxBar *BarManagerBar8;
    TdxBar *BarManagerBar1;
    TdxBarLargeButton *dxBarLargeButtonBlueScheme;
    TdxBarLargeButton *dxBarLargeButtonBlackScheme;
    TdxBarLargeButton *dxBarLargeButtonSilverScheme;
    TdxBar *BarManagerBar9;
    TdxBarLargeButton *dxBarLargeButton6;
    TdxBarLargeButton *dxBarLargeButton7;
    TdxBar *BarManagerBar10;
    TdxBarLargeButton *dxBarLargeButton8;
    TdxBarLargeButton *dxBarLargeButton9;
    TdxBarLargeButton *dxBarLargeButton10;
    TdxBar *BarManagerBar11;
    TdxBar *BarManagerBar12;
	TRichEdit *Editor;
    TdxBarScreenTipRepository *dxBarScreenTipRepository1;
    TcxImageList *cxLargeImages;
    TcxImageList *cxSmallImages;
    TdxBar *BarManagerBar6;
	TdxBar *BarManagerBar13;
    TdxBarButton *btnLineNumber;
    TdxBarButton *btnColumnNumber;
    TdxBarButton *btnLocked;
    TcxStyleRepository *cxStyleRepository1;
    TcxStyle *cxStyle1;
    TdxBarStatic *stModified;
    TdxBarScreenTip *stFontDialog;
    TdxRibbonGalleryItem *rgiFontColor;
    TdxRibbonGalleryItem *rgiColorTheme;
    TdxBarButton *dxBarButtonFontColor;
    TdxRibbonDropDownGallery *dxRibbonDropDownGallery;
    TdxRibbonGalleryItem *rgiItemSymbol;
    TPanel *Panel1;
    TdxRibbonDropDownGallery *UndoDropDownGallery;
    TdxRibbonGalleryItem *rgiUndo;
    TdxBarStatic *bstSelectionInfo;
    TdxBarSubItem *dxBarSubItem1;
    TdxBarStatic *dxBarStatic1;
    TdxBarButton *dxBarButton8;
    TdxRibbonTab *RibbonTab1;
	TdxBar *BarManagerBar14;

    void __fastcall dxBarButtonNewClick(TObject *Sender);
    void __fastcall dxBarButtonOpenClick(TObject *Sender);
    void __fastcall dxBarButtonCloseClick(TObject *Sender);
    void __fastcall dxBarButtonSaveClick(TObject *Sender);
    void __fastcall dxBarButtonSaveAsRTFClick(TObject *Sender);
    void __fastcall dxBarButtonSaveAsTextClick(TObject *Sender);
    void __fastcall dxBarButtonPrintClick(TObject *Sender);
    void __fastcall dxBarButtonExitClick(TObject *Sender);

    void __fastcall dxBarButtonUndoClick(TObject *Sender);
    void __fastcall dxBarButtonCutClick(TObject *Sender);
    void __fastcall dxBarButtonCopyClick(TObject *Sender);
    void __fastcall dxBarButtonPasteClick(TObject *Sender);
    void __fastcall dxBarButtonClearClick(TObject *Sender);
    void __fastcall dxBarButtonSelectAllClick(TObject *Sender);
    void __fastcall dxBarButtonFindClick(TObject *Sender);
    void __fastcall dxBarButtonReplaceClick(TObject *Sender);

    void __fastcall dxBarComboFontNameChange(TObject *Sender);
    void __fastcall dxBarComboFontSizeChange(TObject *Sender);
    void __fastcall dxBarButtonBoldClick(TObject *Sender);
    void __fastcall dxBarButtonItalicClick(TObject *Sender);
    void __fastcall dxBarButtonUnderlineClick(TObject *Sender);
    void __fastcall dxBarButtonBulletsClick(TObject *Sender);
    void __fastcall dxBarButtonAlignClick(TObject *Sender);
    void __fastcall dxBarButtonProtectedClick(TObject *Sender);
    void __fastcall FontClick(TObject *Sender);
    void __fastcall FindOne(TObject *Sender);
    void __fastcall ReplaceOne(TObject *Sender);
    void __fastcall dxBarLargeButtonBlackSchemeClick(TObject *Sender);
    void __fastcall dxBarLargeButtonBlueSchemeClick(TObject *Sender);
    void __fastcall dxBarLargeButtonSilverSchemeClick(TObject *Sender);
    void __fastcall dxBarLargeButton10Click(TObject *Sender);
    void __fastcall dxBarLargeButton8Click(TObject *Sender);
    void __fastcall dxBarLargeButton9Click(TObject *Sender);
    void __fastcall dxBarLargeButton6Click(TObject *Sender);
    void __fastcall dxBarLargeButton7Click(TObject *Sender);

    void __fastcall EditorChange(TObject *Sender);
	void __fastcall EditorSelectionChange(TObject *Sender);
    void __fastcall EditorMouseDown(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y);
    void __fastcall RibbonResize(TObject *Sender);
    void __fastcall FormCloseQuery(TObject *Sender, bool &CanClose);
    void __fastcall FormActivate(TObject *Sender);
    void __fastcall ApplicationMenuRecentDocumentsClick(TObject *Sender,
      int AIndex);
    void __fastcall btnLockedClick(TObject *Sender);
    void __fastcall RibbonHelpButtonClick(TdxCustomRibbon *Sender);
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall FormDestroy(TObject *Sender);
    void __fastcall RibbonHideMinimizedByClick(TdxCustomRibbon *Sender,
          DWORD AWnd, TShiftState AShift, const TPoint &APos,
          bool &AAllowProcessing);
    void __fastcall dxBarButtonOptionsClick(TObject *Sender);
    void __fastcall dxBarButtonFontColorClick(TObject *Sender);
	void __fastcall rgiItemSymbolGroupItemClick(TdxRibbonGalleryItem *Sender,
		  TdxRibbonGalleryGroupItem *AItem);
	void __fastcall rgiUndoHotTrackedItemChanged(
	  TdxRibbonGalleryGroupItem *APrevHotTrackedGroupItem, TdxRibbonGalleryGroupItem *ANewHotTrackedGroupItem);
	void __fastcall rgiUndoGroupItemClick(TdxRibbonGalleryItem *Sender,
          TdxRibbonGalleryGroupItem *AItem);
private:
	AnsiString FFileName;
    bool FCanOnChange;
    bool FUpdating;
    TColorPickerController *FColorPickerController;
	TRichEditUndoController *FEditorUndoController;

    int __fastcall GetEditorCol();
    int __fastcall GetEditorRow();
    void __fastcall MakeNewDocument();
    void __fastcall SetFileName(AnsiString Value);

	void AssignFontColorGlyph();
	void __fastcall FontColorChanged(TObject *Sender);
	void SetFontColor();
	void Undo(int Count);

	void AddSymbolItem(TdxRibbonGalleryGroup *AGroup, int ACode);
	void InitSymbolGallery();
public:
    __fastcall TRibbonDemoMainForm (TComponent* Owner);
    void __fastcall OpenFile(AnsiString AFileName);
    int __fastcall QuerySaveFile();
    bool __fastcall SaveFile(bool ASaveAs, bool APlainText = false);
    void __fastcall SetColorScheme(AnsiString AName);
    void __fastcall SetModified(bool Value);
    void __fastcall ShowItems(bool AShow);

    __property int EditorCol = {read = GetEditorCol};
    __property int EditorRow = {read = GetEditorRow};
    __property AnsiString FileName = {read = FFileName, write = SetFileName};
};
//---------------------------------------------------------------------------
extern PACKAGE TRibbonDemoMainForm *RibbonDemoMainForm;
//---------------------------------------------------------------------------
#endif