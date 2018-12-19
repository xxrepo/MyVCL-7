//---------------------------------------------------------------------------

#ifndef BandedFixedDemoDataH
#define BandedFixedDemoDataH
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
class TBandedFixedDemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
  TDatabase *DataBase;
  TTable *tblSheduler;
  TAutoIncField *tblShedulerID;
  TIntegerField *tblShedulerPROJECTID;
  TIntegerField *tblShedulerProjectManagerID;
  TIntegerField *tblShedulerUSERID;
  TSmallintField *tblShedulerSUNDAY;
  TSmallintField *tblShedulerMONDAY;
  TSmallintField *tblShedulerTUESDAY;
  TSmallintField *tblShedulerWEDNESDAY;
  TSmallintField *tblShedulerTHURSDAY;
  TSmallintField *tblShedulerFRIDAY;
  TSmallintField *tblShedulerSATURDAY;
  TIntegerField *tblShedulerWeekSum;
  TFloatField *tblShedulerWeekAVG;
  TDataSource *dsSheduler;
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
  TcxStyle *stlGroupNode;
  TcxStyle *stlFixedBand;
  TcxTreeListStyleSheet *TreeListStyleSheetDevExpress;
  TDataSource *dsProjects;
  TTable *tblProjects;
  TAutoIncField *tblProjectsID;
  TStringField *tblProjectsNAME;
  TIntegerField *tblProjectsMANAGERID;
  void __fastcall tblShedulerCalcFields(TDataSet *DataSet);
public:
  String GetProjectNameByID(int AProjectID);
  String GetPersonNameByID(int APersonID);
  __fastcall TBandedFixedDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBandedFixedDemoDataDM *BandedFixedDemoDataDM;
//---------------------------------------------------------------------------
#endif
