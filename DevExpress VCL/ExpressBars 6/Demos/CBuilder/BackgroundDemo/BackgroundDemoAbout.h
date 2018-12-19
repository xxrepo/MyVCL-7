//---------------------------------------------------------------------------

#ifndef BackgroundDemoAboutH
#define BackgroundDemoAboutH
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
class TBackgroundDemoAboutForm : public TEBarsAboutForm
{
__published:	// IDE-managed Components
private:	// User declarations
public:		// User declarations
  __fastcall TBackgroundDemoAboutForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBackgroundDemoAboutForm *BackgroundDemoAboutForm;
//---------------------------------------------------------------------------
#endif
