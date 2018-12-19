//---------------------------------------------------------------------------
#ifndef EBarMegaDemoMainH
#define EBarMegaDemoMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "dxBar.hpp"
#include "dxBarDBNav.hpp"
#include "dxBarExtDBItems.hpp"
#include "dxBarExtItems.hpp"
#include "dxsbar.hpp"
#include <ComCtrls.hpp>
#include <Db.hpp>
#include <DBGrids.hpp>
#include <DBTables.hpp>
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <Menus.hpp>
#include <OleCtrls.hpp>
#include <ShellAPI.hpp>
#include <Graphics.hpp>
#include <ImgList.hpp>
#include <DB.hpp>
#include <ActnList.hpp>
#include "cxClasses.hpp"

#if (__BORLANDC__ >= 0x540) && (__BORLANDC__ < 0x550)   // BCB = 4
#include "SHDocVw_OCX_4.h"
#endif

#if __BORLANDC__ >= 0x550   // BCB = 5, BCB = 6
#include "SHDocVw_OCX.h"
#endif

#include <Graphics.hpp>
#include <ImgList.hpp>
#include <ActnList.hpp>
#include "EBarsUtils.h"
//---------------------------------------------------------------------------
class TEBarMegaDemoMainForm : public TForm
{
__published:	// IDE-managed Components
  TPanel *Panel3;
  TSplitter *Splitter;
  TPanel *Panel1;
  TImage *Image;
  TdxSideBar *dxSideBar;
  TPanel *Panel2;
  TNotebook *Nb;
  TPanel *PanelRE;
  TRichEdit *Editor;
  TPanel *HTMLPanel;
  TDBGrid *DBGrid1;
  TdxBarDockControl *dxBDStatus;
  TdxSideBarStore *dxSideBarStore;
  TdxStoredSideItem *dxSideBarStoreItem1;
  TdxStoredSideItem *dxSideBarStoreItem2;
  TdxStoredSideItem *dxSideBarStoreItem3;
  TdxBarManager *BarManager;
  TdxBarLargeButton *dxBarButtonNew;
  TdxBarLargeButton *dxBarButtonOpen;
  TdxBarLargeButton *dxBarButtonClose;
  TdxBarLargeButton *dxBarButtonSave;
  TdxBarLargeButton *dxBarButtonSaveAs;
  TdxBarSubItem *dxBarSubItemFile;
  TdxBarSubItem *dxBarSubItemEdit;
  TdxBarSubItem *dxBarSubItemFormat;
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
  TdxBarLargeButton *dxBarButtonURLDetection;
  TdxBarSubItem *dxBarSubItemHelp;
  TdxBarLargeButton *dxBarButtonFont;
  TdxBarFontNameCombo *dxBarComboFontName;
  TdxBarColorCombo *dxBarComboFontColor;
  TdxBarLargeButton *dxBackBtn;
  TdxBarLargeButton *dxForwardBtn;
  TdxBarLargeButton *dxStopBtn;
  TdxBarLargeButton *dxRefreshBtn;
  TdxBarLargeButton *dxHomeBtn;
  TdxBarLargeButton *dxSearchBtn;
  TdxBarCombo *dxAddressCombo;
  TdxBarStatic *dxLinks;
  TdxBarLargeButton *dxProductsBtn;
  TdxBarLargeButton *dxDownloadsBtn;
  TdxBarLargeButton *dxBarHistory;
  TdxBarTreeViewCombo *dxCityCombo;
  TdxBarLookupCombo *dxProductsCombo;
  TdxBarDateCombo *dxDate;
  TdxBarLargeButton *dxIESelectAllBtn;
  TdxBarSubItem *dxIEView;
  TdxBarSubItem *dxGo;
  TdxBarLargeButton *dxIEStop;
  TdxBarLargeButton *dxIERefreshBtn;
  TdxBarLargeButton *dxIEBackBtn;
  TdxBarLargeButton *dxIEForwardBtn;
  TdxBarSubItem *dxFavorites;
  TdxBarSubItem *dxIELinks;
  TdxBarLargeButton *dxClearBtn;
  TdxBarSubItem *dxFilter;
  TdxBarSubItem *dxDBNavig;
  TdxBarButton *dxOptions;
  TdxBarLargeButton *dxFORUMBtn;
  TdxBarImageCombo *dxTypeCombo;
  TdxBarStatic *dxBSPosition;
  TdxBarStatic *dxBSStatus;
  TdxBarProgressItem *dxBarProgress;
  TdxBarStatic *dxBSIEStatus;
  TdxBarLargeButton *dxBarButtonAbout;
  TdxBarLargeButton *dxBarButtonDXDownloads;
  TdxBarLargeButton *dxBarButtonDXOntheweb;
  TdxBarLargeButton *dxBarButtonHelp;
  TdxBarLargeButton *dxBarButtonProducts;
  TdxBarLargeButton *dxBarButtonForum;
  TdxBarDBNavButton *dxBarDBNavFirst1;
  TdxBarDBNavButton *dxBarDBNavPrev1;
  TdxBarDBNavButton *dxBarDBNavNext1;
  TdxBarDBNavButton *dxBarDBNavLast1;
  TdxBarDBNavButton *dxBarDBNavInsert1;
  TdxBarDBNavButton *dxBarDBNavDelete1;
  TdxBarDBNavButton *dxBarDBNavEdit1;
  TdxBarDBNavButton *dxBarDBNavPost1;
  TdxBarDBNavButton *dxBarDBNavCancel1;
  TdxBarDBNavButton *dxBarDBNavRefresh1;
  TdxBarLargeButton *dxBarButton1;
  TdxBarLargeButton *dxBarLargeButton1;
  TdxBarLargeButton *dxBarLargeButton2;
  TdxBarGroup *dxBarGroup;
  TOpenDialog *OpenDialog;
  TdxBarPopupMenu *dxBarPopupMenu;
  TSaveDialog *SaveDialog;
  TPrintDialog *PrintDialog;
  TFontDialog *FontDialog;
  TImageList *LargeImage;
  TImageList *SmallImage;
  TdxBarPopupMenu *BackPopupMenu;
  TdxBarPopupMenu *ForwardPopupMenu;
  TdxBarDBNavigator *dxBarDBNavigator;
  TImageList *GridImageList;
  TdxSideBarPopupMenu *dxSideBarPopupMenu;
  TFindDialog *FindDialog;
  TReplaceDialog *ReplaceDialog;
  TImageList *ilDisabledImages;
  TImageList *ilHotImages;
  TImageList *Images;
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall dxSideBarItemClick(TObject *Sender,
          TdxSideBarItem *Item);
    void __fastcall dxBarButtonNewClick(TObject *Sender);
    void __fastcall dxBarButtonOpenClick(TObject *Sender);
    void __fastcall dxBarButtonCloseClick(TObject *Sender);
    void __fastcall EditorChange(TObject *Sender);
    void __fastcall EditorSelectionChange(TObject *Sender);
    void __fastcall dxBarButtonExitClick(TObject *Sender);
    void __fastcall dxBarButtonSaveClick(TObject *Sender);
    void __fastcall dxBarButtonSaveAsClick(TObject *Sender);
    void __fastcall dxBarButtonPrintClick(TObject *Sender);
    void __fastcall dxBarButtonUndoClick(TObject *Sender);
    void __fastcall dxBarButtonCutClick(TObject *Sender);
    void __fastcall dxBarButtonCopyClick(TObject *Sender);
    void __fastcall dxBarButtonPasteClick(TObject *Sender);
    void __fastcall dxBarButtonClearClick(TObject *Sender);
    void __fastcall dxBarButtonSelectAllClick(TObject *Sender);
    void __fastcall dxBarButtonFindClick(TObject *Sender);
    void __fastcall dxBarButtonReplaceClick(TObject *Sender);
    void __fastcall dxBarButtonFontClick(TObject *Sender);
    void __fastcall dxBarButtonBulletsClick(TObject *Sender);
    void __fastcall dxBarButtonProtectedClick(TObject *Sender);
    void __fastcall dxBarComboFontColorChange(TObject *Sender);
    void __fastcall dxBarComboFontColorClick(TObject *Sender);
    void __fastcall dxBarButtonURLDetectionClick(TObject *Sender);
    void __fastcall dxBarButtonOnWebClick(TObject *Sender);
    void __fastcall dxBarComboFontNameChange(TObject *Sender);
    void __fastcall dxBarComboFontNameClick(TObject *Sender);
    void __fastcall dxBarButtonBoldClick(TObject *Sender);
    void __fastcall dxBarButtonItalicClick(TObject *Sender);
    void __fastcall dxBarButtonUnderlineClick(TObject *Sender);
    void __fastcall dxBarButtonAlignLeftClick(TObject *Sender);
    void __fastcall dxBarButtonCenterClick(TObject *Sender);
    void __fastcall dxBarButtonAlignRightClick(TObject *Sender);
    void __fastcall dxAddressComboKeyDown(TObject *Sender, WORD &Key,
          TShiftState Shift);
    void __fastcall dxAddressComboDrawItem(TdxBarCustomCombo *Sender,
          int AIndex, TRect &ARect, TOwnerDrawState AState);
    void __fastcall dxStopBtnClick(TObject *Sender);
    void __fastcall dxRefreshBtnClick(TObject *Sender);
    void __fastcall dxHomeBtnClick(TObject *Sender);
    void __fastcall dxProductsBtnClick(TObject *Sender);
    void __fastcall dxAddressComboChange(TObject *Sender);
    void __fastcall FormDestroy(TObject *Sender);
    void __fastcall dxBackBtnClick(TObject *Sender);
    void __fastcall dxForwardBtnClick(TObject *Sender);
    void __fastcall dxBarHistoryClick(TObject *Sender);
    void __fastcall dxSearchBtnClick(TObject *Sender);
    void __fastcall dxCityComboChange(TObject *Sender);
    void __fastcall dxClearBtnClick(TObject *Sender);
    void __fastcall dxOptionsClick(TObject *Sender);
    void __fastcall FindDialogFind(TObject *Sender);
    void __fastcall ReplaceDialogReplace(TObject *Sender);

    void __fastcall ProgressChange(TObject *Sender, long Progress, long ProgressMax);
    void __fastcall StatusTextChange(TObject * Sender, BSTR Text);
    void __fastcall TitleChange(TObject * Sender, BSTR Text);

    void __fastcall dxBarComboFontSizeChange(TObject *Sender);
    void __fastcall dxBarComboFontSizeClick(TObject *Sender);

    void __fastcall tContactsCalcFields(TDataSet *DataSet);
  void __fastcall dxProductsComboChange(TObject *Sender);
  void __fastcall dxDateChange(TObject *Sender);
  void __fastcall dxTypeComboChange(TObject *Sender);
private:	// User declarations
    bool FUpdating;
    int HistoryIndex;
    TStringList *HistoryList;
    bool UpdateCombo;
    AnsiString FileName;
    AnsiString Address;
    #if __BORLANDC__ >= 0x550   // BCB version > 4
    TCppWebBrowser *HTML;
    #else
    TWebBrowserProxy *HTML;
    #endif
    void __fastcall DocumentComplete(TObject *Sender, LPDISPATCH pDisp,
    #if (__BORLANDC__ == 0x540) && (__BORLANDC__ < 0x550)  // BCB = 4
      void
    #endif
    #if (__BORLANDC__ >= 0x550) && (__BORLANDC__ < 0x560) // BCB = 5
      TVariant
    #endif
    #if __BORLANDC__ >= 0x560 // BCB = 6
    tagVARIANT
    #endif
    * URL);
    void __fastcall BeforeNavigate(TObject *Sender, LPDISPATCH pDisp,
    #if (__BORLANDC__ >= 0x550) && (__BORLANDC__ < 0x560) // BCB = 5
    TVariant* URL, TVariant* Flags, TVariant* TargetFrameName, TVariant* PostData, TVariant* Headers, TOLEBOOL* Cancel
    #elif (__BORLANDC__ == 0x540) && (__BORLANDC__ < 0x550)  // BCB = 4
    void* URL, void* Flags, void* TargetFrameName, void* PostData, void* Headers, void* Cancel
    #else
    tagVARIANT* URL, tagVARIANT* Flags, tagVARIANT* TargetFrameName, tagVARIANT* PostData, tagVARIANT* Headers, short* Cancel
    #endif
    );
    void __fastcall UpdateToolBar( int index);
    void __fastcall FindAddress(void);
    bool __fastcall SaveFile(bool ASaveAs);
    void __fastcall SetModified(bool Value);
    void __fastcall ShowItems(bool AShow);
    void __fastcall SetFilter(void);
public:		// User declarations
    __fastcall TEBarMegaDemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TEBarMegaDemoMainForm *EBarMegaDemoMainForm;
//---------------------------------------------------------------------------
#endif
