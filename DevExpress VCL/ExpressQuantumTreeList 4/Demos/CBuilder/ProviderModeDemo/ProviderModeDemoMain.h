//---------------------------------------------------------------------------

#ifndef ProviderModeDemoMainH
#define ProviderModeDemoMainH
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
#include "cxStyles.hpp"
#include <ActnList.hpp>
#include <ComCtrls.hpp>
#include <DB.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
#include "cxLookAndFeels.hpp"
#include "DemoBasicMain.h"
#include "cxCalendar.hpp"
#include "cxInplaceContainer.hpp"
#include "cxSpinEdit.hpp"
#include "cxTextEdit.hpp"
#include "cxTL.hpp"
#include "cxTLData.hpp"
//---------------------------------------------------------------------------
class TProviderModeDemoMainForm : public TDemoBasicMainForm
{
__published:	// IDE-managed Components
  TMenuItem *miFlat;
  TMenuItem *miUltraFlat;
  TMenuItem *miStandard;
  TMenuItem *miNativeStyle;
  TcxVirtualTreeList *TreeList;
  TcxTreeListColumn *clnId;
  TcxTreeListColumn *clnName;
  TcxTreeListColumn *clnDate;
  TcxStyleRepository *StyleRepository;
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
  TcxStyle *stlGroupNode;
  TcxStyle *stlFixedBand;
  TcxTreeListStyleSheet *TreeListStyleSheetDevExpress;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall FormDestroy(TObject *Sender);
  void __fastcall FormShow(TObject *Sender);
  void __fastcall LookAndFeelChange(TObject *Sender);
  void __fastcall miShowTreeLinesClick(TObject *Sender);
  void __fastcall miShowIndicatorClick(TObject *Sender);
  void __fastcall miShowRootClick(TObject *Sender);
  void __fastcall miShowButtonsClick(TObject *Sender);
  void __fastcall miSmartLoadModeClick(TObject *Sender);
  void __fastcall miCellAutoHeightClick(TObject *Sender);
  void __fastcall miCellEndEllipsisClick(TObject *Sender);
  void __fastcall miColumnAutoWidthClick(TObject *Sender);
        void __fastcall TreeListDragOver(TObject *Sender, TObject *Source,
          int X, int Y, TDragState State, bool &Accept);
private:	// User declarations
public:		// User declarations
  __fastcall TProviderModeDemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TProviderModeDemoMainForm *ProviderModeDemoMainForm;
//---------------------------------------------------------------------------
#endif
