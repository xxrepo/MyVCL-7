//---------------------------------------------------------------------------

#ifndef EditorsMaskDemoDataH
#define EditorsMaskDemoDataH
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
#include <Db.hpp>
//---------------------------------------------------------------------------
class TEditorsMaskDemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
        TcxStyleRepository *StyleRepository;
        TcxStyle *stBlueDark;
        TcxStyle *stGold;
        TcxStyle *stBlueLight;
        TcxStyle *stBlueBright;
        TcxStyle *stYellowLight;
        TcxStyle *stGreyLight;
        TcxStyle *stBlueSky;
        TDatabase *DataBase;
        TTable *ADOTableUSERS;
        TDataSource *DataSourceUSERS;
        TTable *ADOTableDEPARTMENTS;
        TDataSource *DataSourceDEPARTMENTS;
private:	// User declarations
public:		// User declarations
  __fastcall TEditorsMaskDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TEditorsMaskDemoDataDM *EditorsMaskDemoDataDM;
//---------------------------------------------------------------------------
#endif
