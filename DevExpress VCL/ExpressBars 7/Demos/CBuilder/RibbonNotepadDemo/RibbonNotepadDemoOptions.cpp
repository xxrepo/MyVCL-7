//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "RibbonNotepadDemoOptions.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TRibbonDemoOptionsForm *RibbonDemoOptionsForm;

BOOL ExecuteRibbonDemoOptions(String *AColorSchemeName,
	TScreenTipOptions *AScreenTipOptions, TRibbonDemoStyle *AStyle)
{
	TRibbonDemoOptionsForm *Form = new TRibbonDemoOptionsForm(NULL);
	Form->LoadOptions(*AColorSchemeName, *AScreenTipOptions, *AStyle);
	BOOL Result = Form->ShowModal() == mrOk;
	if (Result)
	  Form->SaveOptions(AColorSchemeName, AScreenTipOptions, AStyle);
	delete Form;
	return Result;
}

//---------------------------------------------------------------------------
__fastcall TRibbonDemoOptionsForm::TRibbonDemoOptionsForm(TComponent* Owner)
		: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void TRibbonDemoOptionsForm::LoadOptions(String AColorSchemeName,
	TScreenTipOptions AScreenTipOptions, TRibbonDemoStyle AStyle)
{
	cbRibbonStyle->ItemIndex = (Integer)AStyle;
	cbColorScheme->ItemIndex = cbColorScheme->Items->IndexOf(AColorSchemeName);
	if (AScreenTipOptions.ShowScreenTips)
		cbScreenTipStyle->ItemIndex = (Integer)(!AScreenTipOptions.ShowDescripitons);
	else
    	cbScreenTipStyle->ItemIndex = 2;
}
//---------------------------------------------------------------------------
void TRibbonDemoOptionsForm::SaveOptions(String *AColorSchemeName,
	TScreenTipOptions *AScreenTipOptions, TRibbonDemoStyle *AStyle)
{
	* AColorSchemeName = cbColorScheme->Text;
	* AStyle = (TRibbonDemoStyle)cbRibbonStyle->ItemIndex;
	AScreenTipOptions->ShowScreenTips = cbScreenTipStyle->ItemIndex != 2;
	AScreenTipOptions->ShowDescripitons = cbScreenTipStyle->ItemIndex == 0;
}
//---------------------------------------------------------------------------
