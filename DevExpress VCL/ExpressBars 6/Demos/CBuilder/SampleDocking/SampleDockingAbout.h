//---------------------------------------------------------------------------

#ifndef SampleDockingAboutH
#define SampleDockingAboutH
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
class TSampleDockingAboutForm : public TEBarsAboutForm
{
__published:	// IDE-managed Components
private:	// User declarations
public:		// User declarations
  __fastcall TSampleDockingAboutForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSampleDockingAboutForm *SampleDockingAboutForm;
//---------------------------------------------------------------------------
#endif
