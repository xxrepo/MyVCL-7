//---------------------------------------------------------------------------

#ifndef ViewCardSimpleDemoDataH
#define ViewCardSimpleDemoDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxGridCardView.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include <DBTables.hpp>
#include <Db.hpp>
//---------------------------------------------------------------------------
class TViewCardSimpleDemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
  TDatabase *DataBase;
  TTable *tlbDEPARTMENTS;
  TAutoIncField *tlbDEPARTMENTSID;
  TStringField *tlbDEPARTMENTSNAME;
  TDataSource *dsDEPARTMENTS;
  TDataSource *dsUSERS;
  TTable *tlbUSERS;
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
  TcxStyle *cxStyle15;
  TcxStyle *cxStyle16;
  TcxStyle *cxStyle17;
  TcxStyle *cxStyle18;
  TcxStyle *cxStyle19;
  TcxStyle *cxStyle20;
  TcxStyle *cxStyle21;
  TcxStyle *cxStyle22;
  TcxStyle *cxStyle23;
  TcxStyle *cxStyle24;
  TcxStyle *cxStyle25;
  TcxStyle *cxStyle26;
  TcxStyle *cxStyle27;
  TcxStyle *cxStyle28;
  TcxStyle *cxStyle29;
  TcxStyle *cxStyle30;
  TcxStyle *cxStyle31;
  TcxStyle *cxStyle32;
  TcxStyle *cxStyle33;
  TcxStyle *cxStyle34;
  TcxGridTableViewStyleSheet *GridTableViewStyleSheetDevExpress;
  TcxGridCardViewStyleSheet *GridCardViewStyleSheetDevExpress;
private:	// User declarations
public:		// User declarations
  __fastcall TViewCardSimpleDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TViewCardSimpleDemoDataDM *ViewCardSimpleDemoDataDM;
//---------------------------------------------------------------------------
#endif
