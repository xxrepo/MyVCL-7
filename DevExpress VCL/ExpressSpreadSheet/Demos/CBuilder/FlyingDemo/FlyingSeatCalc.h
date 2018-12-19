//---------------------------------------------------------------------------
#ifndef FlyingSeatCalcH
#define FlyingSeatCalcH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
enum TEditMode {emKgs, emLbs, emStonesLbs};

class TFlyingSeatCalcForm : public TForm
{
__published:	// IDE-managed Components
  TLabel *lblFormula;
  TGroupBox *GroupBox1;
  TLabel *lblLsPrime;
  TLabel *lblLsLbs;
  TRadioButton *rbLsKgs;
  TRadioButton *rbLsLbs;
  TRadioButton *rbLsStones;
  TEdit *efLsPrime;
  TEdit *efLsLbs;
  TGroupBox *GroupBox2;
  TLabel *lblRsPrime;
  TLabel *lblRsLbs;
  TRadioButton *rbRsKgs;
  TRadioButton *rbRsLbs;
  TRadioButton *rbRsStones;
  TEdit *efRsPrime;
  TEdit *efRsLbs;
  TEdit *efFormula;
  TButton *btnOk;
  TButton *Button2;
  void __fastcall rbLsKgsClick(TObject *Sender);
  void __fastcall meLsPrimeExit(TObject *Sender);
  void __fastcall EdtKeyPress(TObject *Sender, char &Key);
  void __fastcall rbRsStonesClick(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
  bool fInKgs;
  String fCallSign;
  TEditMode fLsMode;
  TEditMode fRsMode;
  void __fastcall SetControls(int aTag, TEdit *aPrime, TEdit *aLbs, TLabel *aPrimeLbl, TLabel *aLbsLbl, TEditMode &aMode);
  String __fastcall GetFormula(TEdit *aPrime, TEdit *aLbs, TRadioButton *arbK, TRadioButton *arbL,
    String aKgsToLbs, String aLbsToKgs);
  double __fastcall GetEfFloatValue(TEdit *aControl);
  int __fastcall GetEfIntValue(TEdit *aControl);
  void __fastcall SetInKgs(const bool Value);
public:		// User declarations
  __fastcall TFlyingSeatCalcForm(TComponent* Owner);
  __property bool ResultInKgs = {read = fInKgs, write = SetInKgs};
  __property String CallSign = {read = fCallSign, write =  fCallSign};
};
//---------------------------------------------------------------------------
extern PACKAGE TFlyingSeatCalcForm *FlyingSeatCalcForm;
//---------------------------------------------------------------------------
#endif
