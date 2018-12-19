//---------------------------------------------------------------------------

#ifndef GridModeDemoDataH
#define GridModeDemoDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include <ImgList.hpp>
#include <DBTables.hpp>
#include <Db.hpp>
//---------------------------------------------------------------------------
const String DataPath = "..\\..\\Data\\";
const String CarsTableNames[] = {"Customers","Orders","Cars"};

class TGridModeDemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
  TDataSource *dsCars;
  TDataSource *dsOrders;
  TDataSource *dsCustomers;
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
  TImageList *PaymentTypeImages;
  TDatabase *DataBase;
  TQuery *qryHelper;
  TQuery *qryCars;
  TQuery *qryCustomers;
  TQuery *qryOrders;
  TUpdateSQL *UpdateSQLCars;
  TUpdateSQL *UpdateSQLOrders;
  void __fastcall qryAfterDelete(TDataSet *DataSet);
  void __fastcall qryAfterPost(TDataSet *DataSet);
  void __fastcall qryBeforePost(TDataSet *DataSet);
  void __fastcall qryCarsBeforeScroll(TDataSet* DataSet);
  void __fastcall qryCarsAfterScroll(TDataSet* DataSet);
public:		// User declarations
  __fastcall TGridModeDemoDataDM(TComponent* Owner);
  void ApplySortToQuery(TQuery *AQuery, TStrings *ASortList);
  bool CopyDBToLocalPlace(bool ARewrite);
  void ClearOrders();
  String GetTableNameByDataSet(TDataSet* DataSet);
  bool IsOrdersPopulated();
  void qryOrdersPopulate();
  void OpenTables(bool AOpen);
  __property TNotifyEvent OnPopulateProgress = {read=FOnPopulateProgress, write=FOnPopulateProgress};
private:
  TDataSetState FPrevDataSetState;
  TNotifyEvent FOnPopulateProgress;
  int FStartIDValue, FEndIDValue;
  bool CopyTableToCurrentDir(String ATableName);
  bool CopyDataFile(String APath, String AFileName);
  void FillKeyValues(TList *AList, TDataSet *ADataSet, String AKeyFieldName);
};
//---------------------------------------------------------------------------
extern PACKAGE TGridModeDemoDataDM *GridModeDemoDataDM;
//---------------------------------------------------------------------------
#endif
 
