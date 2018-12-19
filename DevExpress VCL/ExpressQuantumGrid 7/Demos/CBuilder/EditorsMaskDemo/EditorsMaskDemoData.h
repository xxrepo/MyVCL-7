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
class TEditorsMaskDemoMainDM : public TDataModule
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
  __fastcall TEditorsMaskDemoMainDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TEditorsMaskDemoMainDM *EditorsMaskDemoMainDM;
//---------------------------------------------------------------------------
#endif
