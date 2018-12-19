//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SummariesDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxStyles"
#pragma link "cxTL"
#pragma resource "*.dfm"
TSummariesDemoDataDM *SummariesDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TSummariesDemoDataDM::TSummariesDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------




