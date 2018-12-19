//---------------------------------------------------------------------------

#ifndef ConvertTreeList3DemoMainH
#define ConvertTreeList3DemoMainH
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
#include "cxCalc.hpp"
#include "cxCheckBox.hpp"
#include "cxDBTL.hpp"
#include "cxHyperLinkEdit.hpp"
#include "cxInplaceContainer.hpp"
#include "cxMaskEdit.hpp"
#include "cxTextEdit.hpp"
#include "cxTL.hpp"
#include "cxTLData.hpp"
#include "dxCntner.hpp"
#include "dxDBCtrl.hpp"
#include "dxDBTL.hpp"
#include "dxDBTLCl.hpp"
#include "dxExEdtr.hpp"
#include "dxTL.hpp"
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TConvertTreeList3DemoMainForm : public TDemoBasicMainForm
{
__published:	// IDE-managed Components
  TPanel *pnlEQTL3Descrip;
  TcxStyleRepository *cxStyleRepository1;
  TcxStyle *cxStyle6;
  TcxStyle *cxStyle7;
  TcxStyle *cxStyle8;
  TcxStyle *cxStyle9;
  TcxStyle *cxStyle10;
  TcxStyle *cxStyle11;
  TcxStyle *cxStyle12;
  TdxDBTreeList *dxDBTreeList;
  TdxDBTreeListMaskColumn *dxDBTreeListID;
  TdxDBTreeListMaskColumn *dxDBTreeListPARENTID;
  TdxDBTreeListColumn *dxDBTreeListNAME;
  TdxDBTreeListCalcColumn *dxDBTreeListBUDGET;
  TdxDBTreeListColumn *dxDBTreeListPHONE;
  TdxDBTreeListColumn *dxDBTreeListFAX;
  TdxDBTreeListHyperLinkColumn *dxDBTreeListEMAIL;
  TdxDBTreeListCheckColumn *dxDBTreeListVACANCY;
  TPanel *pnlEQTL4Descrip;
  TPanel *pnlTreeList4Container;
  TcxDBTreeList *cxDBTreeList;
  TcxDBTreeListColumn *cxDBTreeListID;
  TcxDBTreeListColumn *cxDBTreeListPARENTID;
  TcxDBTreeListColumn *cxDBTreeListNAME;
  TcxDBTreeListColumn *cxDBTreeListBUDGET;
  TcxDBTreeListColumn *cxDBTreeListPHONE;
  TcxDBTreeListColumn *cxDBTreeListFAX;
  TcxDBTreeListColumn *cxDBTreeListEMAIL;
  TcxDBTreeListColumn *cxDBTreeListVACANCY;
  void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TConvertTreeList3DemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TConvertTreeList3DemoMainForm *ConvertTreeList3DemoMainForm;
//---------------------------------------------------------------------------
#endif
