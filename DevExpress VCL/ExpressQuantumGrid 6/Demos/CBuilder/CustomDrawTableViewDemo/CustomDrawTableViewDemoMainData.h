//---------------------------------------------------------------------------

#ifndef CustomDrawTableViewDemoMainDataH
#define CustomDrawTableViewDemoMainDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TCustomDrawTableViewDemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
  TDatabase *DataBase;
  TcxStyleRepository *StyleRepository;
  TcxStyle *cxStyle1;
  TcxStyle *cxStyle2;
  TcxStyle *cxStyle3;
  TcxStyle *cxStyle4;
  TcxStyle *cxStyle5;
  TcxStyle *cxStyle6;
  TcxStyle *cxStyle7;
  TcxStyle *cxStyle8;
  TcxStyle *cxStyle9;
  TcxStyle *cxStyle10;
  TcxStyle *cxStyle11;
  TcxStyle *cxStyle12;
  TcxStyle *cxStyle13;
  TcxStyle *cxStyle14;
  TcxGridTableViewStyleSheet *GridTableViewStyleSheetDevExpress;
  TTable *tlbCars;
  TDataSource *dsCars;
  TTable *tlbCustomers;
  TDataSource *dsCustomers;
  TTable *tlbOrders;
  TDataSource *dsOrders;
private:	// User declarations
public:		// User declarations
  __fastcall TCustomDrawTableViewDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCustomDrawTableViewDemoDataDM *CustomDrawTableViewDemoDataDM;
//---------------------------------------------------------------------------
#endif
