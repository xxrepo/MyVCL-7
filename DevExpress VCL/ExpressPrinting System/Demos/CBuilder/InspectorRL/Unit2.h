//----------------------------------------------------------------------------
#ifndef OCRH
#define OCRH
//----------------------------------------------------------------------------
#include <ExtCtrls.hpp>
#include <Buttons.hpp>
#include <StdCtrls.hpp>
#include <Controls.hpp>
#include <Forms.hpp>
#include <Graphics.hpp>
#include <Classes.hpp>
#include <SysUtils.hpp>
#include <Windows.hpp>
#include <System.hpp>
#include <DBCtrls.hpp>
#include <Mask.hpp>
//----------------------------------------------------------------------------
class TfmDialog : public TForm
{
__published:
    TLabel *Label8;
    TLabel *Label9;
    TLabel *Label10;
    TLabel *Label11;
    TBevel *Bevel1;
    TDBEdit *DBEdit8;
    TDBEdit *DBEdit9;
    TDBEdit *DBEdit10;
    TDBEdit *DBEdit11;
    TButton *Button1;
    TButton *Button2;
private:
public:
	virtual __fastcall TfmDialog(TComponent* AOwner);
};
//----------------------------------------------------------------------------
extern PACKAGE TfmDialog *fmDialog;
//----------------------------------------------------------------------------
#endif
