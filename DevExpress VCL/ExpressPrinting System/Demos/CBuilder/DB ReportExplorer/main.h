//---------------------------------------------------------------------------
#ifndef mainH
#define mainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "dxPSBaseGridLnk.hpp"
#include "dxPSCore.hpp"
#include "dxPSDBBasedXplorer.hpp"
#include "dxPSGrLnks.hpp"
#include "dxPSStdGrLnk.hpp"
#include <ComCtrls.hpp>
#include <DBTables.hpp>
#include <ExtCtrls.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
#include <ToolWin.hpp>
#include "dxPSDBBasedXplorer.hpp"
#include "dxPSXplorerTreeView.hpp"
#include "dxPSGrLnks.hpp"
#include "dxPSStdGrLnk.hpp"
#include <ComCtrls.hpp>
#include <Db.hpp>
#include <DBTables.hpp>
#include <ExtCtrls.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
#include <ToolWin.hpp>
#include <ComObj.hpp>
#include "dxBkgnd.hpp"
#include "dxPrnDev.hpp"
#include "dxPrnPg.hpp"
#include "dxPSCompsProvider.hpp"
#include "dxPSEdgePatterns.hpp"
#include "dxPSEngn.hpp"
#include "dxPSFillPatterns.hpp"
#include "dxPSGlbl.hpp"
#include "dxPSUtl.hpp"
#include "dxWrap.hpp"
#include <DB.hpp>

//#include "dxPSPrVwAdv.hpp" //uncomment to use with dxBars

/*
 Follow header files must be added if you want to support all types of saved reports,
 i.e. reports that were created from all types of ReportLinks.
 These files contain registration information for all item types used to create them
*/

// cxSpreadSheet
//#include "dxPScxSSLnk.hpp"

// Generic Container
//#include "dxPSShapes.hpp"
//#include "dxPSContainerLnk.hpp"

// dxLayoutControl
//#include "dxPSdxLCLnk.hpp"

// cxGrid, cxTreeList, cxVerticalGrid and any others cx-family products
//#include "dxPScxGrid6Lnk.hpp"
//#include "dxPScxCommon.hpp"
//#include "dxPScxExtCommon.hpp"

//---------------------------------------------------------------------------
const IID IID_IdxPSExplorerTreeContainerHost =
  Comobj::StringToGUID("{4E52E062-EDCF-4A58-8212-45EAE673F506}");
const IID IID_IdxPSExplorerContextCommandBuilder =
  Comobj::StringToGUID("{EE36E842-FD6A-4A89-A343-A32828AEFE3D}");
const IID IID_IdxPSExplorerContextCommands  =
  Comobj::StringToGUID("{DC3A582D-7E33-410F-A235-680A846824D3}");
  
typedef IdxPSExplorerTreeContainerHost far *LPdxPSExplorerTreeContainerHost;
typedef IdxPSExplorerContextCommandBuilder far *LPdxPSExplorerContextCommandBuilder;

class TfmMain;

class TdxFormExplorerChangeNotifier : public TdxPSExplorerChangeNotifierAdapter
{
private:
  TfmMain *FForm;
protected:
  virtual void __fastcall ItemDataLoaded(TdxPSExplorerItem* AnItem);
  virtual void __fastcall ItemDataUnloaded(TdxPSExplorerItem* AnItem);
public:
  __fastcall TdxFormExplorerChangeNotifier(TfmMain *AForm);
  __property TfmMain *Form = {read=FForm};
};

class TFormHelper : public IdxPSExplorerTreeContainerHost,
 IdxPSExplorerContextCommandBuilder
{
private:
  TfmMain *FForm;
public:
  TFormHelper(TfmMain *AForm){FForm = AForm;};

  virtual HRESULT __stdcall QueryInterface(const GUID& IID, void **Obj);
  virtual ULONG __stdcall AddRef();
  virtual ULONG __stdcall Release();

  /* IdxPSExplorerTreeContainerHost */
  virtual bool __fastcall GetFlat(void);
  virtual TBasedxReportLink* __fastcall GetReportLink(void);
  virtual Controls::TWinControl* __fastcall GetTreeContainerParent(void);
  virtual void __fastcall UpdateState(void);

  /* IdxPSExplorerContextCommandBuilder */
  virtual void __fastcall AddExplorerContextCommand(
        TCustomdxPSExplorerContextCommand* ACommand);
  virtual void __fastcall UpdateExplorerContextCommands(void);
};

class TfmMain : public TForm
{
  friend TFormHelper;
  friend TdxFormExplorerChangeNotifier;
__published:  // IDE-managed Components
  TLabel *Label1;
  TSplitter *Splitter1;
  TToolBar *ToolBar1;
  TToolButton *tbFileLoad;
  TToolButton *tbFileClose;
  TToolButton *ToolButton7;
  TToolButton *tbFilePageSetup;
  TToolButton *tbFilePreview;
  TToolButton *tbFilePrint;
  TToolButton *ToolButton11;
  TToolButton *tbExplorerFolderCreate;
  TToolButton *tbExplorerDelete;
  TToolButton *tbExplorerProperties;
  TPanel *pnlExplorerTreeHost;
  TdxPSDBBasedExplorer *Explorer;
  TDataSource *dsFolders;
  TDataSource *dsItems;
  TTable *tblFolders;
  TAutoIncField *tblFoldersID;
  TIntegerField *tblFoldersParentID;
  TStringField *tblFoldersName;
  TTable *tblItems;
  TAutoIncField *tblItemsID;
  TIntegerField *tblItemsParentID;
  TStringField *tblItemsName;
  TBlobField *tblItemsData;
  TMainMenu *MainMenu;
  TMenuItem *miFile;
  TMenuItem *miFileLoad;
  TMenuItem *miFileClose;
  TMenuItem *miLine30;
  TMenuItem *miFilePageSetup;
  TMenuItem *miFilePreview;
  TMenuItem *miFilePrint;
  TMenuItem *miLine3;
  TMenuItem *miFileExit;
  TMenuItem *miExplorer;
  TMenuItem *miExplorerCreateNewFolder;
  TMenuItem *miLine31;
  TMenuItem *miExplorerDelete;
  TMenuItem *miExplorerRename;
  TMenuItem *miLine39;
  TMenuItem *miExplorerProperties;
  TImageList *ilToolBar;
  TPopupMenu *pmExplorer;
  TMenuItem *pmiExplorerLoadData;
  TMenuItem *pmiExplorerUnloadData;
  TMenuItem *miLine33;
  TMenuItem *pmiExplorerCreateFolder;
  TMenuItem *miLine34;
  TMenuItem *pmiExplorerDelete;
  TMenuItem *pmiExplorerRename;
  TMenuItem *miLine40;
  TMenuItem *pmiExplorerProperties;
  TTimer *TreeChangeTimer;
  TdxComponentPrinter *ComponentPrinter;
  TdxStringGridReportLink *Stub;
  void __fastcall FilePreviewClick(TObject *Sender);
  void __fastcall FilePageSetupClick(TObject *Sender);
  void __fastcall FileExitClick(TObject *Sender);
  void __fastcall FilePrintClick(TObject *Sender);
  void __fastcall ExplorerCreateNewFolderClick(TObject *Sender);
  void __fastcall ExplorerDeleteItemClick(TObject *Sender);
  void __fastcall ExplorerItemShowPropertySheetsClick(TObject *Sender);
  void __fastcall ExplorerLoadItemDataClick(TObject *Sender);
  void __fastcall ExplorerRenameItemClick(TObject *Sender);
  void __fastcall ExplorerUnloadItemDataClick(TObject *Sender);
  void __fastcall pmExplorerPopup(TObject *Sender);
  void __fastcall TreeChangeTimerTimer(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall ExplorerItemDataLoadError(TCustomdxPSExplorer *Sender,
          TdxPSExplorerItem *AnItem, bool &AShowErrorMessage,
          AnsiString &AText);
private:  // User declarations
  TFormHelper *FFormHelper;
  TdxFormExplorerChangeNotifier *FExplorerChangeNotifier;
  TList *FExplorerContextCommandMenuItems;
  TList *FExplorerContextCommandPopupMenuItems;
  TList *FExplorerContextCommandToolButtons;
  TdxPSExplorerTreeViewContainer *FExplorerTree;
  TCustomdxPSExplorerItem *FLastSelectedItem;
  TdxPSImageScrollBox *FPreviewBox;
  TdxPSReportDocument *FReportDocument;

  TMenuItem* __fastcall GetExplorerContextCommandMenuItem(int Index);
  int __fastcall GetExplorerContextCommandMenuItemCount();
  TMenuItem* __fastcall GetExplorerContextCommandPopupMenuItem(int Index);
  int __fastcall GetExplorerContextCommandPopupMenuItemCount();
  TToolButton* __fastcall GetExplorerContextCommandToolButton(int Index);
  int __fastcall GetExplorerContextCommandToolButtonCount();
  bool __fastcall GetIsReportItemSelected();
  bool __fastcall GetIsReportValid();
  TGraphic* __fastcall GetPreviewGraphic();

  void __fastcall AssignDataSets();
  void __fastcall CreateExplorerTree();
  void __fastcall CreatePreviewBox();

  bool __fastcall IsSelectedItemLoaded();
  void __fastcall LoadItemPreview(TdxPSExplorerItem *AnItem);
  void __fastcall UpdateControls();

  void __fastcall DoExplorerTreeChange(TObject *Sender, TTreeNode *ANode);
  void __fastcall DoExplorerTreeDblClick(TObject *Sender);
  void __fastcall DoShowExplorerPopup(TObject *Sender, TMouseButton Button,
    TShiftState Shift, int X, int Y);

  bool __fastcall IsCommandSeparator(TCustomdxPSExplorerContextCommand *ACommand);
  TMenuItem* __fastcall AddExplorerContextCommandMenuItem(TMenuItem *AParent,
    TCustomdxPSExplorerContextCommand *ACommand);

  void __fastcall UpdateMenuItems();
  void __fastcall UpdatePopupMenuItems();
  void __fastcall UpdateToolButtons();

protected:
 // IdxPSExplorerTreeContainerHost
  bool __fastcall GetFlat();
  TBasedxReportLink* __fastcall GetReportLink();
  TWinControl* __fastcall GetTreeContainerParent();
  void __fastcall UpdateState();

  //IdxPSExplorerContextCommandBuilder
  void __fastcall AddExplorerContextCommand(TCustomdxPSExplorerContextCommand *ACommand);
  void __fastcall UpdateExplorerContextCommands();

  void __fastcall ExplorerContextCommandClick(TObject *Sender);

  __property int ExplorerContextCommandMenuItemCount =
    {read=GetExplorerContextCommandMenuItemCount};
  __property TMenuItem* ExplorerContextCommandMenuItems[int Index] =
    {read=GetExplorerContextCommandMenuItem};
  __property int ExplorerContextCommandPopupMenuItemCount =
    {read=GetExplorerContextCommandPopupMenuItemCount};
  __property TMenuItem* ExplorerContextCommandPopupMenuItems[int Index] =
    {read=GetExplorerContextCommandPopupMenuItem};
  __property int ExplorerContextCommandToolButtonCount =
    {read=GetExplorerContextCommandToolButtonCount};
  __property TToolButton* ExplorerContextCommandToolButtons[int Index] =
    {read=GetExplorerContextCommandToolButton};
  __property TdxPSExplorerTreeViewContainer* ExplorerTree = {read=FExplorerTree};
  __property TCustomdxPSExplorerItem* LastSelectedItem =
    {read=FLastSelectedItem, write=FLastSelectedItem};
  __property TdxPSImageScrollBox* PreviewBox = {read=FPreviewBox};
  __property TGraphic* PreviewGraphic = {read=GetPreviewGraphic};
  __property TdxPSReportDocument* ReportDocument = {read=FReportDocument};
public:   // User declarations
  __fastcall TfmMain(TComponent* Owner);
  __fastcall ~TfmMain(void);
  __property bool IsReportItemSelected = {read=GetIsReportItemSelected};
  __property bool IsReportValid = {read=GetIsReportValid};
};
//---------------------------------------------------------------------------
extern PACKAGE TfmMain *fmMain;
//---------------------------------------------------------------------------
#endif
