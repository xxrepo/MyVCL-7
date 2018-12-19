//---------------------------------------------------------------------------

#ifndef MasterDetailTableDemoMainH
#define MasterDetailTableDemoMainH
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
#include <ExtCtrls.hpp>
#include "cxLookAndFeels.hpp"
//---------------------------------------------------------------------------
class TMasterDetailTableDemoMainForm : public TForm
{
__published:  // IDE-managed Components
  TLabel *lblStyle;
  TLabel *lblMaster;
  TBevel *Bevel1;
  TLabel *lbDescription;
  TSplitter *Splitter;
  TPanel *pnlDetail;
  TLabel *lblDetail;
  TcxGrid *GridDetail;
  TcxGridDBTableView *tvFilmsPersonsStaff;
  TcxGridDBColumn *tvFilmsPersonsStaffPERSONLINEID;
  TcxGridDBColumn *tvFilmsPersonsStaffPERSONID;
  TcxGridDBColumn *tvFilmsPersonsStaffDESCRIPTION;
  TcxGridLevel *lvDetail;
  TcxGrid *Grid;
  TcxGridDBTableView *tvFilms;
  TcxGridDBColumn *tvFilmsCAPTION;
  TcxGridDBColumn *tvFilmsYEAR;
  TcxGridDBColumn *tvFilmsRUNTIME;
  TcxGridDBColumn *tvFilmsPHOTO;
  TcxGridDBColumn *tvFilmsTAGLINE;
  TcxGridDBColumn *tvFilmsPLOTOUTLINE;
  TcxGridLevel *lvFilms;
  TcxGridLevel *lvFilmsPersonsStaff;
  TStatusBar *StatusBar;
  TMainMenu *mmMain;
  TMenuItem *miFile;
  TMenuItem *miExit;
  TMenuItem *miOptions;
  TMenuItem *miGrid4;
  TMenuItem *miAbout;
  TcxLookAndFeelController *LookAndFeelController;
  void __fastcall miAboutClick(TObject *Sender);
  void __fastcall miExitClick(TObject *Sender);
  void __fastcall miGrid4Click(TObject *Sender);
private:  // User declarations
  void SetStandardMasterDetailStyle(void);
  void SetGrid4MasterDetailStyle(void);
public:   // User declarations
  __fastcall TMasterDetailTableDemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMasterDetailTableDemoMainForm *MasterDetailTableDemoMainForm;
//---------------------------------------------------------------------------
#endif
