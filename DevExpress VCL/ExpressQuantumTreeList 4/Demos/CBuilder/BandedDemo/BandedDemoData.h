//---------------------------------------------------------------------------

#ifndef BandedDemoDataH
#define BandedDemoDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include "cxTL.hpp"
#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TBandedDemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
  TDatabase *DataBase;
  TTable *tblDepartments;
  TAutoIncField *tblDepartmentsID;
  TIntegerField *tblDepartmentsPARENTID;
  TStringField *tblDepartmentsNAME;
  TFloatField *tblDepartmentsBUDGET;
  TStringField *tblDepartmentsPHONE;
  TStringField *tblDepartmentsFAX;
  TStringField *tblDepartmentsEMAIL;
  TBooleanField *tblDepartmentsVACANCY;
  TIntegerField *tblDepartmentsMANAGERID;
  TDataSource *dsDepartments;
  TDataSource *dsPersons;
  TTable *tblPersons;
  TIntegerField *tblPersonsID;
  TStringField *tblPersonsName;
  TStringField *tblPersonsAddress;
  TStringField *tblPersonsPhone;
  TStringField *tblPersonsFax;
  TStringField *tblPersonsEMAIL;
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
  TcxTreeListStyleSheet *TreeListStyleSheetDevExpress;
private:	// User declarations
public:		// User declarations
  __fastcall TBandedDemoDataDM(TComponent* Owner);
    void SetParentValue(Variant AValue);
};
//---------------------------------------------------------------------------
extern PACKAGE TBandedDemoDataDM *BandedDemoDataDM;
//---------------------------------------------------------------------------
#endif
