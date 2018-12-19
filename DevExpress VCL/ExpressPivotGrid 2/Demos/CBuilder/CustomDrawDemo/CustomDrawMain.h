//---------------------------------------------------------------------------

#ifndef CustomDrawMainH
#define CustomDrawMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxLookAndFeels.hpp"
#include "DemoBasicMain.h"
#include <Dialogs.hpp>
#include <Menus.hpp>
#include "cxControls.hpp"
#include "cxGraphics.hpp"
#include "cxCustomPivotGrid.hpp"
#include "cxDBPivotGrid.hpp"
#include "cxClasses.hpp"
#include "cxCustomData.hpp"
#include "cxStyles.hpp"
#include "cxEdit.hpp"
#include "cxLookAndFeelPainters.hpp"
//---------------------------------------------------------------------------
class TfrmCustomDraw : public TfrmDemoBaisicMain
{
__published:	// IDE-managed Components
        TMenuItem *Drawing1;
        TMenuItem *N3;
        TMenuItem *Content1;
        TMenuItem *FieldHeaders1;
		TMenuItem *GroupHeaders1;
		TMenuItem *N4;
		TMenuItem *Background1;
		TMenuItem *miLimitValues;
		TcxDBPivotGrid *DBPivotGrid;
        TcxDBPivotGridField *pgfPaymentType;
        TcxDBPivotGridField *pgfQuantity;
        TcxDBPivotGridField *pgfCarName;
        TcxDBPivotGridField *pgfUnitPrice;
        TcxDBPivotGridField *pgfCompanyName;
        TcxDBPivotGridField *pgfPaymentAmount;
        void __fastcall DrawingClick(TObject *Sender);
        void __fastcall DBPivotGridCustomDrawColumnHeader(
          TcxCustomPivotGrid *Sender, TcxCanvas *ACanvas,
          TcxPivotGridHeaderCellViewInfo *AViewInfo, bool &ADone);
        void __fastcall DBPivotGridCustomDrawFieldHeader(
          TcxCustomPivotGrid *Sender, TcxCanvas *ACanvas,
          TcxPivotGridFieldHeaderCellViewInfo *AViewInfo, bool &ADone);
        void __fastcall DBPivotGridCustomDrawPart(TcxCustomPivotGrid *Sender,
          TcxCanvas *ACanvas, TcxPivotGridCustomCellViewInfo *AViewInfo,
          bool &ADone);
        void __fastcall DBPivotGridCustomDrawRowHeader(
          TcxCustomPivotGrid *Sender, TcxCanvas *ACanvas,
          TcxPivotGridHeaderCellViewInfo *AViewInfo, bool &ADone);
        void __fastcall DBPivotGridCustomDrawCell(
          TcxCustomPivotGrid *Sender, TcxCanvas *ACanvas,
          TcxPivotGridDataCellViewInfo *AViewInfo, bool &ADone);
private:	// User declarations
    TcxCustomPivotGrid* __fastcall PivotGrid();
public:		// User declarations
	__fastcall TfrmCustomDraw(TComponent* Owner);
    virtual TcxLookAndFeelKind __fastcall GetDefaultLookAndFeelKind();
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmCustomDraw *frmCustomDraw;
//---------------------------------------------------------------------------
#endif
