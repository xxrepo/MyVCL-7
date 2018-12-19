//---------------------------------------------------------------------------
#ifndef EBarMegaDemoOptionsH
#define EBarMegaDemoOptionsH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
#include <ExtDlgs.hpp>
#include "CSPIN.h"
//---------------------------------------------------------------------------
class TEBarMegaDemoOptionsForm : public TForm
{
__published:	// IDE-managed Components
  TPageControl *pgOptions;
  TTabSheet *tsBars;
  TGroupBox *gbBackgroundSubMenu;
  TImage *imSubMenuBackground;
  TButton *btnBkSubMenuLoad;
  TButton *btnBkSubMenuClear;
  TGroupBox *gbBackgroundBars;
  TImage *imBarsBackground;
  TButton *btnBkBarsLoad;
  TButton *btnBkBarsClear;
  TRadioGroup *rgStyle;
  TGroupBox *gbBarsMiscellaneous;
  TSpeedButton *sbFont;
  TLabel *lbFont;
  TLabel *lbFontName;
  TBevel *beMiscellaneous;
  TCheckBox *cbUseF10ForMenu;
  TCheckBox *cbCanCustomize;
  TCheckBox *cbSunkenBorder;
  TCheckBox *cbAllowReset;
  TTabSheet *tsSideBar;
  TGroupBox *gbBackgroundColor;
  TLabel *lbBeginColor;
  TLabel *lbEndColor;
  TLabel *lbFillStyle;
  TLabel *blStep;
  TPanel *pBeginColor;
  TPanel *pEndColor;
  TComboBox *cbFillStyle;
  TCSpinEdit *seStep;
  TGroupBox *gbBackgroundPicture;
  TImage *ImSideBarbkPicture;
  TButton *btnLoad;
  TButton *btnClear;
  TGroupBox *gbFonts;
  TBevel *beFonts;
  TLabel *lbItemFontCaption;
  TLabel *lbGroupFontCaption;
  TLabel *lbGroupFont;
  TLabel *lbItemFont;
  TSpeedButton *spGroupFont;
  TSpeedButton *spItemFont;
  TGroupBox *gbStyle;
  TLabel *Label7;
  TLabel *Label8;
  TComboBox *cbBorderStyle;
  TComboBox *cbPaintStyle;
  TGroupBox *gbMiscellaneous;
  TCheckBox *cbCanSelected;
  TCheckBox *cbShowGroups;
  TGroupBox *gbSideBarPopupmenu;
  TCheckBox *cbIconType;
  TCheckBox *cbAddGroup;
  TCheckBox *cbRemoveGroup;
  TCheckBox *cbCustomize;
  TCheckBox *cbRenameGroup;
  TCheckBox *cbRenameItem;
  TCheckBox *cbRemoveItem;
  TButton *btnClose;
  TColorDialog *ColorDialog;
  TOpenPictureDialog *OpenPictureDialog;
  TFontDialog *FontDialog;
    void __fastcall pBeginColorClick(TObject *Sender);
    void __fastcall FormActivate(TObject *Sender);
    void __fastcall BitBtn2Click(TObject *Sender);
    void __fastcall seStepChange(TObject *Sender);
    void __fastcall SpeedButton1Click(TObject *Sender);
    void __fastcall SpeedButton2Click(TObject *Sender);
  void __fastcall rgStyleClick(TObject *Sender);
  void __fastcall btnBkBarsLoadClick(TObject *Sender);
  void __fastcall btnBkBarsClearClick(TObject *Sender);
  void __fastcall btnBkSubMenuLoadClick(TObject *Sender);
  void __fastcall btnBkSubMenuClearClick(TObject *Sender);
  void __fastcall sbFontClick(TObject *Sender);
  void __fastcall cbUseF10ForMenuClick(TObject *Sender);
  void __fastcall cbCanCustomizeClick(TObject *Sender);
  void __fastcall cbSunkenBorderClick(TObject *Sender);
  void __fastcall cbAllowResetClick(TObject *Sender);
  void __fastcall cbFillStyleChange(TObject *Sender);
  void __fastcall cbSBPopupMenuClick(TObject *Sender);
  void __fastcall spGroupFontClick(TObject *Sender);
  void __fastcall spItemFontClick(TObject *Sender);
  void __fastcall btnLoadClick(TObject *Sender);
  void __fastcall cbShowGroupsClick(TObject *Sender);
  void __fastcall cbCanSelectedClick(TObject *Sender);
  void __fastcall cbPaintStyleChange(TObject *Sender);
  void __fastcall cbBorderStyleChange(TObject *Sender);
        void __fastcall btnCloseClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
    TFont *FontGroup;
    TFont *FontItem;
    __fastcall TEBarMegaDemoOptionsForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TEBarMegaDemoOptionsForm *EBarMegaDemoOptionsForm;
//---------------------------------------------------------------------------
#endif
