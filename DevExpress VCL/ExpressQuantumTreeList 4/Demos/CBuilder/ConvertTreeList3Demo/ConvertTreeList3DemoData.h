//---------------------------------------------------------------------------

#ifndef ConvertTreeList3DemoDataH
#define ConvertTreeList3DemoDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TConvertTreeList3DemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
  TDatabase *DataBase;
  TTable *tblDepartments;
  TAutoIncField *tblDepartmentsID;
  TIntegerField *tblDepartmentsPARENTID;
  TIntegerField *tblDepartmentsMANAGERID;
  TStringField *tblDepartmentsNAME;
  TFloatField *tblDepartmentsBUDGET;
  TStringField *tblDepartmentsLOCATION;
  TStringField *tblDepartmentsPHONE;
  TStringField *tblDepartmentsFAX;
  TStringField *tblDepartmentsEMAIL;
  TBooleanField *tblDepartmentsVACANCY;
  TDataSource *dsDepartments;
private:	// User declarations
public:		// User declarations
  __fastcall TConvertTreeList3DemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TConvertTreeList3DemoDataDM *ConvertTreeList3DemoDataDM;
//---------------------------------------------------------------------------
#endif
