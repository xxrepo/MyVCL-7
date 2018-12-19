//---------------------------------------------------------------------------

#ifndef EBar2000DemoAboutH
#define EBar2000DemoAboutH
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
class TEBar2000DemoAboutForm : public TEBarsAboutForm
{
__published:	// IDE-managed Components
private:	// User declarations
public:		// User declarations
  __fastcall TEBar2000DemoAboutForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TEBar2000DemoAboutForm *EBar2000DemoAboutForm;
//---------------------------------------------------------------------------
#endif
