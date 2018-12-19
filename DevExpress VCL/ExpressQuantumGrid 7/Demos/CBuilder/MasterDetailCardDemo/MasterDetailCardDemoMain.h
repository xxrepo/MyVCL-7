//---------------------------------------------------------------------------

#ifndef MasterDetailCardDemoMainH
#define MasterDetailCardDemoMainH
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
#include "cxCalendar.hpp"
#include "cxCheckBox.hpp"
#include "cxContainer.hpp"
#include "cxDBEdit.hpp"
#include "cxDBLookupComboBox.hpp"
#include "cxDropDownEdit.hpp"
#include "cxGridCardView.hpp"
#include "cxGridDBCardView.hpp"
#include "cxHyperLinkEdit.hpp"
#include "cxLookupEdit.hpp"
#include "cxMaskEdit.hpp"
#include "cxMemo.hpp"
#include "cxTextEdit.hpp"
#include <DBCtrls.hpp>
#include <ExtCtrls.hpp>
#include "cxDBLookupEdit.hpp"
#include "cxNavigator.hpp"
#include "cxDBNavigator.hpp"
#include "cxLookAndFeels.hpp"
//---------------------------------------------------------------------------
class TMasterDetailCardDemoMainForm : public TForm
{
__published:  // IDE-managed Components
        TLabel *lblMaster;
        TLabel *lblStyle;
        TBevel *Bevel1;
        TLabel *lbDescription;
        TcxGrid *cxGrid;
        TcxGridDBTableView *tvFilms;
        TcxGridDBColumn *colFilmsCaption;
        TcxGridDBColumn *colFilmsYear;
        TcxGridDBColumn *colFilmsRuntime;
        TcxGridDBColumn *colFilmsPhoto;
        TcxGridDBColumn *colFilmsTagline;
        TcxGridDBColumn *colFilmsPlotOutline;
        TcxGridDBCardView *cvFilmsPersons;
        TcxGridDBCardViewRow *cvFilmsPersonsName;
        TcxGridDBCardViewRow *cvFilmsPersonsPersonLineID;
        TcxGridDBCardViewRow *cvFilmsPersonsFIRSTNAME;
        TcxGridDBCardViewRow *cvFilmsPersonsSECONDNAME;
        TcxGridDBCardViewRow *cvFilmsPersonsNICKNAME;
        TcxGridDBCardViewRow *cvFilmsPersonsDATEOFBIRTH;
        TcxGridDBCardViewRow *cvFilmsPersonsLOCATIONOFBIRTH;
        TcxGridDBCardViewRow *cvFilmsPersonsBIRTHNAME;
        TcxGridDBCardViewRow *cvFilmsPersonsBIOGRAPHY;
        TcxGridDBCardViewRow *cvFilmsPersonsGender;
        TcxGridDBCardViewRow *cvFilmsPersonsHOMEPAGE;
        TcxGridLevel *lvFilms;
        TcxGridLevel *lvFilmsPersons;
        TPanel *pnlDetail;
        TLabel *lblDetail;
        TPanel *Panel1;
        TLabel *Label1;
        TLabel *Label2;
        TLabel *Label8;
        TLabel *Label9;
        TLabel *Label7;
        TLabel *Label6;
        TLabel *Label4;
        TLabel *Label3;
        TLabel *Label5;
        TcxDBLookupComboBox *cbOccupation;
        TcxDBTextEdit *edFirstName;
        TcxDBTextEdit *edSecondName;
        TcxDBTextEdit *edNickName;
        TcxDBHyperLinkEdit *edHomePage;
        TcxDBNavigator *DBNavigator1;
        TcxDBTextEdit *edBirthName;
        TcxDBTextEdit *edLocationOfBirth;
        TcxDBDateEdit *deDateOfBirth;
        TcxDBMemo *meBiography;
        TcxDBCheckBox *chbMale;
        TStatusBar *StatusBar;
        TMainMenu *mmMain;
        TMenuItem *miFile;
        TMenuItem *miExit;
        TMenuItem *miOptions;
        TMenuItem *miGrid4;
        TMenuItem *miAbout;
        TcxEditStyleController *cxEditStyleController1;
  TcxLookAndFeelController *LookAndFeelController;
  void __fastcall miAboutClick(TObject *Sender);
  void __fastcall miExitClick(TObject *Sender);
  void __fastcall miGrid4Click(TObject *Sender);
private:  // User declarations
  void SetStandardMasterDetailStyle(void);
  void SetGrid4MasterDetailStyle(void);
public:   // User declarations
  __fastcall TMasterDetailCardDemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMasterDetailCardDemoMainForm *MasterDetailCardDemoMainForm;
//---------------------------------------------------------------------------
#endif
