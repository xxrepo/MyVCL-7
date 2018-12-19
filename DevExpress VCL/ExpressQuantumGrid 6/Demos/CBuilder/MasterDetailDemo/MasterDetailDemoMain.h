//---------------------------------------------------------------------------

#ifndef MasterDetailDemoMainH
#define MasterDetailDemoMainH
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
#include "cxGridCardView.hpp"
#include "cxGridDBCardView.hpp"
#include "cxLookAndFeels.hpp"
//---------------------------------------------------------------------------
class TMasterDetailDemoMainForm : public TForm
{
__published:  // IDE-managed Components
  TLabel *lbDescription;
  TStatusBar *StatusBar;
  TcxGrid *Grid;
  TcxGridDBTableView *tvFilms;
  TcxGridDBColumn *tvFilmsID;
  TcxGridDBColumn *tvFilmsCAPTION;
  TcxGridDBColumn *tvFilmsYEAR;
  TcxGridDBColumn *tvFilmsTAGLINE;
  TcxGridDBColumn *tvFilmsPLOTOUTLINE;
  TcxGridDBColumn *tvFilmsRUNTIME;
  TcxGridDBColumn *tvFilmsCOLOR;
  TcxGridDBColumn *tvFilmsPHOTO;
  TcxGridDBColumn *tvFilmsICON;
  TcxGridDBColumn *tvFilmsWEBSITE;
  TcxGridDBCardView *cvPeople;
  TcxGridDBCardViewRow *cvPeopleName;
  TcxGridDBCardViewRow *cvPeoplePersonLineID;
  TcxGridDBCardViewRow *cvPeopleFIRSTNAME;
  TcxGridDBCardViewRow *cvPeopleSECONDNAME;
  TcxGridDBCardViewRow *cvPeopleNICKNAME;
  TcxGridDBCardViewRow *cvPeopleBIRTHNAME;
  TcxGridDBCardViewRow *cvPeopleDATEOFBIRTH;
  TcxGridDBCardViewRow *cvPeopleLOCATIONOFBIRTH;
  TcxGridDBCardViewRow *cvPeopleBIOGRAPHY;
  TcxGridDBCardViewRow *cvPeopleHOMEPAGE;
  TcxGridDBCardViewRow *cvPeopleID;
  TcxGridDBCardViewRow *cvPeopleFilmID;
  TcxGridDBCardViewRow *cvPeopleBIRTHCOUNTRY;
  TcxGridDBCardViewRow *cvPeopleGender;
  TcxGridDBTableView *tvCompanies;
  TcxGridDBColumn *tvCompaniesName;
  TcxGridDBColumn *tvCompaniesType;
  TcxGridDBColumn *tvCompaniesCountry;
  TcxGridDBColumn *tvCompaniesWebSite;
  TcxGridDBColumn *tvCompaniesID;
  TcxGridDBColumn *tvCompaniesFILMID;
  TcxGridDBCardView *cvPhotos;
  TcxGridDBCardViewRow *cvPhotosID;
  TcxGridDBCardViewRow *cvPhotosFILMID;
  TcxGridDBCardViewRow *cvPhotosSCREEN;
  TcxGridDBCardViewRow *cvPhotosICON;
  TcxGridLevel *lvFilms;
  TcxGridLevel *lvPeople;
  TcxGridLevel *lvCompanies;
  TcxGridLevel *lvPhotos;
  TcxStyleRepository *cxStyleRepository1;
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
  TcxStyle *cxStyle15;
  TcxStyle *cxStyle16;
  TcxStyle *cxStyle17;
  TcxStyle *cxStyle18;
  TcxStyle *cxStyle19;
  TcxStyle *cxStyle20;
  TcxStyle *cxStyle21;
  TcxStyle *cxStyle22;
  TcxStyle *cxStyle23;
  TcxStyle *cxStyle24;
  TcxGridTableViewStyleSheet *GridTableViewStyleSheetDevExpress;
  TcxGridCardViewStyleSheet *GridCardViewStyleSheetDevExpress;
  TcxLookAndFeelController *LookAndFeelController;
  TMainMenu *mmMain;
  TMenuItem *miFile;
  TMenuItem *miExit;
  TMenuItem *miOptions;
  TMenuItem *miTabsPosition;
  TMenuItem *miLeftTabsPosition;
  TMenuItem *miTopTabsPosition;
  TMenuItem *miDetailViewsSynchronization;
  TMenuItem *miSeparator1;
  TMenuItem *miShowPreviewData;
  TMenuItem *miAbout;
  void __fastcall miAboutClick(TObject *Sender);
  void __fastcall miExitClick(TObject *Sender);
  void __fastcall FormShow(TObject *Sender);
  void __fastcall miShowPreviewDataClick(TObject *Sender);
  void __fastcall miTabsPositionClick(TObject *Sender);
  void __fastcall miDetailViewsSynchronizationClick(TObject *Sender);
private:  // User declarations
public:   // User declarations
  __fastcall TMasterDetailDemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMasterDetailDemoMainForm *MasterDetailDemoMainForm;
//---------------------------------------------------------------------------
#endif
