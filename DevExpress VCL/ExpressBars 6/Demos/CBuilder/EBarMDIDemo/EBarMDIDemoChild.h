//---------------------------------------------------------------------------
#ifndef EBarMDIDemoChildH
#define EBarMDIDemoChildH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
//---------------------------------------------------------------------------
class TEBarMDIDemoChildForm : public TForm
{
__published:	// IDE-managed Components
        TRichEdit *Editor;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
        void __fastcall FormActivate(TObject *Sender);
        void __fastcall FormDestroy(TObject *Sender);
        void __fastcall FormCloseQuery(TObject *Sender, bool &CanClose);
        void __fastcall EditorMouseDown(TObject *Sender,
          TMouseButton Button, TShiftState Shift, int X, int Y);
private:
        AnsiString FFileName;
        void __fastcall SetFileName(AnsiString Value);
public:
        __fastcall TEBarMDIDemoChildForm(TComponent* Owner);
        __property AnsiString FileName = {read = FFileName, write = SetFileName};
};
//---------------------------------------------------------------------------
extern PACKAGE TEBarMDIDemoChildForm *EBarMDIDemoChildForm;
//---------------------------------------------------------------------------
#endif
