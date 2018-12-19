//---------------------------------------------------------------------------

#ifndef EditorsMaskDemoDataH
#define EditorsMaskDemoDataH
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
  TTable *tblUSERS;
  TDataSource *dsUSERS;
  TTable *tblDEPARTMENTS;
  TDataSource *dsDEPARTMENTS;
private:	// User declarations
public:		// User declarations
  __fastcall TEditorsMaskDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TEditorsMaskDemoDataDM *EditorsMaskDemoDataDM;
//---------------------------------------------------------------------------
#endif
