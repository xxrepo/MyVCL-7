//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "preview.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TpreviewForm *previewForm;
//---------------------------------------------------------------------------
__fastcall TpreviewForm::TpreviewForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
