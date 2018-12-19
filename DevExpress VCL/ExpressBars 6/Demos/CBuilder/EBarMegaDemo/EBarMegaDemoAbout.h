//---------------------------------------------------------------------------

#ifndef EBarMegaDemoAboutH
#define EBarMegaDemoAboutH
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
class TEBarMegaDemoAboutForm : public TEBarsAboutForm
{
__published:	// IDE-managed Components
private:	// User declarations
public:		// User declarations
  __fastcall TEBarMegaDemoAboutForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TEBarMegaDemoAboutForm *EBarMegaDemoAboutForm;
//---------------------------------------------------------------------------
#endif
