//---------------------------------------------------------------------------

#ifndef DemoBasicMainH
#define DemoBasicMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxControls.hpp"
#include "cxCustomPivotGrid.hpp"
#include <Menus.hpp>
#include "cxLookAndFeels.hpp"
#include <Dialogs.hpp>
//---------------------------------------------------------------------------

class TfrmDemoBaisicMain : public TForm
{
__published:	// IDE-managed Components
    TMainMenu *mmMain;
    TMenuItem *miFile;
    TMenuItem *miExport;
    TMenuItem *miExportToExcel;
    TMenuItem *miExportToText;
    TMenuItem *miExportToHtml;
    TMenuItem *miExportToXml;
    TMenuItem *Separator1;
    TMenuItem *miExit;
    TMenuItem *miOptions;
    TMenuItem *miAbout;
    TMenuItem *miTotalsPosition;
    TMenuItem *miShowTotalsForSingleValues;
    TMenuItem *miShowRowTotals;
    TMenuItem *miShowColumnTotals;
    TMenuItem *miShowColumnGrandTotals;
    TMenuItem *miShowRowGrandTotals;
    TMenuItem *miTotalsVisibility;
    TMenuItem *miShowGrandTotalsForSingleValues;
    TMenuItem *N2;
    TMenuItem *miElementsVisibility;
    TMenuItem *miShowFilterFields;
    TMenuItem *miShowColumnFields;
    TMenuItem *miShowDataFields;
    TMenuItem *miShowRowFields;
    TMenuItem *miShowFilterSeparator;
    TMenuItem *N1;
    TMenuItem *miColumnTotalsPosition;
    TMenuItem *miRowTotalsPosition;
    TMenuItem *miColumnTotalsPositionFar;
    TMenuItem *miColumnTotalsPositionNear;
    TMenuItem *miRowTotalsPositionFar;
    TMenuItem *miRowTotalsPositionNear;
    TMenuItem *miSelection;
    TMenuItem *miMultiSelect;
    TMenuItem *miHideFocusRect;
    TMenuItem *miHideSelection;
    TMenuItem *miIncludeCells;
    TMenuItem *miCrossCells;
    TMenuItem *miGrandTotalsCells;
    TMenuItem *miTotalsCells;
    TSaveDialog *SaveDialog;
    TLabel *lbDescrip;
    TcxLookAndFeelController *lfController;
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall miExportToClick(TObject *Sender);
    void __fastcall miTotalsLocationClick(TObject *Sender);
    void __fastcall miExitClick(TObject *Sender);
    void __fastcall miTotalsVisibilityClick(TObject *Sender);
    void __fastcall miElementsVisibilityClick(TObject *Sender);
    void __fastcall miAboutClick(TObject *Sender);
    void __fastcall miMultiSelectClick(TObject *Sender);
    void __fastcall miHideFocusRectClick(TObject *Sender);
    void __fastcall miHideSelectionClick(TObject *Sender);
    void __fastcall IncludeCellsClick(TObject *Sender);
private:

protected:
	virtual TcxCustomPivotGrid* __fastcall PivotGrid();
	void __fastcall SyncElementsVisibilityWithMenu();
	void __fastcall SyncTotalVisibilityWithMenu();
	void __fastcall SyncMenuWithElementsVisibility();
	void __fastcall SyncMenuWithOptionsSelection();
	void __fastcall SyncMenuWithTotalVisibility();
  public:
  __fastcall TfrmDemoBaisicMain(TComponent* Owner);
  virtual void __fastcall AddLookAndFeelMenu();
  virtual TcxLookAndFeelKind __fastcall GetDefaultLookAndFeelKind();
  virtual bool __fastcall IsNativeDefaultStyle();
  virtual void __fastcall SetDefaultLookAndFeel();
};

#endif
