//---------------------------------------------------------------------------

#ifndef PivotGridRLMainH
#define PivotGridRLMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxControls.hpp"
#include "cxCustomPivotGrid.hpp"
#include "cxPivotGrid.hpp"
#include "dxPSCore.hpp"
#include "dxPScxCommon.hpp"
#include "dxPScxPivotGrid2Lnk.hpp"
#include <ComCtrls.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
#include <ToolWin.hpp>
//---------------------------------------------------------------------------
class TPivotGridRLMainForm : public TForm
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
        TcxPivotGrid *PivotGrid;
        TcxPivotGridField *pgfPurchaseQuarter;
        TcxPivotGridField *pgfPurchaseMonth;
        TcxPivotGridField *pgfPaymentType;
        TcxPivotGridField *pgfQuantity;
        TcxPivotGridField *pgfCarName;
        TcxPivotGridField *pgfUnitPrice;
        TcxPivotGridField *pgfCompanyName;
        TcxPivotGridField *pgfPaymentAmount;
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
        TcxPivotGridReportLink *dxComponentPrinter1Link1;
        TImageList *ilButtons;
        TImageList *PaymentTypeImages;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall miDXClick(TObject *Sender);
        void __fastcall miPageSetupClick(TObject *Sender);
        void __fastcall miPrintPreviewClick(TObject *Sender);
        void __fastcall miPrintClick(TObject *Sender);
        void __fastcall miDesignerClick(TObject *Sender);
        void __fastcall miExitClick(TObject *Sender);
        void __fastcall pgfPaymentTypeGetGroupImageIndex(
          TcxPivotGridField *Sender, const TcxPivotGridViewDataItem *AItem,
          int &AImageIndex, TAlignment &AImageAlignHorz,
          TcxAlignmentVert &AImageAlignVert);
private:	// User declarations
public:		// User declarations
        __fastcall TPivotGridRLMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPivotGridRLMainForm *PivotGridRLMainForm;
//---------------------------------------------------------------------------
#endif
