//---------------------------------------------------------------------------

#ifndef RibbonDemoAboutH
#define RibbonDemoAboutH
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
class TRibbonDemoAboutForm : public TEBarsAboutForm
{
__published:	// IDE-managed Components
private:	// User declarations
public:		// User declarations
        __fastcall TRibbonDemoAboutForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TRibbonDemoAboutForm *RibbonDemoAboutForm;
//---------------------------------------------------------------------------
#endif
