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
#include "dxPSCore.hpp"
#include "dxPSdxTLLnk.hpp"
#include "dxTL.hpp"
#include "dxTLClms.hpp"
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
    TImageList *ilTLItems;
    TdxTreeList *dxTreeList;
    TdxTreeListColumn *dxTreeListColumn1;
    TdxTreeListSpinColumn *dxTreeListColumn2;
    TdxTreeListPickColumn *dxTreeListColumn4;
    TdxTreeListColumn *dxTreeListColumn3;
    TdxTreeListColumn *dxTreeListColumn5;
    TdxTreeListReportLink *dxComponentPrinter1Link1;
    TImageList *ilDBTreelist;
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall tbDXClick(TObject *Sender);
    void __fastcall tbSetupClick(TObject *Sender);
    void __fastcall tbPreviewClick(TObject *Sender);
    void __fastcall tbPrintClick(TObject *Sender);
    void __fastcall tbDesignerClick(TObject *Sender);
    void __fastcall tbExitClick(TObject *Sender);
    void __fastcall dxTreeListDragDrop(TObject *Sender, TObject *Source,
          int X, int Y);
    void __fastcall dxTreeListCompare(TObject *Sender,
          TdxTreeListNode *Node1, TdxTreeListNode *Node2, int &Compare);
    void __fastcall dxTreeListEdited(TObject *Sender,
          TdxTreeListNode *Node);
    void __fastcall dxTreeListGetSelectedIndex(TObject *Sender,
          TdxTreeListNode *Node, int &Index);
    void __fastcall dxTreeListDragOver(TObject *Sender, TObject *Source,
          int X, int Y, TDragState State, bool &Accept);
    
    void __fastcall tbSelectedClick(TObject *Sender);
private:	// User declarations
    void __fastcall RefreshSort(TdxTreeList *Sender);
public:		// User declarations
    __fastcall TMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMainForm *MainForm;
//---------------------------------------------------------------------------
#endif
