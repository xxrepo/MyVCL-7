//---------------------------------------------------------------------------

#ifndef DockingMegaDemoAboutH
#define DockingMegaDemoAboutH
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
class TDockingMegaDemoAboutForm : public TEBarsAboutForm
{
__published:	// IDE-managed Components
private:	// User declarations
public:		// User declarations
  __fastcall TDockingMegaDemoAboutForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDockingMegaDemoAboutForm *DockingMegaDemoAboutForm;
//---------------------------------------------------------------------------
#endif
