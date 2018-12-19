//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "RTTIInspectorDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxStyles"
#pragma link "cxVGrid"
#pragma resource "*.dfm"
TRTTIInspectorDemoMainDM *RTTIInspectorDemoMainDM;
//---------------------------------------------------------------------------
__fastcall TRTTIInspectorDemoMainDM::TRTTIInspectorDemoMainDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
