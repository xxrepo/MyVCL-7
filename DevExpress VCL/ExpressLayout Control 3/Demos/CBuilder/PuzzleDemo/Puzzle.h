//---------------------------------------------------------------------------

#ifndef PuzzleH
#define PuzzleH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "BasicDemoMain.h"
#include "cxControls.hpp"
#include "dxLayoutControl.hpp"
#include "dxLayoutContainer.hpp"
#include <ActnList.hpp>
#include <Menus.hpp>
#include "dxLayoutLookAndFeels.hpp"
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
//---------------------------------------------------------------------------
class TfrmPuzzle : public TfrmBasicDemoMain
{
__published:	// IDE-managed Components
	TdxLayoutLookAndFeelList *dxLayoutLookAndFeelList10;
	TdxLayoutStandardLookAndFeel *dxLayoutStandardLookAndFeel10;
	TImage *Image4;
	TImage *Image5;
	TImage *Image7;
	TImage *Image2;
	TImage *Image9;
	TImage *Image3;
	TImage *Image1;
	TImage *Image6;
	TImage *Image8;
	TdxLayoutGroup *lcMainGroup4;
	TdxLayoutItem *lcItem1;
	TdxLayoutItem *lcItem2;
	TdxLayoutItem *lcItem3;
	TdxLayoutGroup *lcMainGroup2;
	TdxLayoutItem *lcItem4;
	TdxLayoutItem *lcItem5;
	TdxLayoutItem *lcItem6;
	TdxLayoutGroup *lcMainGroup3;
	TdxLayoutItem *lcItem7;
	TdxLayoutItem *lcItem8;
	TdxLayoutItem *lcItem9;
	TMenuItem *Solvepuzzle1;
	TMenuItem *Shufflepuzzle1;
	TMenuItem *N1;
	void __fastcall Customization1Click(TObject *Sender);
	void __fastcall Shufflepuzzle1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TfrmPuzzle(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmPuzzle *frmPuzzle;
//---------------------------------------------------------------------------
#endif
