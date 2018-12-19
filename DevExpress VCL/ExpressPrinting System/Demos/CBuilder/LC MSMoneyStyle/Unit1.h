//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxControls.hpp"
#include "dxLayoutControl.hpp"
#include "dxLayoutLookAndFeels.hpp"
#include "dxPSContainerLnk.hpp"
#include "dxPSCore.hpp"
#include "dxPSdxLC2Lnk.hpp"
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include "cxGraphics.hpp"
#include "cxLookAndFeelPainters.hpp"
#include "cxLookAndFeels.hpp"
#include "dxBkgnd.hpp"
#include "dxPrnDev.hpp"
#include "dxPrnPg.hpp"
#include "dxPSCompsProvider.hpp"
#include "dxPSEdgePatterns.hpp"
#include "dxPSEngn.hpp"
#include "dxPSFillPatterns.hpp"
#include "dxPSGlbl.hpp"
#include "dxPSUtl.hpp"
#include "dxWrap.hpp"
#include <jpeg.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:  // IDE-managed Components
  TdxLayoutControl *lcBackground;
  TSpeedButton *sbGoBack;
  TSpeedButton *sbGoForward;
  TBevel *Bevel1;
  TSpeedButton *sbPreview;
  TdxLayoutGroup *dxLayoutGroup1;
  TdxLayoutGroup *dxLayoutGroup2;
  TdxLayoutItem *dxLayoutItem1;
  TdxLayoutItem *lcBackgroundItem2;
  TdxLayoutItem *lcBackgroundItem4;
  TdxLayoutItem *lcBackgroundItem3;
  TdxLayoutItem *lcBackgroundSiteItem;
  TdxLayoutItem *lcBackgroundItem5;
  TPageControl *PageControl1;
  TTabSheet *TabSheet1;
  TdxLayoutControl *lcMain;
  TImage *Image1;
  TdxLayoutGroup *lcMain___Root;
  TdxLayoutGroup *dxLayoutGroup3;
  TdxLayoutGroup *lcMainGroup4;
  TdxLayoutGroup *lcMainGroup20;
  TdxLayoutItem *dxLayoutItem2;
  TdxLayoutItem *lcMainItem5;
  TdxLayoutItem *lcMainItem9;
  TdxLayoutItem *lcMainItem11;
  TdxLayoutItem *lcMainItem13;
  TdxLayoutGroup *lcMainGroup25;
  TdxLayoutGroup *lcMainGroup22;
  TdxLayoutItem *lcMainItem3;
  TdxLayoutGroup *lcMainGroup23;
  TdxLayoutItem *lcMainItem7;
  TdxLayoutItem *lcMainItem27;
  TdxLayoutGroup *lcMainGroup2;
  TdxLayoutGroup *lcMainGroup17;
  TdxLayoutGroup *lcMainGroup10;
  TdxLayoutItem *lcMainItem15;
  TdxLayoutItem *lcMainItem16;
  TdxLayoutGroup *lcMainGroup13;
  TdxLayoutItem *lcMainItem17;
  TdxLayoutItem *lcMainItem18;
  TdxLayoutGroup *lcMainGroup15;
  TdxLayoutItem *lcMainItem19;
  TdxLayoutItem *lcMainItem20;
  TdxLayoutGroup *lcMainGroup3;
  TdxLayoutGroup *lcMainGroup21;
  TdxLayoutGroup *lcMainGroup16;
  TdxLayoutItem *lcMainItem21;
  TdxLayoutItem *lcMainItem22;
  TdxLayoutGroup *lcMainGroup18;
  TdxLayoutItem *lcMainItem23;
  TdxLayoutItem *lcMainItem24;
  TdxLayoutGroup *lcMainGroup19;
  TdxLayoutItem *lcMainItem25;
  TdxLayoutItem *lcMainItem26;
  TdxLayoutItem *lcMainItem2;
  TdxLayoutItem *lcMainItem6;
  TdxLayoutItem *lcMainItem10;
  TdxLayoutItem *lcMainItem12;
  TdxLayoutItem *lcMainItem14;
  TdxLayoutItem *lcMainItem4;
  TdxLayoutItem *lcMainItem8;
  TTabSheet *TabSheet2;
  TdxLayoutControl *lcVCL;
  TImage *Image2;
  TImage *Image3;
  TImage *Image4;
  TImage *Image5;
  TImage *Image6;
  TImage *Image7;
  TImage *Image8;
  TImage *Image9;
  TImage *Image10;
  TdxLayoutGroup *dxLayoutGroup4;
  TdxLayoutGroup *dxLayoutGroup5;
  TdxLayoutItem *dxLayoutItem3;
  TdxLayoutItem *dxLayoutItem4;
  TdxLayoutItem *dxLayoutItem5;
  TdxLayoutItem *dxLayoutItem6;
  TdxLayoutItem *dxLayoutItem7;
  TdxLayoutItem *dxLayoutItem8;
  TdxLayoutItem *dxLayoutItem9;
  TdxLayoutItem *dxLayoutItem10;
  TdxLayoutItem *dxLayoutItem11;
  TTabSheet *TabSheet3;
  TdxLayoutControl *lcActiveX;
  TImage *Image11;
  TImage *Image12;
  TImage *Image13;
  TImage *Image14;
  TImage *Image15;
  TImage *Image16;
  TImage *Image17;
  TdxLayoutGroup *dxLayoutGroup6;
  TdxLayoutGroup *dxLayoutGroup7;
  TdxLayoutItem *dxLayoutItem12;
  TdxLayoutItem *dxLayoutItem13;
  TdxLayoutItem *dxLayoutItem14;
  TdxLayoutItem *dxLayoutItem15;
  TdxLayoutItem *dxLayoutItem16;
  TdxLayoutItem *dxLayoutItem17;
  TdxLayoutItem *dxLayoutItem18;
  TTabSheet *TabSheet4;
  TdxLayoutControl *lcNET;
  TImage *Image18;
  TdxLayoutGroup *dxLayoutGroup8;
  TdxLayoutGroup *dxLayoutGroup9;
  TdxLayoutItem *lcMainItem1;
  TdxLayoutItem *dxLayoutItem19;
  TdxLayoutItem *dxLayoutItem20;
  TdxLayoutItem *dxLayoutItem21;
  TdxLayoutItem *dxLayoutItem22;
  TdxLayoutGroup *lcMainGroup5;
  TdxLayoutItem *dxLayoutItem23;
  TdxLayoutItem *dxLayoutItem24;
  TdxLayoutGroup *lcMainGroup6;
  TdxLayoutItem *dxLayoutItem25;
  TdxLayoutItem *dxLayoutItem26;
  TdxLayoutGroup *lcMainGroup7;
  TdxLayoutItem *dxLayoutItem27;
  TdxLayoutItem *dxLayoutItem28;
  TdxLayoutGroup *lcMainGroup8;
  TdxLayoutItem *dxLayoutItem29;
  TdxLayoutItem *dxLayoutItem30;
  TdxLayoutItem *dxLayoutItem31;
  TdxLayoutLookAndFeelList *dxLayoutLookAndFeelList1;
  TdxLayoutWebLookAndFeel *lfMain;
  TdxLayoutWebLookAndFeel *lfVCLProducts;
  TdxLayoutWebLookAndFeel *lfActiveXProducts;
  TdxLayoutWebLookAndFeel *lfNETProducts;
  TdxLayoutWebLookAndFeel *lfVCLProductsGroups;
  TdxLayoutWebLookAndFeel *lfBackground;
  TdxLayoutLookAndFeelList *dxLayoutLookAndFeelList2;
  TdxLayoutWebLookAndFeel *lfProducts;
  TdxLayoutWebLookAndFeel *lfProductsLink;
  TdxComponentPrinter *dxComponentPrinter1;
  TdxLayoutControlReportLink *dxComponentPrinter1Link3;
  TdxLayoutControlReportLink *dxComponentPrinter1Link2;
  TdxLayoutControlReportLink *dxComponentPrinter1Link4;
  TdxLayoutControlReportLink *dxComponentPrinter1Link5;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall lcMainGroupCaptionClick(TObject *Sender);
  void __fastcall sbGoBackClick(TObject *Sender);
  void __fastcall sbGoForwardClick(TObject *Sender);
  void __fastcall sbPreviewClick(TObject *Sender);
private:
  int FActiveScreen;
  int FLastActiveScreen;
  TdxLayoutControl* GetLayoutControl(int AIndex);
  void __fastcall SetActiveScreen(int Value);
protected:
  void __fastcall GoBack();
  void __fastcall GoForward();
  void __fastcall RefreshEnableds();
  __property int ActiveScreen = {read=FActiveScreen,write=SetActiveScreen};
  __property int LastActiveScreen = {read=FLastActiveScreen};
public:   // User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
