//---------------------------------------------------------------------------
#ifndef CustomFunctionFrmH
#define CustomFunctionFrmH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxControls.hpp"
#include "cxSSheet.hpp"
//---------------------------------------------------------------------------
class TCustomFunctionForm : public TForm
{
__published:	// IDE-managed Components
  TcxSpreadSheet *cxSpreadSheet;
private:	// User declarations
public:		// User declarations
  __fastcall TCustomFunctionForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCustomFunctionForm *CustomFunctionForm;
//---------------------------------------------------------------------------
#endif
