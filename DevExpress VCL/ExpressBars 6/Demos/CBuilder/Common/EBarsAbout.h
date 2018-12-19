//---------------------------------------------------------------------------

#ifndef EBarsAboutH
#define EBarsAboutH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
//---------------------------------------------------------------------------
class TEBarsAboutForm : public TForm
{
__published:	// IDE-managed Components
  TLabel *lbCopyright;
  TBevel *bvBottom;
  TLabel *lbCompanyName;
  TLabel *lbDemoName;
  TImage *imgIcon;
  TRichEdit *reDemoInfo;
  TButton *btnOK;
private:	// User declarations
public:		// User declarations
  __fastcall TEBarsAboutForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
#endif
