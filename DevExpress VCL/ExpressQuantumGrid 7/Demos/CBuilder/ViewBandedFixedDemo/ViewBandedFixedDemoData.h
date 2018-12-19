//---------------------------------------------------------------------------

#ifndef ViewBandedFixedDemoDataH
#define ViewBandedFixedDemoDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxGridBandedTableView.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TViewBandedFixedDemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
  TTable *tblSCHEDULER;
  TAutoIncField *tblSCHEDULERID;
  TIntegerField *PROJECTID;
  TIntegerField *USERID;
  TSmallintField *SUNDAY;
  TSmallintField *MONDAY;
  TSmallintField *TUESDAY;
  TSmallintField *WEDNESDAY;
  TSmallintField *THURSDAY;
  TSmallintField *FRIDAY;
  TSmallintField *SATURDAY;
  TFloatField *RowAvg;
  TFloatField *RowSum;
  TStringField *UserName;
  TStringField *FirstName;
  TStringField *MiddleName;
  TStringField *LastName;
  TDataSource *dsSCHEDULER;
  TDataSource *dsUSERS;
  TTable *tblUSERS;
  TAutoIncField *tblUSERSID;
  TStringField *tblUSERSFNAME;
  TStringField *tblUSERSMNAME;
  TStringField *tblUSERSLNAME;
  TStringField *tblUSERSEMAIL;
  TStringField *tblUSERSPHONE;
  TIntegerField *tblUSERSDEPARTMENTID;
  TTable *tblPROJECTS;
  TAutoIncField *tblPROJECTSID;
  TStringField *tblPROJECTSNAME;
  TIntegerField *tblPROJECTSMANAGERID;
  TDataSource *dsPROJECTS;
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
  TcxStyle *cxStyle15;
  TcxStyle *cxStyle16;
  TcxGridBandedTableViewStyleSheet *GridBandedTableViewStyleSheetDevExpress;
  void __fastcall tblSCHEDULERCalcFields(TDataSet *DataSet);
private:	// User declarations
public:		// User declarations
  __fastcall TViewBandedFixedDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TViewBandedFixedDemoDataDM *ViewBandedFixedDemoDataDM;
//---------------------------------------------------------------------------
#endif
