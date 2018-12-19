//---------------------------------------------------------------------------
#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "dxCntner.hpp"
#include "dxDBCtrl.hpp"
#include "dxDBGrid.hpp"
#include "dxDBTLCl.hpp"
#include "dxGrClms.hpp"
#include "dxPgsDlg.hpp"
#include "dxPSCore.hpp"
#include "dxPSdxDBCtrlLnk.hpp"
#include "dxPSdxDBGrLnk.hpp"
#include "dxPSdxTLLnk.hpp"
#include "dxPSEngn.hpp"
#include "dxTL.hpp"
#include <Db.hpp>
#include <DBTables.hpp>
#include <Dialogs.hpp>
#include <Menus.hpp>
//---------------------------------------------------------------------------
class TfrmMain : public TForm
{
__published:	// IDE-managed Components
    TdxDBGrid *dxDBGrid;
    TdxDBGridColumn *colSpeciesNo;
    TdxDBGridMemoColumn *colNotes;
    TdxDBGridColumn *colCategory;
    TdxDBGridGraphicColumn *colGraphic;
    TdxDBGridColumn *colCommon_Name;
    TdxDBGridColumn *colSpeciesName;
    TdxDBGridColumn *colLength;
    TdxDBGridColumn *colLength_In;
    TdxPrintStyleManager *dxPrintStyleManager1;
    TdxPSPrintStyle *dxPrintStyleManager1Style1;
    TdxPSPrintStyle *dxPrintStyleManager1Style2;
    TdxComponentPrinter *dxComponentPrinter1;
    TdxDBGridReportLink *dxComponentPrinter1Link1;
    TdxPSEngineController *dxPSEngineController1;
    TMainMenu *MainMenu1;
    TMenuItem *miFile;
    TMenuItem *miReportDesigner;
    TMenuItem *miPreview;
    TMenuItem *miPrint;
    TMenuItem *N1;
    TMenuItem *miExit;
    TMenuItem *miPageSetup;
    TMenuItem *miShow;
    TMenuItem *N2;
    TMenuItem *miSimpleDialog;
    TMenuItem *miStyles;
    TMenuItem *N3;
    TMenuItem *miDefineStyles;
    TMenuItem *N4;
    TMenuItem *miLoad;
    TMenuItem *miSave;
    TMenuItem *miSaveAs;
    TMenuItem *miAutoSave;
    TMenuItem *miOptions;
    TMenuItem *miFlat;
    TMenuItem *miSaveFrmPos;
    TMenuItem *miHelp;
    TMenuItem *miWeb;
    TdxPageSetupDialog *dxPageSetupDialog1;
    TOpenDialog *OpenDialog1;
    TSaveDialog *SaveDialog1;
    TDataSource *DataSource1;
    TTable *Table1;
    void __fastcall miReportDesignerClick(TObject *Sender);
    void __fastcall miPreviewClick(TObject *Sender);
    void __fastcall miPrintClick(TObject *Sender);
    void __fastcall miExitClick(TObject *Sender);
    void __fastcall miShowClick(TObject *Sender);
    void __fastcall miDefineStylesClick(TObject *Sender);
    void __fastcall dxPrintStyleManager1ChangeCurrentStyle(
          TObject *Sender);
    void __fastcall dxPrintStyleManager1StyleListChanged(TObject *Sender);
    void __fastcall miSimpleDialogClick(TObject *Sender);
    void __fastcall miAutoSaveClick(TObject *Sender);
    void __fastcall miLoadClick(TObject *Sender);
    void __fastcall miSaveClick(TObject *Sender);
    void __fastcall miSaveAsClick(TObject *Sender);
    void __fastcall miWebClick(TObject *Sender);
    void __fastcall miFlatClick(TObject *Sender);
    void __fastcall miSaveFrmPosClick(TObject *Sender);
private:	// User declarations
    int StylesMenuItemsCount;
    void __fastcall InvertMICheck(TMenuItem* Item);
    void __fastcall BuildStylesMenu(void);
    void __fastcall StyleItemClick(TObject* Sender);
    bool __fastcall SaveStyles(bool ShowDialog);
public:		// User declarations
    __fastcall TfrmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmMain *frmMain;
//---------------------------------------------------------------------------
#endif
