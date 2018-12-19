//---------------------------------------------------------------------------
#ifndef mainH
#define mainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Graphics.hpp>
#include <Forms.hpp>
#include <checklst.hpp>
#include <ComCtrls.hpp>
#include <Grids.hpp>
#include <Menus.hpp>
#include <ToolWin.hpp>
#include <Db.hpp>
#include <DBTables.hpp>
#include "dxCntner.hpp"
#include "dxDBCtrl.hpp"
#include "dxDBTL.hpp"
#include "dxDBTLCl.hpp"
#include "dxPSCore.hpp"
#include "dxPSdxDBCtrlLnk.hpp"
#include "dxPSdxDBTLLnk.hpp"
#include "dxPSdxTLLnk.hpp"
#include "dxTL.hpp"
//---------------------------------------------------------------------------
class TMainForm : public TForm
{
__published:	// IDE-managed Components
    TToolBar *ToolBar1;
    TToolButton *tbSetup;
    TToolButton *tbPreview;
    TToolButton *tbPrint;
    TToolButton *tbDevider;
    TToolButton *tbDesigner;
    TToolButton *tbSeparator;
    TToolButton *tbDX;
    TToolButton *tbExit;
    TToolButton *tbSelected;
    TMainMenu *MainMenu;
    TMenuItem *miFile;
    TMenuItem *miPageSetup;
    TMenuItem *miPrintPreview;
    TMenuItem *miPrint;
    TMenuItem *N1;
    TMenuItem *miExit;
    TMenuItem *miDesigner;
    TMenuItem *miHelp;
    TMenuItem *miDX;
    TdxComponentPrinter *dxComponentPrinter1;
    TImageList *ilButtons;
    TDataSource *DataSource;
    TTable *Table;
    TIntegerField *Table_id;
    TIntegerField *Table_parent;
    TStringField *Table_name;
    TDateField *Table_bdate;
    TDateField *Table_edate;
    TMemoField *Table_info;
    TImageList *ilDBTreelist;
    TdxDBTreeList *DBTreeList;
    TdxDBTreeListMaskColumn *DBTreeListPr_id;
    TdxDBTreeListMaskColumn *DBTreeListPr_parent;
    TdxDBTreeListMaskColumn *DBTreeListPr_name;
    TdxDBTreeListMemoColumn *DBTreeListPr_info;
    TdxDBTreeListReportLink *dxComponentPrinter1Link1;
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall tbDXClick(TObject *Sender);
    void __fastcall tbSetupClick(TObject *Sender);
    void __fastcall tbPreviewClick(TObject *Sender);
    void __fastcall tbPrintClick(TObject *Sender);
    void __fastcall tbDesignerClick(TObject *Sender);
    void __fastcall tbExitClick(TObject *Sender);
    void __fastcall DBTreeListGetStateIndex(TObject *Sender,
          TdxTreeListNode *Node, int &Index);
    void __fastcall tbSelectedClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMainForm *MainForm;
//---------------------------------------------------------------------------
#endif
