//---------------------------------------------------------------------------

#ifndef OLAPBrowserMainH
#define OLAPBrowserMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxLookAndFeels.hpp"
#include "DemoBasicMain.h"
#include <Dialogs.hpp>
#include <Menus.hpp>
#include "cxClasses.hpp"
#include "cxControls.hpp"
#include "cxCustomData.hpp"
#include "cxCustomPivotGrid.hpp"
#include "cxGraphics.hpp"
#include "cxPivotGrid.hpp"
#include "cxPivotGridOLAPDataSource.hpp"
#include "cxPivotGridOLAPConnectionDesigner.hpp"
#include "cxStyles.hpp"
//---------------------------------------------------------------------------
class TfrmOlapBrowser : public TfrmDemoBaisicMain
{
__published:	// IDE-managed Components
	TcxPivotGrid *UnboundPivotGrid;
	TMenuItem *NewConnection1;
	TMenuItem *N3;
	TcxPivotGridOLAPDataSource *OLAPDataSource;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall NewConnection1Click(TObject *Sender);
  private:	// User declarations
	void __fastcall SetFieldPos(const String AFieldName, TcxPivotGridFieldArea AArea);
	TcxCustomPivotGrid* __fastcall PivotGrid();
public:		// User declarations
	__fastcall TfrmOlapBrowser(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmOlapBrowser *frmOlapBrowser;
//---------------------------------------------------------------------------
#endif
