//---------------------------------------------------------------------------

#ifndef ViewBandeDemoBandsH
#define ViewBandeDemoBandsH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxButtons.hpp"
#include "cxLookAndFeelPainters.hpp"
#include "cxListBox.hpp"
//---------------------------------------------------------------------------
class TViewBandeDemoBandsForm : public TForm
{
__published:	// IDE-managed Components
  TcxListBox *lbBands;
  TcxButton *btnOK;
  TcxButton *btnCancel;
private:	// User declarations
public:		// User declarations
  __fastcall TViewBandeDemoBandsForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TViewBandeDemoBandsForm *ViewBandeDemoBandsForm;
//---------------------------------------------------------------------------
#endif
