//---------------------------------------------------------------------------

#ifndef SummariesDemoDataH
#define SummariesDemoDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include "cxTL.hpp"
#include <ImgList.hpp>
#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TSummariesDemoDataDM : public TDataModule
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
  TcxStyle *stlGroupNode;
  TcxStyle *stlFixedBand;
  TcxTreeListStyleSheet *TreeListStyleSheetDevExpress;
  TTable *tblDepartments;
  TAutoIncField	*tblDepartmentsID;
  TIntegerField	*tblDepartmentsPARENTID;
  TIntegerField	*tblDepartmentsMANAGERID;
  TStringField *tblDepartmentsNAME;
  TFloatField *tblDepartmentsBUDGET;
  TStringField *tblDepartmentsLOCATION;
  TStringField *tblDepartmentsPHONE;
  TStringField *tblDepartmentsFAX;
  TStringField *tblDepartmentsEMAIL;
  TBooleanField	*tblDepartmentsVACANCY;
  TDataSource *dsDepartments;
private:	// User declarations
public:		// User declarations
  __fastcall TSummariesDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSummariesDemoDataDM *SummariesDemoDataDM;
//---------------------------------------------------------------------------
#endif
