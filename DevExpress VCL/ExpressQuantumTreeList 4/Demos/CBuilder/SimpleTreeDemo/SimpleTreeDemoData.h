//---------------------------------------------------------------------------

#ifndef SimpleTreeDemoDataH
#define SimpleTreeDemoDataH
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
class TSimpleTreeDemoDataDM : public TDataModule
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
  TDataSource *dsDepartments;
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
  __fastcall TSimpleTreeDemoDataDM(TComponent* Owner);
  void __fastcall SetParentValue(Variant AValue);
};
//---------------------------------------------------------------------------
extern PACKAGE TSimpleTreeDemoDataDM *SimpleTreeDemoDataDM;
//---------------------------------------------------------------------------
#endif
