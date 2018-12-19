//---------------------------------------------------------------------------

#ifndef UnboundExternalDataDemoMainH
#define UnboundExternalDataDemoMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxControls.hpp"
#include "cxCustomData.hpp"
#include "cxData.hpp"
#include "cxDBData.hpp"
#include "cxEdit.hpp"
#include "cxFilter.hpp"
#include "cxGraphics.hpp"
#include "cxGrid.hpp"
#include "cxGridCustomTableView.hpp"
#include "cxGridCustomView.hpp"
#include "cxGridDBTableView.hpp"
#include "cxGridLevel.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include <ActnList.hpp>
#include <ComCtrls.hpp>
#include <DB.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
#include <Dialogs.hpp>
#include "UnboundExternalDataDemoClasses.h"
#include "cxLookAndFeels.hpp"
//---------------------------------------------------------------------------
class TUnboundExternalDataDemoMainForm : public TForm
{
__published:  // IDE-managed Components
  TLabel *lbDescription;
  TStatusBar *sbMain;
  TcxGrid *cxGrid;
  TcxGridTableView *tvSections;
  TcxGridTableView *tvValues;
  TcxGridLevel *SectionLevel;
  TcxGridLevel *DetailLevel;
  TMainMenu *mmMain;
  TMenuItem *miFile;
  TMenuItem *miOpen;
  TMenuItem *miSave;
  TMenuItem *miSaveAs;
  TMenuItem *N1;
  TMenuItem *Exit1;
  TMenuItem *Edit1;
  TMenuItem *mnInsertSection;
  TMenuItem *miDeleteSection;
  TMenuItem *miAbout;
  TcxStyleRepository *StyleRepository;
  TcxStyle *stBlueDarkBold;
  TcxStyle *stBlueLight;
  TcxStyle *stBlueBright;
  TcxStyle *stYellowLight;
  TcxStyle *stGreyLight;
  TcxStyle *stBlueSky;
  TcxStyle *stBlueDark;
  TcxStyle *stGold;
  TOpenDialog *OpenDialog;
  TSaveDialog *SaveDialog;
  TcxLookAndFeelController *LookAndFeelController;
  void __fastcall miAboutClick(TObject *Sender);
  void __fastcall miExitClick(TObject *Sender);
  void __fastcall miInsertClick(TObject *Sender);
  void __fastcall miDeleteClick(TObject *Sender);
  void __fastcall miOpenClick(TObject *Sender);
  void __fastcall miSaveClick(TObject *Sender);
  void __fastcall miSaveAsClick(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall FormCloseQuery(TObject *Sender, bool &CanClose);
  void __fastcall FormDestroy(TObject *Sender);
  void __fastcall sbMainResize(TObject *Sender);
private:  // User declarations
  int FChangesCount;
  TUserIniFile* IniFile;
  TUserDataSource* UserDataSource;
  TUserDetailDataSource* UserDetailDataSource;
  void __fastcall CustomizeGrid();
  void __fastcall GenerateColumns();
  void __fastcall LoadData();
  void __fastcall Load(String const AFileName);
  void __fastcall UpdateFileInfo(String const AFileName);
  void __fastcall ResetChanges();
  void __fastcall DoSmthOnModify(TObject* Sender);
public:   // User declarations
  __fastcall TUnboundExternalDataDemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TUnboundExternalDataDemoMainForm *UnboundExternalDataDemoMainForm;
//---------------------------------------------------------------------------
#endif
