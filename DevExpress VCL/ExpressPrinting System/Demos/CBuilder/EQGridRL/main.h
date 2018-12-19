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
#include "dxDBGrid.hpp"
#include "dxDBTLCl.hpp"
#include "dxGrClms.hpp"
#include "dxPSCore.hpp"
#include "dxPSdxDBGrLnk.hpp"
#include "dxPSdxTLLnk.hpp"
#include "dxTL.hpp"
#include <ImgList.hpp>
#include "dxPSdxDBCtrlLnk.hpp"
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
    TDataSource *dsBiolife;
    TTable *tBiolife;
    TdxDBGrid *dxGrid;
    TdxDBGridColumn *dxDBGridColumn13;
    TdxDBGridMemoColumn *dxDBGridMemoColumn1;
    TdxDBGridColumn *dxDBGridColumn14;
    TdxDBGridGraphicColumn *dxDBGridGraphicColumn1;
    TdxDBGridColumn *dxDBGridColumn15;
    TdxDBGridColumn *dxDBGridColumn16;
    TdxDBGridColumn *dxDBGridColumn18;
    TdxDBGridColumn *dxDBGridColumn17;
    TdxDBGridReportLink *dxComponentPrinter1Link1;
    TImageList *ilDBTreelist;
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall tbDXClick(TObject *Sender);
    void __fastcall tbSetupClick(TObject *Sender);
    void __fastcall tbPreviewClick(TObject *Sender);
    void __fastcall tbPrintClick(TObject *Sender);
    void __fastcall tbDesignerClick(TObject *Sender);
    void __fastcall tbExitClick(TObject *Sender);
    void __fastcall dxGridColumnSorting(TObject *Sender,
          TdxDBTreeListColumn *Column, bool &Allow);
    void __fastcall dxDBGridGraphicColumn1CustomClick(TObject *Sender);
    void __fastcall tbSelectedClick(TObject *Sender);
private:	// User declarations
    void __fastcall GrDragEnd(TObject *Sender,TdxTreeListColumn *AColumn,
          #if __BORLANDC__  > 0x530   // BCB version > 3
          const TPoint &P,
          #else
          tagPOINT &P,
          #endif
          TdxHeaderPosInfo &NewPosInfo, bool &Accept);
    void __fastcall GrDragOver(TObject *Sender, TdxTreeListColumn *AColumn,
          #if __BORLANDC__  > 0x530   // BCB version > 3
          const TPoint &P,
          #else
          tagPOINT &P,
          #endif
          bool &Accept);
public:		// User declarations
    __fastcall TMainForm(TComponent* Owner);

};
//---------------------------------------------------------------------------
extern PACKAGE TMainForm *MainForm;
//---------------------------------------------------------------------------
#endif
