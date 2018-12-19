//---------------------------------------------------------------------------

#ifndef CustomDrawCardViewDemoDataH
#define CustomDrawCardViewDemoDataH
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
class TCustomDrawCardViewDemoMainDM : public TDataModule
{
__published:	// IDE-managed Components
  TDatabase *DataBase;
  TTable *tblCountries;
  TDataSource *dsCountries;
  TTable *tlbPERSONSLINE;
  TDataSource *dsPERSONSLINE;
  TQuery *qrePersons;
  TDataSource *dsPresons;
  TcxStyleRepository *StyleRepository;
  TcxStyle *stBlueDark;
  TcxStyle *stGold;
  TcxStyle *stBlueLight;
  TcxStyle *stBlueBright;
  TcxStyle *stYellowLight;
  TcxStyle *stGreyLight;
  TcxStyle *stBlueSky;
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
  TcxStyle *stDefault;
  TcxGridTableViewStyleSheet *GridTableViewStyleSheetDevExpress;
private:	// User declarations
public:		// User declarations
  __fastcall TCustomDrawCardViewDemoMainDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCustomDrawCardViewDemoMainDM *CustomDrawCardViewDemoMainDM;
//---------------------------------------------------------------------------
#endif
