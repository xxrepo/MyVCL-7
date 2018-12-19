//---------------------------------------------------------------------------

#ifndef EBarMDIDemoAboutH
#define EBarMDIDemoAboutH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
#include "EBarsAbout.h"
//---------------------------------------------------------------------------
class TEBarMDIDemoAboutForm : public TEBarsAboutForm
{
__published:	// IDE-managed Components
private:	// User declarations
public:		// User declarations
  __fastcall TEBarMDIDemoAboutForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TEBarMDIDemoAboutForm *EBarMDIDemoAboutForm;
//---------------------------------------------------------------------------
#endif
