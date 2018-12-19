//---------------------------------------------------------------------------
#ifndef previewH
#define previewH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <DBCtrls.hpp>
//---------------------------------------------------------------------------
class TpreviewForm : public TForm
{
__published:	// IDE-managed Components
    TDBImage *DBImage;
private:	// User declarations
public:		// User declarations
    __fastcall TpreviewForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TpreviewForm *previewForm;
//---------------------------------------------------------------------------
#endif
