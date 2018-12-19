//---------------------------------------------------------------------------

#ifndef CustomRowHeightDemoDataH
#define CustomRowHeightDemoDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include "cxDBEditRepository.hpp"
#include "cxEdit.hpp"
#include "cxEditRepositoryItems.hpp"
#include "cxGridCardView.hpp"
#include <ImgList.hpp>
#include <DBTables.hpp>
#include <Db.hpp>
//---------------------------------------------------------------------------
class TCustomRowHeightDemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
  TDatabase *Database;
  TTable *tblFilms;
  TAutoIncField *tblFilmsID;
  TStringField *tblFilmsCAPTION;
  TIntegerField *tblFilmsYEAR;
  TStringField *tblFilmsTAGLINE;
  TStringField *tblFilmsPLOTOUTLINE;
  TIntegerField *tblFilmsRUNTIME;
  TStringField *tblFilmsCOLOR;
  TBlobField *tblFilmsPHOTO;
  TBlobField *tblFilmsICON;
  TStringField *tblFilmsWEBSITE;
  TDataSource *dsFilms;
private:	// User declarations
public:		// User declarations
  __fastcall TCustomRowHeightDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCustomRowHeightDemoDataDM *CustomRowHeightDemoDataDM;
//---------------------------------------------------------------------------
#endif
