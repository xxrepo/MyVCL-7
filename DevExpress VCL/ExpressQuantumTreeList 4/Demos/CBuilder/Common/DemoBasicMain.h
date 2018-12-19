//---------------------------------------------------------------------------

#ifndef DemoBasicMainH
#define DemoBasicMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxLookAndFeels.hpp"
#include <ActnList.hpp>
#include <ComCtrls.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
//---------------------------------------------------------------------------
class TDemoBasicMainForm : public TForm
{
__published:	// IDE-managed Components
  TStatusBar *sbMain;
  TMemo *memAboutText;
  TMainMenu *mmMain;
  TMenuItem *miFile;
  TMenuItem *miExit;
  TMenuItem *miOptions;
  TMenuItem *miShowDemoDescription;
  TMenuItem *miHelp;
  TMenuItem *miGridHelp;
  TMenuItem *miRate;
  TMenuItem *miSeparator3;
  TMenuItem *miProducts;
  TMenuItem *miDownloads;
  TMenuItem *miForum;
  TMenuItem *miDeveloperExpressontheweb;
  TMenuItem *miSeparator4;
  TMenuItem *miSupport;
  TMenuItem *miAbout;
  TImageList *ilMain;
  TActionList *alMain;
  TAction *actHelp;
  TAction *actDownloads;
  TAction *actForum;
  TAction *actDXOnTheWeb;
  TAction *actProducts;
  TAction *actAbout;
  TAction *actExit;
  TAction *actShowDemoDescription;
  TAction *actSupport;
  TAction *actRateDemo;
  TcxLookAndFeelController *cxLookAndFeelController;
  TLabel  *lscrip;
  void __fastcall actAboutExecute(TObject *Sender);
  void __fastcall actDownloadsExecute(TObject *Sender);
  void __fastcall actDXOnTheWebExecute(TObject *Sender);
  void __fastcall actExitExecute(TObject *Sender);
  void __fastcall actForumExecute(TObject *Sender);
  void __fastcall actHelpExecute(TObject *Sender);
  void __fastcall actProductsExecute(TObject *Sender);
  void __fastcall actRateDemoExecute(TObject *Sender);
  void __fastcall actShowDemoDescriptionExecute(TObject *Sender);
  void __fastcall actSupportExecute(TObject *Sender);
protected:
  void AdjustAboutText(TStrings *AAboutText);
  void ShowAbout(bool AModal, bool AOnTop);
private:	// User declarations
public:		// User declarations
  __fastcall TDemoBasicMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDemoBasicMainForm *DemoBasicMainForm;
//---------------------------------------------------------------------------
#endif
 