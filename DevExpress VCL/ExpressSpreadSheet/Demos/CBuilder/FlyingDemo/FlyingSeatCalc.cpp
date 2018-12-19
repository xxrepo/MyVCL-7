//---------------------------------------------------------------------------
#include <vcl.h>
#include <stdlib.h>
#include "math.h"
#include "math.hpp"
#include <cxSSUtils.hpp>
#pragma hdrstop

#include "FlyingSeatCalc.h"
#include "FlyingSupport.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFlyingSeatCalcForm *FlyingSeatCalcForm;
//---------------------------------------------------------------------------
__fastcall TFlyingSeatCalcForm::TFlyingSeatCalcForm(TComponent* Owner)
  : TForm(Owner)
{
}

void __fastcall TFlyingSeatCalcForm::rbLsKgsClick(TObject *Sender)
{
  SetControls(((TRadioButton*)Sender)->Tag,
    efLsPrime, efLsLbs,
    lblLsPrime, lblLsLbs,
    fLsMode);                                              // Make the change
  meLsPrimeExit(Sender);                                   // Update
}
//---------------------------------------------------------------------------
String __fastcall TFlyingSeatCalcForm::GetFormula(TEdit *aPrime, TEdit *aLbs,
  TRadioButton *arbK, TRadioButton *arbL,
  String aKgsToLbs, String aLbsToKgs)                   // Get a formula
{
  int fStones, fLbs;                                    // Local Vars
  double fKgs;                                          // Local Vars
  String res;
  res = "";                                              // Return nothing
  if (arbK->Checked) {                                   // If In Kgs
    fKgs = GetEfFloatValue(aPrime);                      // Get KGS value
    if (fKgs != 0.0)                                     // If we have a value
      res = Format("%0.2f%s", ARRAYOFCONST((fKgs, aKgsToLbs.c_str())));     // set the formula
  }
  else
    if (arbL->Checked) {                              // If in Lbs
    fLbs = GetEfIntValue(aPrime);                       // Get the Lbs
    if (fLbs != 0)                                     // If we have a value
      if (aLbsToKgs.Length() > 0)                       // if we are converting Lbs to Kgs
        res = Format("(%d%s)", ARRAYOFCONST((fLbs, aLbsToKgs.c_str())));    // Format for conversion to Kgs
      else
        res = Format("%d", ARRAYOFCONST((fLbs)));                  // formula is the number
  }
  else
  {                                                  // formula for stones and lbs
    fStones = GetEfIntValue(aPrime);                    // Get stones
    fLbs = GetEfIntValue(aLbs);                         // get Lbs
    if (fStones != 0)                                  // If we have stones
      res = Format("%d * 14%s", ARRAYOFCONST((fStones, aLbsToKgs.c_str()))); // set formula including conversion to Kgs if required
    if (fLbs != 0) {                                     // if we have Lbs
      if (fLbs > 13) {                                  // if they are more that 13 ( a stones = 14 Lbs)
        fLbs = 13;                                      // ensure valid
        aLbs->Text = "13";                               // update the edit field
      }
      if (fStones > 0) {                                // if we have have to add the stones
        if (aLbsToKgs.Length() > 0)                     // check conversion
          res = Format("((%d * 14) + %d)%s", ARRAYOFCONST((fStones, (int)fLbs, aLbsToKgs.c_str()))); // Formula
        else
          res = Format("(%d * 14) + %d", ARRAYOFCONST((fStones, fLbs))); // Formula without conversion
      }
      else
        res = Format("%d%s", ARRAYOFCONST((fLbs, aLbsToKgs.c_str())));     // formula for no stones (must be a small persoon ?)
    }
  }
  return res;
}

void __fastcall TFlyingSeatCalcForm::meLsPrimeExit(TObject *Sender)
{
  String fLeftForm, fRightForm, fFormula;                 // The left, Right and complete formulas
  if(ResultInKgs)                                      // If we want the total result converted to Kgs
  {
    fLeftForm = GetFormula(efLsPrime, efLsLbs, rbLsKgs,
                            rbLsLbs, "", " / 2" + (String)DecimalSeparator + "2");        // Get the Left hand seat formula
    fRightForm = GetFormula(efRsPrime, efRsLbs, rbRsKgs,
                             rbRsLbs, "", " / 2" + (String)DecimalSeparator + "2");       // Get the right hand seta formula
  }
  else
  {                                                    // Result in Lbs
    fLeftForm = GetFormula(efLsPrime, efLsLbs, rbLsKgs,
                            rbLsLbs, " * 2" + (String)DecimalSeparator + "2", "");        // Get Left seat
    fRightForm = GetFormula(efRsPrime, efRsLbs, rbRsKgs,
                             rbRsLbs, " * 2" + (String)DecimalSeparator + "2", "");       // Get right seat
  }
  if ((fLeftForm.Length() > 0) &&
     (fRightForm.Length() > 0))                          // If both seats return a formula
    fFormula = Format("(%s) + %s", ARRAYOFCONST((fLeftForm,
                                     fRightForm)));          // weld them together
  else if (fLeftForm.Length() > 0)                        // If left has the result
    fFormula = fLeftForm;                                  // Copy to the forlula
  else
    fFormula = fRightForm;                                // Right has the result, copy
  btnOk->Enabled = fFormula.Length() > 0;                   // enable the OK button if we have a result to return
  if (btnOk->Enabled)                                     // We have a result
    efFormula->Text = Format("= %s", ARRAYOFCONST((fFormula)));           // Ensure sheet knows it's a formula
  else
    efFormula->Text = "";                                  // Nothing !
}
//---------------------------------------------------------------------------
void __fastcall TFlyingSeatCalcForm::SetControls(int aTag,
  TEdit *aPrime, TEdit *aLbs,
  TLabel *aPrimeLbl, TLabel *aLbsLbl,
  TEditMode &aMode)                                   // Set up controls for a change in the weigth units
{
  double fKgs;                                            // Local for Kgs weight
  int fLbs;                                           // Local for Lbs weight
  int fStn;                                           // Local for Stones weight

  fKgs = GetEfFloatValue(aPrime);                         // Get the weight in KGS
  fStn = GetEfIntValue(aPrime);                           // Get the weight in Stones
  fLbs = GetEfIntValue(aLbs);                             // Get the weight in LBS ( for Stones and LBS)

  switch (aTag){                                           // Work on the change type
  case 0: {                                                     // Weight in KGS
      aPrimeLbl->Caption = "Weight in Kgs";                // Set title
      aPrime->MaxLength = 5;                               // Max length 5 (12.35 ot 123.5)
      switch (aMode) {                                        // Check previous mode and convert the previous value
        case emLbs: {
            aPrime->Text = Format("%0.2f", ARRAYOFCONST(((fStn * 1.0) / 2.2))); // Convert from LBS
            break;
            }
        case emStonesLbs: {
            aPrime->Text = Format("%0.2f", ARRAYOFCONST((((fStn * 14) + fLbs) * 1.0 / 2.2)));  // Convert from Stones and Lbs
            break;
        }
      }
      aMode = emKgs;                                      // Now working in Kgs
      aLbsLbl->Visible = false;                            // Don't show the Lbs label
      aLbs->Visible = false;                               // Don't show the Lbs entry field
      break;
    }
  case 1:                                                     // Now working in LBS
    {
      aPrimeLbl->Caption = "Weight in Lbs";                // Update the Title
      aPrime->MaxLength = 3;                               // Max 3 digits
      switch (aMode) {                       // Check previous mode and convert
        case emKgs: {
            aPrime->Text = Format("%d", ARRAYOFCONST(((Round(fKgs * 2.2))))); // From Kgs
            break;
        }
        case emStonesLbs: {
            aPrime->Text = Format("%d", ARRAYOFCONST(((fStn * 14) + fLbs))); // From Stones and Lbs
            break;
            }
      }
      aMode = emLbs;                                      // Now Working in Lbs
      aLbsLbl->Visible = false;                            // Don't show the Lbs label
      aLbs->Visible = false;                               // Don't show the Lbs entry field
      break;
    }
  case 2:                                                     // Now working in Stones and Lbs
    {
      aPrimeLbl->Caption = "Weight in Stones";             // Update title
      aPrime->MaxLength = 2;                               // Max 2 digits
      switch (aMode) {                                     // Check previous mode and convert
      case emKgs: {                                            // was in Kgs
          fLbs = Round(fKgs * 2.2);                       // Get total in Lbs
          fStn = div(fLbs, 14).quot;                        // Get stones
          fLbs = fLbs - (fStn * 14);                      // Get Lbs
          aPrime->Text = Format("%0d", ARRAYOFCONST((fStn)));            // Set Text
          aLbs->Text = Format("%0d", ARRAYOFCONST((fLbs)));              // Set Text
          break;
        }
        case emLbs:                                             // Convert from LBS
        {
          fLbs = div(fStn, 14).rem;                        // Get remaining Lbs
          fStn = div(fStn, 14).quot;                      // Get stones
          aPrime->Text = Format("%0d", ARRAYOFCONST((fStn)));            // Set Text
          aLbs->Text = Format("%0d", ARRAYOFCONST((fLbs)));              // Set Text
          break;
        }
      }
      aMode = emStonesLbs;                                // Now working in stones and lbs
      aLbsLbl->Visible = True;                             // Show the lbs label
      aLbs->Visible = True;                                // show the lbs edit field
      break;
    }
  }
}
void GetValidChar(char &Key, String AText)      // Get a valid numeric char
{
  char *NumKeys = "1234567890";
  if ((((Key == DecimalSeparator) && (AText.Pos(DecimalSeparator) > 0))) || // Scan for a valid Key
    ((Key != DecimalSeparator) && (StrScan(NumKeys, Key) == NULL)))
    Key = 0;                                       // Not valid ZAP it
}

double __fastcall TFlyingSeatCalcForm::GetEfFloatValue(TEdit *aControl) // Get a value as a double
{
  double res;
  cxTryStrToFloat(aControl->Text, res);                   // Try it
  return res;
}

int __fastcall TFlyingSeatCalcForm::GetEfIntValue(TEdit *aControl)  // Getb a value as an Integer
{
  int res;
  cxTryStrToInt(aControl->Text, res); // Try it
  return res;
}
//---------------------------------------------------------------------------

void __fastcall TFlyingSeatCalcForm::EdtKeyPress(TObject *Sender,
      char &Key)
{
  GetValidChar(Key, ((TEdit*)Sender)->Text);    // Check for a valid Key
}
//---------------------------------------------------------------------------


void __fastcall TFlyingSeatCalcForm::rbRsStonesClick(TObject *Sender)
{
  SetControls(((TRadioButton*)Sender)->Tag,
    efRsPrime, efRsLbs,
    lblRsPrime, lblRsLbs,
    fRsMode);                                              // Make the change
  meLsPrimeExit(Sender);                                   // Update
}
//---------------------------------------------------------------------------

void __fastcall TFlyingSeatCalcForm::FormCreate(TObject *Sender)
{
  fLsMode = emLbs;                                        // Set Left hand seat mode to LBS
  fRsMode = emLbs;                                        // Set Right hand seat mode to LBS
}
//---------------------------------------------------------------------------

void __fastcall TFlyingSeatCalcForm::SetInKgs(const bool Value)
{
  fInKgs = Value;                                         // Set var
  if (fInKgs) {                                           // if we are working in Kgs
    lblFormula->Caption = "Formula for Kgs";               // Update the label
    Caption = Format("%s Seat Weights in Kgs", ARRAYOFCONST((fCallSign))); // Set the form caption
  }
  else {
    lblFormula->Caption = "Formula for Lbs";               // Update the label
    Caption = Format("%s Seat Weights in Lbs", ARRAYOFCONST((fCallSign))); // Set the form caption
  }
}




