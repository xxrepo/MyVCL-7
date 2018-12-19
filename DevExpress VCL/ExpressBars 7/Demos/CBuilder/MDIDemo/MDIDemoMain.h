//---------------------------------------------------------------------------
#ifndef MDIDemoMainH
#define MDIDemoMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "dxBar.hpp"
#include <Dialogs.hpp>
#include <ComCtrls.hpp>
#include "dxBarExtItems.hpp"
#include "cxControls.hpp"
#include "dxStatusBar.hpp"
#include <ActnList.hpp>
#include <ImgList.hpp>
#include "cxGraphics.hpp"
#include "dxStatusBar.hpp"
#include "EBarsUtils.h"
#include "cxClasses.hpp"
#include "cxLookAndFeels.hpp"
#include "cxPC.hpp"
#include "cxPCPaintersFactory.hpp"
#include "dxTabbedMDI.hpp"
#include "cxLookAndFeelPainters.hpp"
//---------------------------------------------------------------------------
class TfrmMDIMain : public TForm
{
__published:	// IDE-managed Components
	TdxBarDockControl *dxBarDockControl1;
	TdxBarManager *BarManager;
	TdxBarLargeButton *dxBarButtonNew;
	TdxBarLargeButton *dxBarButtonOpen;
	TdxBarLargeButton *dxBarButtonClose;
	TdxBarLargeButton *dxBarButtonSave;
	TdxBarLargeButton *dxBarButtonSaveAs;
	TdxBarSubItem *dxBarSubItemFile;
	TdxBarSubItem *dxBarSubItemEdit;
	TdxBarSubItem *dxBarSubItemFormat;
	TdxBarSubItem *dxBarSubItemWindow;
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
	TdxBarLargeButton *dxBarButtonAlignLeft;
	TdxBarLargeButton *dxBarButtonCenter;
	TdxBarLargeButton *dxBarButtonAlignRight;
	TdxBarLargeButton *dxBarButtonProtected;
	TdxBarLargeButton *dxBarButtonNewWindow;
	TdxBarLargeButton *dxBarButtonArrangeAll;
	TdxBarLargeButton *dxBarButtonNextWindow;
	TdxBarLargeButton *dxBarButtonPreviousWindow;
	TdxBarSubItem *dxBarSubItemHelp;
	TdxBarListItem *dxBarListWindows;
	TdxBarLargeButton *dxBarButtonFont;
	TdxBarMRUListItem *dxBarMRUFiles;
	TdxBarColorCombo *dxBarComboFontColor;
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
	TdxBarGroup *dxBarGroup1;
	TOpenDialog *OpenDialog;
	TSaveDialog *SaveDialog;
	TPrintDialog *PrintDialog;
	TFontDialog *FontDialog;
	TdxBarPopupMenu *dxBarPopupMenu;
	TImageList *Images;
	TImageList *ilHotImages;
	TImageList *ilDisabledImages;
	TImageList *ilStatusBarImages;
	TFindDialog *FindDialog;
	TReplaceDialog *ReplaceDialog;
	TdxStatusBar *dxStatusBar;
	TdxTabbedMDIManager *dxTabbedMDIManager1;
	TcxLookAndFeelController *cxLookAndFeelController1;
	TdxBarSubItem *dxBarSubItem1;
	TdxBarLargeButton *btnTabbedView;
	TdxBar *tlbTabOptions;
	TdxBarSubItem *dxBarSubItem2;
	TdxBarButton *btnFlat;
	TdxBarButton *btnUltraFlat;
	TdxBarButton *btnStandard;
	TdxBarButton *btnOffice11;
	TActionList *ActionList1;
	TAction *actFlat;
	TAction *actStandard;
	TAction *actUltraFlat;
	TAction *actOffice11;
	TAction *actNative;
	TdxBarButton *btnNative;
	TdxBarCombo *cbTabPosition;
	TdxBarCombo *cbTextAngle;
	TdxBarSubItem *siStyles;
	TdxBarCombo *cbCloseButtonMode;
	TdxBarButton *btnMultiline;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall FindOne(TObject *Sender);
	void __fastcall ReplaceOne(TObject *Sender);

	void __fastcall dxBarButtonNewClick(TObject *Sender);
	void __fastcall dxBarButtonOpenClick(TObject *Sender);
	void __fastcall dxBarButtonCloseClick(TObject *Sender);
	void __fastcall dxBarButtonSaveClick(TObject *Sender);
	void __fastcall dxBarButtonSaveAsClick(TObject *Sender);
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
	void __fastcall dxBarComboFontColorChange(TObject *Sender);

	void __fastcall dxBarButtonBulletsClick(TObject *Sender);
	void __fastcall dxBarButtonAlignClick(TObject *Sender);
	void __fastcall dxBarButtonProtectedClick(TObject *Sender);
	void __fastcall dxBarButtonFontClick(TObject *Sender);

	void __fastcall dxBarButtonArrangeAllClick(TObject *Sender);
	void __fastcall dxBarButtonNextWindowClick(TObject *Sender);
	void __fastcall dxBarButtonPreviousWindowClick(TObject *Sender);
	void __fastcall dxBarListWindowsClick(TObject *Sender);
	void __fastcall dxBarListWindowsGetData(TObject *Sender);
	void __fastcall dxBarButtonOnWebClick(TObject *Sender);
	void __fastcall dxBarButtonEnhancedStyleClick(TObject *Sender);
    void __fastcall dxBarButtonStdStyleClick(TObject *Sender);
    void __fastcall dxBarButtonFlatStyleClick(TObject *Sender);
    void __fastcall dxBarMRUFilesClick(TObject *Sender);
	void __fastcall dxBarButtonOffice11StyleClick(TObject *Sender);
	void __fastcall dxBarButtonXPStyleClick(TObject *Sender);
	void __fastcall btnTabbedViewClick(TObject *Sender);
	void __fastcall actFlatExecute(TObject *Sender);
	void __fastcall btnMultilineClick(TObject *Sender);
	void __fastcall cbTextAngleChange(TObject *Sender);
	void __fastcall cbCloseButtonModeChange(TObject *Sender);
private:
	bool FUpdating;

	void __fastcall AddButton(AnsiString ACaption, int AIndex);
	TRichEdit *__fastcall GetEditor();
	int __fastcall GetEditorCol();
	int __fastcall GetEditorRow();
	AnsiString __fastcall GetFileName();
	void __fastcall SetFileName(const AnsiString Value);
	void __fastcall StyleButtonClick(TObject *Sender);
	void __fastcall CreateStylesMenu();
public:
	__fastcall TfrmMDIMain(TComponent* Owner);
	int CreatedMDICount;

	void __fastcall EditorChange(TObject *Sender);
	void __fastcall EditorSelectionChange(TObject *Sender);
	bool __fastcall SaveFile(bool ASaveAs);
	void __fastcall SetModified(bool Value);
	void __fastcall ShowItems(bool AShow);

	__property TRichEdit *Editor = {read = GetEditor};
	__property int EditorCol = {read = GetEditorCol};
	__property int EditorRow = {read = GetEditorRow};
	__property AnsiString FileName = {read = GetFileName, write = SetFileName};
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmMDIMain *frmMDIMain;
//---------------------------------------------------------------------------
#endif
