//---------------------------------------------------------------------------

#ifndef RibbonNotepadDemoOptionsH
#define RibbonNotepadDemoOptionsH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------

struct TScreenTipOptions
{
  bool ShowScreenTips;
  bool ShowDescripitons;
};

class TRibbonDemoOptionsForm : public TForm
{
__published:	// IDE-managed Components
        TComboBox *cbColorScheme;
        TComboBox *cbScreenTipStyle;
        TLabel *lblColorScheme;
        TLabel *lblScreenTipStyle;
        TButton *Button1;
        TButton *Button2;
private:	// User declarations
public:		// User declarations
        __fastcall TRibbonDemoOptionsForm(TComponent* Owner);
        bool __fastcall GetOptions(String &AColorSchemeName, TScreenTipOptions &AScreenTipOptions);
};
//---------------------------------------------------------------------------
extern PACKAGE TRibbonDemoOptionsForm *RibbonDemoOptionsForm;
//---------------------------------------------------------------------------
#endif
