//---------------------------------------------------------------------------
#include <vcl.h>
#include <SysInit.hpp>
#include <jpeg.hpp>
#include <math.h>
#pragma hdrstop

#include "FlyingMain.h"
#include "FlyingSeatCalc.h"
#include "FlyingSupport.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxControls"
#pragma link "cxSSheet"
#pragma resource "*.dfm"
TFlyingMainForm *FlyingMainForm;
//---------------------------------------------------------------------------
__fastcall TFlyingMainForm::TFlyingMainForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TFlyingMainForm::FormCreate(TObject *Sender)
{
  TResourceStream *Rs;
  Rs = new TResourceStream((int)HInstance, "DEFAULTSHEET", PChar(RT_RCDATA));    // Resource Stream
  try {
    cxSheetBook->LoadFromStream(Rs);                             // Load the sheet from the resource stream
    cxSheetBook->ShowHeaders = false;                            // No Headers
    cxSheetBook->ShowGrid = false;                               // No Grid
  }
  __finally {
    delete Rs;                                                   // Free the Resource stream
  }
  fMenuItemsCount = cxSheetBook->PageCount;                      // Get the number of pages in the book
  for(int i = 0; i < fMenuItemsCount; i++)                       // For each Page
  {
      fMenuItems = new TMenuItem(this);                          // Create the menu item
      fMenuItems->Caption = cxSheetBook->Pages[i]->Caption;      // Set the caption
      fMenuItems->Tag = i;                                       // Set the tag
      fMenuItems->OnClick = moSelectPlaneClick;                  // Set the event
      mmAircraft->Add(fMenuItems);                               // Now add the menu item to the aircraft menu
  }
  fDepCofGColour = clRed;                                        // Set default departure C of G Colour
  fArrCofGColour = clYellow;                                     // Set default arrival C of G Colour
  fNormalCellColour = GetCellColour(0, 0);                       // Get the normal cell colour
  fErrorCellColour = GetCellColour(2, 17);                       // Get the error cell colour
  SetupPlane();                                                  // Read the variables for this plane
}
//---------------------------------------------------------------------------

void __fastcall TFlyingMainForm::FormDestroy(TObject *Sender)
{
  if (fCofGEnvelope != NULL)
    delete [] fCofGEnvelope;
}

void __fastcall TFlyingMainForm::moSelectPlaneClick(TObject *Sender)      // They selected aplane from the menu
{
  if (cxSheetBook->ActivePage != ((TMenuItem*)Sender)->Tag)
  {
    cxSheetBook->ActivePage = ((TMenuItem*)Sender)->Tag;         // Get the sheet they selected
    Application->ProcessMessages();                              // breath a while
    SetupPlane();                                                // read the plane variables
    Caption = Format("ExpressSpreadSheet Demo : %s Load Sheet", ARRAYOFCONST((fPlaneReg)));  // Set the form title
  }
}

//---------------------------------------------------------------------------

void __fastcall TFlyingMainForm::FormShow(TObject *Sender)
{
  moTodayClick(Sender);                                          // Set today's date
  cxSheetBook->ActiveCell = Point(2, 3);                         // Set the active cell
  cxSheetBookSetSelection(Sender, cxSheetBook->ActiveSheet);     // Trigger the display of cell hints
}
//---------------------------------------------------------------------------


void __fastcall TFlyingMainForm::moTodayClick(TObject *Sender)
{
  TcxSSCellObject *CellObject = cxSheetBook->ActiveSheet->GetCellObject(2, 0);
  try {
    CellObject->Text = "=now()";                                 // Set formula
  }
  __finally {
    delete CellObject;                                           // Free the cell object
  }
  cxSheetBook->Recalc();                                       // Recalc
}
//---------------------------------------------------------------------------

void __fastcall TFlyingMainForm::cxSheetBookSetSelection(TObject *Sender,
      TcxSSBookSheet *ASheet) // Selection has changed update the hint in the status bar
{
const                    //   A     B     C     D
  int HelpIds[21][4] = {{0, 0, 1, 0},   //  1
    {0, 0, 0, 0},   //  2
    {0, 0, 0, 0},   //  3
    {0, 0, 2, 0},   //  4
    {0, 0, 0, 0},   //  5
    {0, 0, 0, 0},   //  6
    {0, 0, 0, 0},   //  7
    {0, 0, 0, 0},   //  8
    {0, 0, 0, 3},   //  9
    {0, 0, 0, 4},   // 10
    {0, 0, 0, 0},   // 11
    {0, 0, 0, 0},   // 12
    {0, 0, 0, 0},   // 13
    {0, 0, 0, 0},   // 14
    {0, 5, 0, 0},   // 15
    {0, 5, 0, 0},   // 16
    {0, 6, 0, 0},   // 17
    {0, 0, 7, 0},   // 18
    {0, 0, 0, 0},   // 19
    {0, 0, 8, 0},   // 20
    {0, 0, 0, 0}};  // 21
const
 String HelpText[9] = {"The date the flight is being made",
    "Flight duration in Hrs {ie 210 Nm @ 95 Knts Enter = 210 / 95 or 2.21}",
    "The minimum required fuel for the flight",
    "The actual fuel onboard the aircraft on departure",
    "Wt of seat occupants {Right click for a Wizard}",
    "Total weight of those items in the baggage compartment 1",
    "The C of G on Take-off",
    "The C of G on Landing",
    "Total weight of those items in the baggage compartment 2"
    };

  TPoint fCell = ASheet->ActiveCell;                             // Get the Active Cell;
  int fHelpId;                                                   // The Help ID

  if ((fCell.y < 20) && (fCell.x < 4)) {                         // If we are on the active area of the sheet
    fHelpId = HelpIds[fCell.y][fCell.x];                         // Get the helpid
    if (fMaxPersons == 2) {                                      // If this is a 2 seater it has two baggage areas
      if (fCell.y == 15)                                         // If we are on the Second seat in a 4 seater then display the baggage help
        fHelpId++;                                               // bump the help id
      else if (fCell.y == 16)                                    // If we are on the baggae area on a 4 seater the display special help for second baggae area
        fHelpId = 9;                                             // specila 2 setare second baggae area
    }
  }
  else
    fHelpId = 0;                                                 // ensure no help for out of limits
  if (fHelpId != 0)                                              // if we have help
    StatusBar->Panels->Items[0]->Text = HelpText[fHelpId - 1];   // update the status bar
  else
    StatusBar->Panels->Items[0]->Text = "";                      // clear the last help
}
//---------------------------------------------------------------------------

void __fastcall TFlyingMainForm::cxSheetBookSheetPopupMenu(TObject *Sender,
      int X, int Y)
{
  TPoint fCell = cxSheetBook->ActiveSheet->ActiveCell;           // The active cell
  pmWizard->Visible = false;                                     // ensure wizard is hidden, it only applies to seats
  if (fCell.x == 1) {                                            // If we are in column 2
    if (fCell.y == 14)                                           // Front Seats for both planes
      pmWizard->Visible = true;                                  // Show the wizard option
    else
      pmWizard->Visible = (fCell.y == 15) &&
                          (fMaxPersons == 4);                    // Also need the wizard for a 4 seater in the back
  }
  ssPm->Popup(X, Y);                                             // popup the wizrd
}
//---------------------------------------------------------------------------

void __fastcall TFlyingMainForm::cxSheetBookTopLeftChanging(
      TcxSSBookSheet *Sender, TPoint &ATopLeft)
{
  ATopLeft.x = 0;                                                // Don't move from top cell
  ATopLeft.y = 0;
}
//---------------------------------------------------------------------------

void __fastcall TFlyingMainForm::cxSheetBookAfterCalculation(
      TObject *Sender)
{
  Pb->Repaint();                                                 // Update the graph
  CheckFigures();                                                // Check figures for validity
}
//---------------------------------------------------------------------------
bool TFlyingMainForm::CofGOutsideEnvelope(const double aCofG, const double aWeight)  // Check weightr and C of G inside safety envelope
{
  int X = Round(aWeight * 10);                                   // Scale up X
  int Y = Round(aCofG * 100);                                    // Scale up Y
  bool res;
  HRGN fRegion = CreatePolygonRgn(fCofGEnvelope, fEnvelopeSize, WINDING);   // Create the region
  try {
    res = !PtInRegion(fRegion, X, Y);                            // Use window to do the work
  }
  __finally {
    DeleteObject(fRegion);                                       // Delete the region
  }
  return res;
}

void __fastcall TFlyingMainForm::UpdateCofG()                    // Update the C of G
{
  Pb->Repaint();                                                 // Repaint the paint box
}

void __fastcall TFlyingMainForm::CheckFigures()
{
  if (IsChecked) return;
  IsChecked = true;
  double fVal1, fVal2;                                           // Local vars for figures
  UpdateCofG();                                                  // Ensure we are up to date on the graph
  SetCellMessage(0, 10, "", fNormalCellColour, 1);               // Clear the upper error row
  SetCellMessage(0, 20, "", fNormalCellColour, 1);               // Clear the lower error row
  fVal1 = GetCellDouble(3, 8);                                   // Get Calculated minimum fuel
  if (fVal1 > fMaxFuelCapacity){                                 // if we exceed the maximum fuel capacity
    SetCellMessage(0, 10, Format("Maximum fuel capacity exceeded by %0.2f Ltrs",
      ARRAYOFCONST((fVal1 - fMaxFuelCapacity))), 2, 1);          // Display the error
    return;                                                      // No more messages
  }
  fVal2 = GetCellDouble(3, 9);                                   // Get Actual fuel
  if (fVal1 > fVal2)                                             // If actual fuel is less than we need
  {
    SetCellMessage(0, 10, Format("%0.2f more Ltrs of fuel required", ARRAYOFCONST((fVal1 - fVal2)) ), fErrorCellColour,
      1);                                                        // Display the error
    return;                                                      // no more errors
  }
  if (fVal2 > fMaxFuelCapacity)                                  // If Actual fuel is more than the capacity ?
  {
    SetCellMessage(0, 10, "Maximum Fuel load exceeded", 23, 1);  // Display the error
    return;                                                      // No more errors
  }
  fVal1 = GetCellDouble(1, 17);                                  // Get Take Off Weight
  if (fVal1 > fMaxTakeOffWt)                                     // If we are more that certified max
  {
    SetCellMessage(0, 20, Format("Maximum Take Off Weight exceeded by %0.2f %s",
      ARRAYOFCONST((fVal1 - fMaxTakeOffWt, fWeightUnits))), 2, 1);       // Display the error
    return;                                                      // No more errors
  }
  fVal2 = GetCellDouble(2, 17) * fCofgMultiplier;                // Get the Take of C of G
  // Get Take Off C of G
  if (CofGOutsideEnvelope(fVal2, fVal1))                         // If outside envelope
  {
    SetCellMessage(0, 20, "Take Off C of G outside safe envelope", 2, 1); // Display the error
    return;                                                      // No more errors
  }
  fVal1 = GetCellDouble(1, 19);                                  // Get Landing Weight
  if (fVal1 > fMaxLandingWt)                                     // Check against max allowed
  {
    SetCellMessage(0, 20, Format("Maximum Landing Weight exceeded by %0.2f %s",
      ARRAYOFCONST((fVal1 - fMaxTakeOffWt, fWeightUnits))), 2, 1);       // Display the error
    return;                                                      // No more errors
  }
  fVal2 = GetCellDouble(2, 19) * fCofgMultiplier;                // Get the landing C of G
  // Get Landing C of G
  if (CofGOutsideEnvelope(fVal2, fVal1))                         // Check envelope
    SetCellMessage(0, 20, "Landing C of G outside safe envelope", 2, 1);    // Display the error
  IsChecked = false;
}

void __fastcall TFlyingMainForm::SetupPlane()
{
  LoadPlaneVars();                                               // Load the plane variables
  Image1->Picture->Bitmap->LoadFromResourceName((int)HInstance,
                                        fPlaneCofgBitmap);       // Load the C of G bitmap
  LoadImage(fPlanePhoto, Image2);                                // Load the photo
  try {
    cxSheetBook->ActiveCell = Point(2, 3);                       // Set the Fuel cell
  }
  catch (Exception &err) {}
  moTodayClick(this);                                            // Set toadys date
}

void __fastcall TFlyingMainForm::LoadPlaneVars()
{
  fPlaneReg        = GetCellString(1, 23);                      // Read the Plane callsign
  fPlaneCofgBitmap = GetCellString(1, 24);                      // Get the name of the C of G bitmap
  fPlanePhoto      = GetCellString(1, 25);                      // Get the name of the plane photo
  fMaxPersons      = GetCellInt(1, 26);                         // Get the max persons this plane can carry
  fMaxBaggageWt    = GetCellDouble(1, 27);                      // Get the Max baggage weight in compartment 1
  fMaxBaggageWt2   = GetCellDouble(1, 28);                      // Get the Max baggage weight in compartment 2
  fMaxTakeOffWt    = GetCellDouble(1, 29);                      // Get maximum takeoff weight
  fMaxLandingWt    = GetCellDouble(1, 30);                      // Get maximum landing weight
  fMinAftCofG      = GetCellDouble(1, 31);                      // Get Minimum aft C of G
  fMaxAftCofG      = GetCellDouble(1, 32);                      // Get Max Atf C of G
  fMaxFuelCapacity = GetCellDouble(1, 33);                      // Get Maximum fuel capacity
  fTabsFuel        = GetCellDouble(1, 34);                      // Get fuel when filled to the 'tabs'
  fWeightUnits     = GetCellString(1, 35);                      // Get units for weights
  fCofGAxisStarts  = GetCellDouble(1, 36);                      // Get the C of G at the left edge of the graph
  fCofGAxis        = GetCellInt(1, 37);                         // Get the position on the graph where the CofG axis starts (from top)
  fCofGWeightMin   = GetCellDouble(1, 38);                      // Get the minimum Weight on the weight axis
  fCofGWeightAxis  = GetCellInt(1, 39);                         // Get the position of the weight axis from the left hand edge of the graph
  fCofgStep        = GetCellDouble(1, 40);                      // Get the units between each C of G tick
  fWtStep          = GetCellDouble(1, 41);                      // Get the units between weight ticks
  fCofgMultiplier  = GetCellDouble(1, 42);                      // Get the C of G Multiplier
  fEnvelopeSize    = GetCellInt(1, 43);                         // Get the number of 'points' that comprise the C of G safety envelope
  if (fCofGEnvelope != NULL) {
    delete [] fCofGEnvelope;
    fCofGEnvelope = NULL;
  }
  fCofGEnvelope = new TPoint[fEnvelopeSize];                    // Set the Dynamic array length
  for (int i = 0; i < fEnvelopeSize; i++) {                              // For each of the 'points'
    fCofGEnvelope[i].x = GetCellInt(1, 44 + i);                 // Get X
    fCofGEnvelope[i].y = GetCellInt(2, 44 + i);                 // Get Y
  }
}

void __fastcall TFlyingMainForm::LoadImage(String const aResJpg,
                           TImage *AnImage)                    // Load an JPG image from a resource
{
  TJPEGImage *Jpi = new TJPEGImage();                          // Jpeg Image
  TResourceStream *Rs = new TResourceStream((int)HInstance,
                               aResJpg, PChar(RT_RCDATA));            // Load the Image
  try {
    Jpi->LoadFromStream(Rs);                                   // Load from the resource string
    AnImage->Picture->Bitmap->Assign(Jpi);                     // Assign to the image control
  }
  __finally {
    delete Jpi;                                                // Free the Jpeg
    delete Rs;                                                 // Free the resource stream
  }
}

double __fastcall TFlyingMainForm::GetCellDouble(const int aCol, const int aRow)
{
  TcxSSCellObject *CellObject = cxSheetBook->ActiveSheet->GetCellObject(aCol, aRow);
  double res;
  try {
    try {
      res = VarAsType(CellObject->CellValue, varDouble);       // Get the display text (not the formula) and convert
    }
    catch (Exception &err) {
      res = 0.0;                                               // JIC
    }
  }
  __finally {
    delete CellObject;                                         // Free the cell object
  }
  return res;
}

String __fastcall TFlyingMainForm::GetCellString(const int aCol, const int aRow)
{
  TcxSSCellObject *CellObject = cxSheetBook->ActiveSheet->GetCellObject(aCol, aRow);  // Get the Cell Object
  String res;
  try {
    try {
      res = CellObject->DisplayText;                           // Get the Text
    }
    catch (Exception &err) {
      res = "";                                                // JIC
    }
  }
  __finally {
    delete CellObject;                                         // Free the cell object
  }
  return res;
}

int __fastcall TFlyingMainForm::GetCellInt(const int aCol, const int aRow)
{
  TcxSSCellObject *CellObject = cxSheetBook->ActiveSheet->GetCellObject(aCol, aRow);  // Get the Cell Object
  int res;
  try {
    try {
      res = VarAsType(CellObject->CellValue, varInteger);      // Get the Display text (not the formula) and convert
    }
    catch (Exception &err) {
      res = 0;                                                 // JIC
    }
  }
  __finally {
    delete CellObject;                                         // Free the cell object
  }
  return res;
}

Word __fastcall TFlyingMainForm::GetCellColour(const int aCol, const int aRow)
{
  TcxSSCellObject *CellObject = cxSheetBook->ActiveSheet->GetCellObject(aCol, aRow);  // Get the Cell Object
  Word res;
  try {
    try {
      res = VarAsType(CellObject->Style->Brush->BackgroundColor, varInteger);         // Return the entry
    }
    catch (Exception &err) {
      res = 0;                                                 // JIC
    }
  }
  __finally {
    delete CellObject;                                         // Free the cell object
  }
  return res;
}

void __fastcall TFlyingMainForm::SetCellMessage(const int aCol, const int aRow, // Display a message in  cell at row, col
  const String aMessage,                                       // The message
  const Word aBackgroundColour,                                // The background color
  const Word aFontColour)                                      // The font color
{
  TcxSSCellObject *CellObject = cxSheetBook->ActiveSheet->GetCellObject(aCol, aRow);  // Get the Cell Object
  try {
    try {
      CellObject->Style->Brush->BackgroundColor = aBackgroundColour;  // Set the background colour
      CellObject->Style->Font->FontColor = aFontColour;        // set the font colour
      CellObject->Text = aMessage;                             // Set the text
    }
    catch (Exception &err) {}
  }
  __finally {
    delete CellObject;
  }
}


void __fastcall TFlyingMainForm::mmExitClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TFlyingMainForm::moFuelTabsClick(TObject *Sender)
{
  TcxSSCellObject *CellObject = cxSheetBook->ActiveSheet->GetCellObject(3, 9); // Get the Cell object
  try {
    CellObject->Text = Format("%0.2f", ARRAYOFCONST((fTabsFuel)));                // Set the fuel
  }
  __finally {
    delete CellObject;                                         // Free the cell object
  }
  cxSheetBook->Recalc();                                     // Recalc
  Pb->Repaint();                                             // Update the graph
  CheckFigures();                                            // Check figures for validity
}
//---------------------------------------------------------------------------

void __fastcall TFlyingMainForm::pmWizardClick(TObject *Sender)
{
  TFlyingSeatCalcForm *FlyingSeatCalcForm = new TFlyingSeatCalcForm(this);   // Create the wizard
  TcxSSCellObject *CellObject;
  try {
    FlyingSeatCalcForm->CallSign = fPlaneReg;                                // Set the Aircraft callsign
    FlyingSeatCalcForm->ResultInKgs = UpperCase(fWeightUnits) == "KGS";      // Set which units we require the result in
    FlyingSeatCalcForm->ShowModal();
    if (FlyingSeatCalcForm->ModalResult == mrOk) {                           // Run the wizard and if they selected OK
      TPoint fCell = cxSheetBook->ActiveSheet->ActiveCell;                   // Get the active Cell
      CellObject = cxSheetBook->ActiveSheet->GetCellObject(fCell.x, fCell.y);
        try {
          CellObject->Text = FlyingSeatCalcForm->efFormula->Text;            // Copy the forumla in
        }
        __finally {
          delete CellObject;                                   // Free the cell object
        }
        cxSheetBook->Recalc();                               // recalc the sheet
        Pb->Repaint();                                       // Update the graph
        CheckFigures();                                      // Check figures for validity
    }
  }
  __finally {
    delete FlyingSeatCalcForm;                                 // Free the wizard
  }
}
//---------------------------------------------------------------------------

void __fastcall TFlyingMainForm::pmoFormatClick(TObject *Sender)
{
  cxSheetBook->ActiveSheet->FormatCells(cxSheetBook->SelectionRect); // Format
  fDepCofGColour = GetCellTColour(2, 17);                      // Get new colour JIC it changed
  fArrCofGColour = GetCellTColour(2, 19);                      // Get new colour JIC it changed
  Pb->Refresh();                                               // repaint the graph
}
//---------------------------------------------------------------------------
TColor __fastcall TFlyingMainForm::GetCellTColour(const int aCol, const int aRow) // Get a cell Colour
{
  TcxSSCellObject *CellObject = cxSheetBook->ActiveSheet->GetCellObject(aCol, aRow); // Get the Cell object
  TColor res;
  try {
	try {
	  res = (TColor)&cxSheetBook->Palette[CellObject->Style->Brush->BackgroundColor]; // Return the colour
	}
	catch (Exception &err) {
	  res = (TColor)0;                                         // JIC
	}
  }
  __finally {
	delete CellObject;                                         // Free the cell object
  }
  return res;
}

void __fastcall TFlyingMainForm::PlotPoint(const double aWt, const double aCofG,
                    const TColor aColour)                      // Plot a point with axis
{
  int y = Round(((aCofG * fCofgMultiplier) -
               fCofGAxisStarts) * fWtStep);                    // Get Y
  int x = fCofGAxis - Round((aWt - fCofGWeightMin) *
                   fCofgStep);                                 // Get X
                                                               // Draw on the canvas
    Pb->Canvas->Brush->Color = aColour;                        // Use the supplied colour
    Pb->Canvas->FillRect(Rect(y - 5, x - 5, y + 5, x + 5));    // Draw a 5 pixel square around the point
    Pb->Canvas->Pen->Color = aColour;                          // Set the pen colour
    Pb->Canvas->Pen->Width = 3;                                // 3 pixles wide
    Pb->Canvas->MoveTo(y, fCofGAxis - 1);                      // Set origin
    Pb->Canvas->LineTo(y, x - 1);                              // Draw to Axis
    Pb->Canvas->MoveTo(fCofGWeightAxis - 1, x);                // Move to axis
    Pb->Canvas->LineTo(y - 1, x);                              // Draw to X
}

void __fastcall TFlyingMainForm::PbPaint(TObject *Sender)
{
  double DepWt = GetCellDouble(1, 17);                          // Get the departure Weight
  double DepCg = GetCellDouble(2, 17);                          // Get the departure C of G
  double ArrWt = GetCellDouble(1, 19);                          // Get the arrival Weight
  double ArrCg = GetCellDouble(2, 19);                          // Get the arrival C of G
  PlotPoint(DepWt, DepCg, fDepCofGColour);                      // Plot departure
  PlotPoint(ArrWt, ArrCg, fArrCofGColour);                      // Plot arrival
}
//---------------------------------------------------------------------------

void __fastcall TFlyingMainForm::cxSheetBookActiveCellChanging(
      TcxSSBookSheet *Sender, const TPoint &ActiveCell, bool &CanSelect)
{
  CanSelect = false;
  if ((ActiveCell.x <= 3)&&(ActiveCell.y <= 20))
    CanSelect = true;
}
//---------------------------------------------------------------------------
