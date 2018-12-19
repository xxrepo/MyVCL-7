//---------------------------------------------------------------------------
#ifndef mainH
#define mainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "dxdbtree.hpp"
#include "dxPSCore.hpp"
#include "dxPSdxDBTVLnk.hpp"
#include "dxPSTVLnk.hpp"
#include "dxtree.hpp"
#include <ComCtrls.hpp>
#include <DBTables.hpp>
#include <Menus.hpp>
#include <ToolWin.hpp>
#include <ShellAPI.hpp>
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
#include <ImgList.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
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
    TdxDBTreeView *DBTreeView1;
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
    TdxDBTreeViewReportLink *dxComponentPrinter1Link1;
    TImageList *ilButtons;
    TImageList *ImageList1;
    TTable *Table;
    TIntegerField *Table_id;
    TIntegerField *Table_parent;
    TStringField *Table_name;
    TDateField *Table_bdate;
    TDateField *Table_edate;
    TMemoField *Table_info;
    TDataSource *DataSource;
    void __fastcall miPageSetupClick(TObject *Sender);
    void __fastcall miPrintPreviewClick(TObject *Sender);
    void __fastcall miPrintClick(TObject *Sender);
    void __fastcall miExitClick(TObject *Sender);
    void __fastcall miDesignerClick(TObject *Sender);
    void __fastcall miDXClick(TObject *Sender);
    void __fastcall DBTreeView1Collapsed(TObject *Sender, TTreeNode *Node);
    
    void __fastcall DBTreeView1Expanded(TObject *Sender, TTreeNode *Node);
    void __fastcall DBTreeView1GetSelectedIndex(TObject *Sender,
          TTreeNode *Node);
    
    void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
