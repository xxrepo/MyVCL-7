//---------------------------------------------------------------------------

#ifndef RibbonNotepadDemoOptionsH
#define RibbonNotepadDemoOptionsH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------

enum TRibbonDemoStyle {rdsOffice2007, rdsOffice2010, rdsScenic};

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
		TComboBox *cbRibbonStyle;
		TLabel *lblColorScheme;
		TLabel *lblScreenTipStyle;
		TButton *Button1;
		TButton *Button2;
		TBevel *gbPanel;
public:		// User declarations
		__fastcall TRibbonDemoOptionsForm(TComponent* Owner);
		void LoadOptions(String AColorSchemeName, TScreenTipOptions AScreenTipOptions, TRibbonDemoStyle AStyle);
		void SaveOptions(String *AColorSchemeName, TScreenTipOptions *AScreenTipOptions, TRibbonDemoStyle *AStyle);
};
//---------------------------------------------------------------------------
extern PACKAGE TRibbonDemoOptionsForm *RibbonDemoOptionsForm;
//---------------------------------------------------------------------------
BOOL ExecuteRibbonDemoOptions(String *AColorSchemeName,
	TScreenTipOptions *AScreenTipOptions, TRibbonDemoStyle *AStyle);

#endif
