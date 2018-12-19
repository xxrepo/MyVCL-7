//---------------------------------------------------------------------------

#ifndef StylesCardViewDemoMainH
#define StylesCardViewDemoMainH
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
#include "cxButtons.hpp"
#include "cxCheckBox.hpp"
#include "cxContainer.hpp"
#include "cxGridCardView.hpp"
#include "cxGridDBCardView.hpp"
#include "cxLookAndFeelPainters.hpp"
#include "cxMaskEdit.hpp"
#include "cxSpinEdit.hpp"
#include "cxStyleSheetEditor.hpp"
#include "cxTextEdit.hpp"
#include <ExtCtrls.hpp>
#include "cxLookAndFeels.hpp"
//---------------------------------------------------------------------------
class TStylesCardViewDemoMainForm : public TForm
{
__published:  // IDE-managed Components
  TLabel *lbDescrip;
  TStatusBar *sbMain;
  TcxGrid *cxGrid;
  TcxGridDBCardView *cvDevExpress;
  TcxGridDBCardViewRow *cvDevExpressFullname;
  TcxGridDBCardViewRow *cvDevExpressID;
  TcxGridDBCardViewRow *cvDevExpressFIRSTNAME;
  TcxGridDBCardViewRow *cvDevExpressSECONDNAME;
  TcxGridDBCardViewRow *cvDevExpressGENDER;
  TcxGridDBCardViewRow *cvDevExpressBIRTHNAME;
  TcxGridDBCardViewRow *cvDevExpressDATEOFBIRTH;
  TcxGridDBCardViewRow *cvDevExpressBIRTHCOUNTRY;
  TcxGridDBCardViewRow *cvDevExpressLOCATIONOFBIRTH;
  TcxGridDBCardViewRow *cvDevExpressNICKNAME;
  TcxGridDBCardViewRow *cvDevExpressBIOGRAPHY;
  TcxGridDBCardView *cvSlate;
  TcxGridDBCardViewRow *cvSlateFullName;
  TcxGridDBCardViewRow *cvSlateID;
  TcxGridDBCardViewRow *cvSlateFIRSTNAME;
  TcxGridDBCardViewRow *cvSlateSECONDNAME;
  TcxGridDBCardViewRow *cvSlateGENDER;
  TcxGridDBCardViewRow *cvSlateBIRTHNAME;
  TcxGridDBCardViewRow *cvSlateDATEOFBIRTH;
  TcxGridDBCardViewRow *cvSlateBIRTHCOUNTRY;
  TcxGridDBCardViewRow *cvSlateLOCATIONOFBIRTH;
  TcxGridDBCardViewRow *cvSlateBIOGRAPHY;
  TcxGridDBCardViewRow *cvSlateNICKNAME;
  TcxGridDBCardView *cvHighContrast;
  TcxGridDBCardViewRow *cvHighContrastFullName;
  TcxGridDBCardViewRow *cvHighContrastID;
  TcxGridDBCardViewRow *cvHighContrastFIRSTNAME;
  TcxGridDBCardViewRow *cvHighContrastSECONDNAME;
  TcxGridDBCardViewRow *cvHighContrastGENDER;
  TcxGridDBCardViewRow *cvHighContrastBIRTHNAME;
  TcxGridDBCardViewRow *cvHighContrastDATEOFBIRTH;
  TcxGridDBCardViewRow *cvHighContrastBIRTHCOUNTRY;
  TcxGridDBCardViewRow *cvHighContrastLOCATIONOFBIRTH;
  TcxGridDBCardViewRow *cvHighContrastBIOGRAPHY;
  TcxGridDBCardViewRow *cvHighContrastNICKNAME;
  TcxGridDBCardView *cvUserDefined;
  TcxGridDBCardViewRow *cvUserDefinedFullName;
  TcxGridDBCardViewRow *cvUserDefinedID;
  TcxGridDBCardViewRow *cvUserDefinedFIRSTNAME;
  TcxGridDBCardViewRow *cvUserDefinedSECONDNAME;
  TcxGridDBCardViewRow *cvUserDefinedGENDER;
  TcxGridDBCardViewRow *cvUserDefinedBIRTHNAME;
  TcxGridDBCardViewRow *cvUserDefinedDATEOFBIRTH;
  TcxGridDBCardViewRow *cvUserDefinedBIRTHCOUNTRY;
  TcxGridDBCardViewRow *cvUserDefinedLOCATIONOFBIRTH;
  TcxGridDBCardViewRow *cvUserDefinedBIOGRAPHY;
  TcxGridDBCardViewRow *cvUserDefinedNICKNAME;
  TcxGridLevel *lvDevExpress;
  TcxGridLevel *lvSlate;
  TcxGridLevel *lvHighContrast;
  TcxGridLevel *lvUserDefined;
  TPanel *pnlLeft;
  TGroupBox *GroupBox1;
  TLabel *Label1;
  TLabel *Label2;
  TcxSpinEdit *spedCardWidth;
  TcxSpinEdit *spedCardBorderWidth;
  TcxCheckBox *cbCellAutoHeight;
  TPanel *Panel2;
  TcxButton *btnEdit;
  TMainMenu *mmMain;
  TMenuItem *miFile;
  TMenuItem *miExit;
  TMenuItem *miOptions;
  TMenuItem *miLookAndFeel;
  TMenuItem *KInd1;
  TMenuItem *miFlat;
  TMenuItem *miStandard;
  TMenuItem *miUltraFlat;
  TMenuItem *miNativeStyle;
  TMenuItem *miAbout;
  TcxLookAndFeelController *LookAndFeelController;
  void __fastcall miAboutClick(TObject *Sender);
  void __fastcall miExitClick(TObject *Sender);
  void __fastcall spedCardWidthPropertiesChange(TObject *Sender);
  void __fastcall spedCardBorderWidthPropertiesChange(TObject *Sender);
  void __fastcall cbCellAutoHeightPropertiesChange(TObject *Sender);
  void __fastcall spedCardWidthKeyPress(TObject *Sender, char &Key);
  void __fastcall cxGridActiveTabChanged(TcxCustomGrid *Sender,
          TcxGridLevel *ALevel);
  void __fastcall btnEditClick(TObject *Sender);
  void __fastcall cxGridLayoutChanged(TcxCustomGrid *Sender,
          TcxCustomGridView *AGridView);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall miNativeStyleClick(TObject *Sender);
  void __fastcall miLookAndFeelKindClick(TObject *Sender);
private:  // User declarations
  void GetViewOptions(TcxGridDBCardView *AView);
public:   // User declarations
  __fastcall TStylesCardViewDemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TStylesCardViewDemoMainForm *StylesCardViewDemoMainForm;
//---------------------------------------------------------------------------
#endif
