//---------------------------------------------------------------------------
#ifndef FlyingMainH
#define FlyingMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxControls.hpp"
#include "cxSSheet.hpp"
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Menus.hpp>
//---------------------------------------------------------------------------
class TFlyingMainForm : public TForm
{
__published:	// IDE-managed Components
  TImage *Image1;
  TPaintBox *Pb;
  TImage *Image2;
  TBevel *Bevel1;
  TcxSpreadSheetBook *cxSheetBook;
  TStatusBar *StatusBar;
  TPopupMenu *ssPm;
  TMenuItem *pmWizard;
  TMenuItem *pmoFormat;
  TMainMenu *MainMenu1;
  TMenuItem *File1;
  TMenuItem *mmExit;
  TMenuItem *mmOptions;
  TMenuItem *moToday;
  TMenuItem *moFuelTabs;
  TMenuItem *mmAircraft;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall FormDestroy(TObject *Sender);
  void __fastcall FormShow(TObject *Sender);
  void __fastcall moTodayClick(TObject *Sender);
  void __fastcall cxSheetBookSetSelection(TObject *Sender,
          TcxSSBookSheet *ASheet);
  void __fastcall cxSheetBookSheetPopupMenu(TObject *Sender, int X, int Y);
  void __fastcall cxSheetBookTopLeftChanging(TcxSSBookSheet *Sender,
          TPoint &ATopLeft);
  void __fastcall cxSheetBookAfterCalculation(TObject *Sender);
  void __fastcall mmExitClick(TObject *Sender);
  void __fastcall moFuelTabsClick(TObject *Sender);
  void __fastcall pmWizardClick(TObject *Sender);
  void __fastcall pmoFormatClick(TObject *Sender);
  void __fastcall PbPaint(TObject *Sender);
        void __fastcall cxSheetBookActiveCellChanging(
          TcxSSBookSheet *Sender, const TPoint &ActiveCell,
          bool &CanSelect);
private:	// User declarations
    TMenuItem * fMenuItems;
    int fMenuItemsCount;
    TColor fDepCofGColour;
    TColor fArrCofGColour;
    String fPlaneReg;
    String fPlaneCofgBitmap;
    String fPlanePhoto;
    String fWeightUnits;
    int fMaxPersons;
    double fMaxTakeOffWt;
    double fMaxLandingWt;
    double fMaxBaggageWt;
    double fMaxBaggageWt2;
    double fMaxFuelCapacity;
    double fTabsFuel;
    double fMinAftCofG;
    double fMaxAftCofG;
    double fCofGAxisStarts;
    double fCofgStep;
    double fWtStep;
    double fCofgMultiplier;
    int fCofGAxis;
    double fCofGWeightMin;
    int fCofGWeightAxis;
    int fEnvelopeSize;
    Word fNormalCellColour;
    Word fErrorCellColour;
    TPoint *fCofGEnvelope;
    void __fastcall CheckFigures();
    void __fastcall SetupPlane();
    void __fastcall LoadPlaneVars();
    bool CofGOutsideEnvelope(const double aCofG, const double aWeight);
    void __fastcall LoadImage(String const aResJpg,
                           TImage *AnImage);
    double __fastcall GetCellDouble(const int aCol, const int aRow);
    String __fastcall GetCellString(const int aCol, const int aRow);
    int __fastcall GetCellInt(const int aCol, const int aRow);
    Word __fastcall GetCellColour(const int aCol, const int aRow);
    void __fastcall UpdateCofG();
    void __fastcall SetCellMessage(const int aCol, const int aRow, const String aMessage,
      const Word aBackgroundColour, const Word aFontColour);
    TColor __fastcall GetCellTColour(const int aCol, const int aRow);
    void __fastcall moSelectPlaneClick(TObject *Sender);
    void __fastcall PlotPoint(const double aWt, const double aCofG, const TColor aColour);
public:		// User declarations
    bool IsChecked;
  __fastcall TFlyingMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFlyingMainForm *FlyingMainForm;
//---------------------------------------------------------------------------
#endif
