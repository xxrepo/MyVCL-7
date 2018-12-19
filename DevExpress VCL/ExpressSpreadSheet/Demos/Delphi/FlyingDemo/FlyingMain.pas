unit FlyingMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, cxSSheet, cxControls, ExtCtrls, StdCtrls,
  ComCtrls, Jpeg, Menus, cxssPainters;

type
  TFlyingMainForm = class(TForm)
    cxSpread: TcxSpreadSheetBook;
    Image1: TImage;
    StatusBar1: TStatusBar;
    Pb: TPaintBox;
    Image2: TImage;
    ssPm: TPopupMenu;
    pmoFormat: TMenuItem;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    mmAircraft: TMenuItem;
    mmExit: TMenuItem;
    mmOptions: TMenuItem;
    moToday: TMenuItem;
    moFuelTabs: TMenuItem;
    Bevel1: TBevel;
    pmWizard: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure cxSpread1SetSelection(Sender: TObject;
      ASheet: TcxSSBookSheet);
    procedure PbPaint(Sender: TObject);
    procedure cxSpread1SheetPopupMenu(Sender: TObject; X, Y: integer);
    procedure pmoFormatClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mmExitClick(Sender: TObject);
    procedure moTodayClick(Sender: TObject);
    procedure moFuelTabsClick(Sender: TObject);
    procedure pmWizardClick(Sender: TObject);
    procedure cxSpreadTopLeftChanging(Sender: TcxSSBookSheet;
      var ATopLeft: TPoint);
    procedure cxSpreadAfterCalculation(Sender: TObject);
    procedure cxSpreadActiveCellChanging(Sender: TcxSSBookSheet;
      const ActiveCell: TPoint; var CanSelect: Boolean);
  private
    fMenuItems: array of TMenuItem;
    fDepCofGColour: TColor;
    fArrCofGColour: TColor;
    fPlaneReg: string;
    fPlaneCofgBitmap: string;
    fPlanePhoto: string;
    fWeightUnits: string;
    fMaxPersons: integer;
    fMaxTakeOffWt: double;
    fMaxLandingWt: double;
    fMaxBaggageWt: double;
    fMaxBaggageWt2: double;
    fMaxFuelCapacity: double;
    fTabsFuel: double;
    fMinAftCofG: double;
    fMaxAftCofG: double;
    fCofGAxisStarts: double;
    fCofgStep: double;
    fWtStep: double;
    fCofgMultiplier: double;
    fCofGAxis: integer;
    fCofGWeightMin: double;
    fCofGWeightAxis: integer;
    fEnvelopeSize: integer;
    fNormalCellColour: integer;
    fErrorCellColour: Integer;
    fCofGEnvelope: array of TPoint;

    procedure moSelectPlaneClick(Sender: TObject);
    function GetCellDouble(const aCol, aRow: integer): double;
    function GetCellString(const aCol, aRow: integer): string;
    function GetCellInt(const aCol, aRow: integer): integer;
    function GetCellColour(const aCol, aRow: integer): integer;
    procedure SetCellMessage(const aCol, aRow: integer;
      const aMessage: string; const aBackgroundColour,
      aFontColour: Word);
    function GetCellTColour(const aCol, aRow: integer): TColor;
    procedure CheckFigures;
    procedure LoadImage(const aResJpg: string; AnImage: TImage);
    procedure LoadPlaneVars;
    procedure SetupPlane;
  public
    IsChecked: Boolean; 
    procedure UpdateCofG;

    { Public declarations }
  end;

type
  THelpIds = array[0..20, 0..3] of integer;

  // An array that provides a HelpId for each cell on the
  // input sheet.  Here these are mapped to a static string
  // array, it would be simple to map these to ID's in a
  // help file
const                    //   A     B     C     D
  HelpIds: THelpIds = ((0, 0, 1, 0),   //  1
    (0, 0, 0, 0),   //  2
    (0, 0, 0, 0),   //  3
    (0, 0, 2, 0),   //  4
    (0, 0, 0, 0),   //  5
    (0, 0, 0, 0),   //  6
    (0, 0, 0, 0),   //  7
    (0, 0, 0, 0),   //  8
    (0, 0, 0, 3),   //  9
    (0, 0, 0, 4),   // 10
    (0, 0, 0, 0),   // 11
    (0, 0, 0, 0),   // 12
    (0, 0, 0, 0),   // 13
    (0, 0, 0, 0),   // 14
    (0, 5, 0, 0),   // 15
    (0, 5, 0, 0),   // 16
    (0, 6, 0, 0),   // 17
    (0, 0, 7, 0),   // 18
    (0, 0, 0, 0),   // 19
    (0, 0, 8, 0),   // 20
    (0, 0, 0, 0));  // 21

// Test strings for Cell Help
const
  HelpText: array[1..9] of string = ('The date the flight is being made',
    'Flight duration in Hrs (ie 210 Nm @ 95 Knts Enter = 210 / 95 or 2.21)',
    'The minimum required fuel for the flight',
    'The actual fuel onboard the aircraft on departure',
    'Wt of seat occupants (Right click for a Wizard)',
    'Total weight of those items in the baggage compartment 1',
    'The C of G on Take-off',
    'The C of G on Landing',
    'Total weight of those items in the baggage compartment 2'
    );

var
  FlyingMainForm: TFlyingMainForm;

implementation

{$R *.dfm}

//{$R DEFAULT.RES}

uses
  FlyingSeatCalc;

procedure TFlyingMainForm.FormCreate(Sender: TObject);
var
  Rs    : TResourceStream;                                 // Resource Stream
  I, Mi : integer;                                         // Local Int Vars
begin
  Rs := TResourceStream.Create(hInstance,
                               'DEFAULTSHEET',
                               RT_RCDATA);                 // Load the Spreadsheet into a resource stream
  try
    cxSpread.LoadFromStream(Rs);                           // Load the sheet from the resource stream
    cxSpread.ShowHeaders := False;                         // No Headers
    cxSpread.ShowGrid := False;                            // No Grid
  finally
    Rs.Free;                                               // Free the Resource stream
  end;
  Mi := cxSpread.PageCount;                                // Get the number of pages in the book
  SetLength(fMenuItems, Mi);                               // Set the dynamic array up
  for I := 0 to Mi - 1 do                                  // For each Page
  begin
    fMenuItems[I] := TMenuItem.Create(nil);               // Create the menu item
    with fMenuItems[I] do                                  // With the new item
    begin
      Caption := cxSpread.Pages[I].Caption;;               // Set the caption
      Tag := I;                                            // Set the tag
      OnClick := moSelectPlaneClick;                       // Set the event
    end;
    mmAircraft.Add(fMenuItems[I]);                         // Now add the menu item to the aircraft menu
  end;

  fDepCofGColour := clRed;                                 // Set default departure C of G Colour
  fArrCofGColour := clYellow;                              // Set default arrival C of G Colour
  fNormalCellColour := GetCellColour(0, 0);                // Get the normal cell colour
  fErrorCellColour := GetCellColour(2, 17);                // Get the error cell colour
  SetupPlane;                                              // Read the variables for this plane
end;

procedure TFlyingMainForm.FormShow(Sender: TObject);                // For is being shown
begin
  moTodayClick(Sender);                                    // Set today's date
  cxSpread.ActiveCell := Point(2, 3);                      // Set the active cell
  cxSpread1SetSelection(Sender, cxSpread.ActiveSheet);     // Trigger the display of cell hints
end;

// Helpers

procedure TFlyingMainForm.LoadImage(const aResJpg: string;
                           AnImage: TImage);               // Load an JPG image from a resource
var
  Rs: TResourceStream;                                     // Resource Stream
  Jpi: TJpegImage;                                         // Jpeg Image
begin
  Jpi := TJpegImage.Create;                                // Create the Jpeg
  Rs := TResourceStream.Create(hInstance,
                               aResJpg, RT_RCDATA);        // Load the Image
  try
    Jpi.LoadFromStream(Rs);                                // Load from the resource string
    AnImage.Picture.Bitmap.Assign(JPI);                    // Assign to the image control
  finally
    Jpi.Free;                                              // Free the Jpeg
    Rs.Free;                                               // Free the resource stream
  end;
end;

procedure TFlyingMainForm.SetCellMessage(const aCol, aRow: integer; // Display a message in  cell at row, col
  const aMessage: string;                                  // The message
  const aBackgroundColour: Word;                        // The background color
  const aFontColour: Word);                             // The font color
begin
  with cxSpread.ActiveSheet.GetCellObject(aCol, aRow) do   // Get the cell object
    try
      try
        Style.Brush.BackgroundColor := aBackgroundColour;  // Set the background colour
        Style.Font.FontColor := aFontColour;               // set the font colour
        Text := aMessage;                                  // Set the text
      except
      end;
    finally
      Free;                                                // Free the Cell object
    end;
end;

function TFlyingMainForm.GetCellTColour(const aCol,
                               aRow: integer): TColor;     // Get a cell Colour
begin
  with cxSpread.ActiveSheet.GetCellObject(aCol, aRow) do   // Get the Cell object
    try
      try
        Result := cxSpread.Palette[Style.Brush.BackgroundColor]; // Return the colour
      except
        Result := 0;                                       // JIC
      end;
    finally
      Free;                                                // Free the cell object
    end;
end;

function TFlyingMainForm.GetCellColour(const aCol,
                              aRow: integer): integer;     // Get the Cell colour as a plaette entry
begin
  with cxSpread.ActiveSheet.GetCellObject(aCol, aRow) do   // Get the cell object
    try
      try
        Result := Style.Brush.BackgroundColor;             // Return the entry
      except
        Result := 0;                                       // JIC
      end;
    finally
      Free;                                                // Free the cell object
    end;
end;

function TFlyingMainForm.GetCellString(const aCol,
                              aRow: integer): string;      // Get a string from a cell
begin
  with cxSpread.ActiveSheet.GetCellObject(aCol, aRow) do   // Get the Cell Object
    try
      try
        Result := DisplayText;                             // Get the Text
      except
        Result := '';                                      // JIC
      end;
    finally
      Free;                                                // Free the cell object
    end;
end;

function TFlyingMainForm.GetCellInt(const aCol,
                           aRow: integer): integer;        // Get the value of a cell as an integer
begin
  with cxSpread.ActiveSheet.GetCellObject(aCol, aRow) do   // Get the cell object
    try
      try
        Result := CellValue;                               // Get the Display text (not the formula) and convert
      except
        Result := 0;                                       // JIC
      end;
    finally
      Free;                                                // Free the cell object
    end;
end;

function TFlyingMainForm.GetCellDouble(const aCol,
                              aRow: integer): double;      // Get the value of a cell as a double
begin
  with cxSpread.ActiveSheet.GetCellObject(aCol, aRow) do   // Get the cell object
    try
      try
        Result := CellValue;                               // Get the display text (not the formula) and convert
      except
        Result := 0.0;                                     // JIC
      end;
    finally
      Free;                                                // Free the cell object
    end;
end;

procedure TFlyingMainForm.UpdateCofG;                               // Update the C of G
begin
  Pb.Repaint;                                              // Repaint the paint box
end;

procedure TFlyingMainForm.cxSpread1SetSelection(Sender: TObject;
  ASheet: TcxSSBookSheet);                                 // Selection has changed update the hint in the status bar
var
  fCell   : TPoint;                                        // The Current cell
  fHelpId : integer;                                       // The Help ID
begin
  fCell := aSheet.ActiveCell;                              // Get the Active Cell
  if (fCell.Y < 20) and (fCell.X < 4) then                 // If we are on the active area of the sheet
  begin
    fHelpId := HelpIds[fCell.Y, fCell.X];                  // Get the helpid
    if fMaxPersons = 2 then                                // If this is a 2 seater it has two baggage areas
    begin
      if (fCell.Y = 15) then                               // If we are on the Second seat in a 4 seater then display the baggage help
        Inc(fHelpId)                                       // bump the help id
      else if (fCell.Y = 16) then                          // If we are on the baggae area on a 4 seater the display special help for second baggae area
        fHelpId := 9;                                      // specila 2 setare second baggae area
    end;
  end
  else
    fHelpId := 0;                                          // ensure no help for out of limits
  if fHelpId <> 0 then                                     // if we have help
    StatusBar1.Panels[0].Text := HelpText[fHelpId]         // update the status bar
  else
    StatusBar1.Panels[0].Text := '';                       // clear the last help
end;

procedure TFlyingMainForm.CheckFigures;                             // OK let's check the figures for validity
var
  fVal1, fVal2 : double;                                   // Local vars for figures
  function CofGOutsideEnvelope(const aCofG,
                               aWeight: double): boolean;  // Check weightr and C of G inside safety envelope
  var
    X, Y    : integer;                                     // X and Y of position
    fRegion : HRGN;                                        // Handle to region cretaed from points that define the envelope
  begin                                                    // JIC
    X := Round(aWeight * 10);                              // Scale up X
    Y := Round(aCofG * 100);                               // Scale up Y
    fRegion := CreatePolygonRgn(fCofGEnvelope[0],
                                fEnvelopeSize, WINDING);   // Create the region
    try
      Result := not PtInRegion(fRegion, X, y);             // Use window to do the work
    finally
      DeleteObject(fRegion);                               // Delete the region
    end;
  end;
begin
  if IsChecked then Exit;
  IsChecked := True;
  UpdateCofG;                                              // Ensure we are up to date on the graph
  SetCellMessage(0, 10, '', fNormalCellColour, 1);         // Clear the upper error row
  SetCellMessage(0, 20, '', fNormalCellColour, 1);         // Clear the lower error row
  fVal1 := GetCellDouble(3, 8);                            // Get Calculated minimum fuel
  if fVal1 > fMaxFuelCapacity then                         // if we exceed the maximum fuel capacity
  begin
    SetCellMessage(0, 10, Format('Maximum fuel capacity exceeded by %0.2f Ltrs',
      [fVal1 - fMaxFuelCapacity]), 2, 1);                  // Display the error
    Exit;                                                  // No more messages
  end;
  fVal2 := GetCellDouble(3, 9);                            // Get Actual fuel
  if fVal1 > fVal2 then                                    // If actual fuel is less than we need
  begin
    SetCellMessage(0, 10, Format('%0.2f more Ltrs of fuel required', [fVal1 - fVal2]), fErrorCellColour,
      1);                                                  // Display the error
    Exit;                                                  // no more errors
  end;
  if fVal2 > fMaxFuelCapacity then                         // If Actual fuel is more than the capacity ?
  begin
    SetCellMessage(0, 10, 'Maximum Fuel load exceeded', 23, 1); // Display the error
    Exit;                                                  // No more errors
  end;
  fVal1 := GetCellDouble(1, 17);                           // Get Take Off Weight
  if fVal1 > fMaxTakeOffWt then                            // If we are more that certified max
  begin
    SetCellMessage(0, 20, Format('Maximum Take Off Weight exceeded by %0.2f %s',
      [fVal1 - fMaxTakeOffWt, fWeightUnits]), 2, 1);       // Display the error
    Exit;                                                  // No more errors
  end;
  fVal2 := GetCellDouble(2, 17) * fCofgMultiplier;         // Get the Take of C of G
  // Get Take Off C of G
  if CofGOutsideEnvelope(fVal2, fVal1) then                // If outside envelope
  begin
    SetCellMessage(0, 20, 'Take Off C of G outside safe envelope', 2, 1); // Display the error
    Exit;                                                  // No more errors
  end;
  fVal1 := GetCellDouble(1, 19);                           // Get Landing Weight
  if fVal1 > fMaxLandingWt then                            // Check against max allowed
  begin
    SetCellMessage(0, 20, Format('Maximum Landing Weight exceeded by %0.2f %s',
      [fVal1 - fMaxTakeOffWt, fWeightUnits]), 2, 1);       // Display the error
    Exit;                                                  // No more errors
  end;
  fVal2 := GetCellDouble(2, 19) * fCofgMultiplier;         // Get the landing C of G
  // Get Landing C of G
  if CofGOutsideEnvelope(fVal2, fVal1) then                // Check envelope
    SetCellMessage(0, 20, 'Landing C of G outside safe envelope', 2, 1);    // Display the error
  IsChecked := False;
end;

procedure TFlyingMainForm.PbPaint(Sender: TObject);                 // Paint the C of G Lines
var
  DepWt, ArrWt: double;                                    // Local Departure Vars
  DepCg, ArrCg: double;                                    // Local Arrival Vars
  procedure PlotPoint(const aWt, aCofG: double;
                      const aColour: TColor);              // Plot a point with axis
  var
    X, Y: integer;                                         // Local X and Y
  begin
    Y := Round(((aCofG * fCofgMultiplier) -
                 fCofGAxisStarts) * fWtStep);              // Get Y
    X := fCofGAxis - Round((aWt - fCofgWeightMin) *
                     fCofgStep);                           // Get X
    with Pb.Canvas do                                      // Draw on the canvas
    begin
      Brush.Color := aColour;                              // Use the supplied colour
      FillRect(Rect(Y - 5, X - 5, Y + 5, X + 5));          // Draw a 5 pixel square around the point
      Pen.Color := aColour;                                // Set the pen colour
      Pen.Width := 3;                                      // 3 pixles wide
      MoveTo(y, fCofGAxis - 1);                            // Set origin
      LineTo(Y, x - 1);                                    // Draw to Axis
      MoveTo(fCofGWeightAxis - 1, x);                      // Move to axis
      LineTo(y - 1, x);                                    // Draw to X
    end;
  end;
begin
  DepWt := GetCellDouble(1, 17);                           // Get the departure Weight
  DepCg := GetCellDouble(2, 17);                           // Get the departure C of G
  ArrWt := GetCellDouble(1, 19);                           // Get the arrival Weight
  ArrCg := GetCellDouble(2, 19);                           // Get the arrival C of G
  PlotPoint(DepWt, DepCg, fDepCofGColour);                 // Plot departure
  PlotPoint(ArrWt, ArrCg, fArrCofGColour);                 // Plot arrival
end;

procedure TFlyingMainForm.cxSpread1SheetPopupMenu(Sender: TObject; X, Y: integer); // They want the right click menu
var
  fCell : TPoint;                                          // The active cell
begin
  fCell := cxSpread.ActiveSheet.ActiveCell;                // Get the cell
  pmWizard.Visible := False;                               // ensure wizard is hidden, it only applies to seats
  if fCell.X = 1 then                                      // If we are in column 2
  begin
    if fCell.Y = 14 then                                   // Front Seats for both planes
      pmWizard.Visible := True                             // Show the wizard option
    else
      pmWizard.Visible := (fCell.Y = 15) and
                          (fMaxPersons = 4)                // Also need the wizard for a 4 seater in the back
  end;
  ssPm.Popup(X, Y);                                        // popup the wizrd
end;

procedure TFlyingMainForm.pmoFormatClick(Sender: TObject);          // The want to format a cell or cells
begin
  cxSpread.ActiveSheet.FormatCells(cxSpread.SelectionRect);// Format
  fDepCofGColour := GetCellTColour(2, 17);                 // Get new colour JIC it changed
  fArrCofGColour := GetCellTColour(2, 19);                 // Get new colour JIC it changed
  pb.Refresh;                                              // repaint the graph
end;


procedure TFlyingMainForm.mmExitClick(Sender: TObject);             // Exit the App
begin
  Close;                                                   // Bye Bye cruel world
end;

procedure TFlyingMainForm.moTodayClick(Sender: TObject);            // Want todays date
begin
  with cxSpread.ActiveSheet.GetCellObject(2, 0) do         // Get the Date Cell object
    try
      Text := '=now()';                                    // Set formula
    finally
      Free;                                                // Free the cell object
    end;
end;

procedure TFlyingMainForm.moFuelTabsClick(Sender: TObject);         // Want fuel to tabs (markers in the fuel tanks for approx 2/3 capacity)
begin
  with cxSpread.ActiveSheet.GetCellObject(3, 9) do         // Get the Cell object
    try
      Text := Format('%0.2f', [fTabsFuel]);                // Set the fuel
    finally
      Free;                                                // Free the cell object
    end;
  Pb.Repaint;                                          // Update the graph
  CheckFigures;                                        // Check figures for validity
end;

procedure TFlyingMainForm.moSelectPlaneClick(Sender: TObject);      // They selected aplane from the menu
begin
  If cxSpread.ActivePage <> (Sender as TMenuItem).Tag then
  begin
    cxSpread.ActivePage := (Sender as TMenuItem).Tag;        // Get the sheet they selected
    Application.ProcessMessages;                             // breath a while
    SetupPlane;                                              // read the plane variables
    Caption := Format('ExpressSpreadSheet Demo : %s' +
                    ' Load Sheet',[fPlaneReg]);            // Set the form title
  End;
end;

procedure TFlyingMainForm.SetupPlane;                               // Set a plane up
begin
  LoadPlaneVars;                                           // Load the plane variables
  Image1.Picture.Bitmap.LoadFromResourceName(hInstance,
                                        fPlaneCofgBitmap); // Load the C of G bitmap
  LoadImage(fPlanePhoto, Image2);                          // Load the photo
  try
    cxSpread.ActiveCell := Point(2, 3);                    // Set the Fuel cell
  except;
  end;
  moTodayClick(Self);                                      // Set toadys date
end;

procedure TFlyingMainForm.LoadPlaneVars;                            // Load all the variables for this plane from the data block in the spreadhseet
var
  I : integer;                                             // Local loop variable
begin
  fPlaneReg        := GetCellString(1, 23);                // Read the Plane callsign
  fPlaneCofgBitmap := GetCellString(1, 24);                // Get the name of the C of G bitmap
  fPlanePhoto      := GetCellString(1, 25);                // Get the name of the plane photo
  fMaxPersons      := GetCellInt(1, 26);                   // Get the max persons this plane can carry
  fMaxBaggageWt    := GetCellDouble(1, 27);                // Get the Max baggage weight in compartment 1
  fMaxBaggageWt2   := GetCellDouble(1, 28);                // Get the Max baggage weight in compartment 2
  fMaxTakeOffWt    := GetCellDouble(1, 29);                // Get maximum takeoff weight
  fMaxLandingWt    := GetCellDouble(1, 30);                // Get maximum landing weight
  fMinAftCofG      := GetCellDouble(1, 31);                // Get Minimum aft C of G
  fMaxAftCofG      := GetCellDouble(1, 32);                // Get Max Atf C of G
  fMaxFuelCapacity := GetCellDouble(1, 33);                // Get Maximum fuel capacity
  fTabsFuel        := GetCellDouble(1, 34);                // Get fuel when filled to the 'tabs'
  fWeightUnits     := GetCellString(1, 35);                // Get units for weights
  fCofGAxisStarts  := GetCellDouble(1, 36);                // Get the C of G at the left edge of the graph
  fCofGAxis        := GetCellInt(1, 37);                   // Get the position on the graph where the CofG axis starts (from top)
  fCofGWeightMin   := GetCellDouble(1, 38);                // Get the minimum Weight on the weight axis
  fCofGWeightAxis  := GetCellInt(1, 39);                   // Get the position of the weight axis from the left hand edge of the graph
  fCofgStep        := GetCellDouble(1, 40);                // Get the units between each C of G tick
  fWtStep          := GetCellDouble(1, 41);                // Get the units between weight ticks
  fCofgMultiplier  := GetCellDouble(1, 42);                // Get the C of G Multiplier
  fEnvelopeSize    := GetCellInt(1, 43);                   // Get the number of 'points' that comprise the C of G safety envelope
  SetLength(fCofGEnvelope, fEnvelopeSize);                 // Set the Dynamic array length
  for I := 0 to fEnvelopesize - 1 do                       // For each of the 'points'
  begin
    fCofgEnvelope[I].X := GetCellInt(1, 44 + I);           // Get X
    fCofgEnvelope[I].Y := GetCellInt(2, 44 + I);           // Get Y
  end;
end;

procedure TFlyingMainForm.pmWizardClick(Sender: TObject);           // Run the seat wizard
var
  fCell: TPoint;                                           // The active Cell
begin
  with TFlyingSeatCalcForm.Create(Self) do                 // Create the wizard
    try
      CallSign := fPlaneReg;                               // Set the Aircraft callsign
      ResultInKgs := UpperCase(fWeightUnits) = 'KGS';      // Set which units we require the result in
      if ShowModal = idOk then                             // Run the wizard and if they selected OK
      begin
        fCell := cxSpread.ActiveSheet.ActiveCell;          // Get the active Cell
        with cxSpread.ActiveSheet.GetCellObject(fCell.X, fCell.y) do // Get the Cell object
          try
            Text := efFormula.Text;                        // Copy the forumla in
          finally
            Free;                                          // Free the cell object
          end;
          Pb.Repaint;                                    // Update the graph
          CheckFigures;                                  // Check figures for validity
      end;
    finally
      Free;                                                // Free the wizard
    end;
end;

procedure TFlyingMainForm.cxSpreadTopLeftChanging(Sender: TcxSSBookSheet;
  var ATopLeft: TPoint);
begin
  ATopLeft.X := 0;                                         // Don't move from top cell
  ATopLeft.Y := 0;
end;

procedure TFlyingMainForm.cxSpreadAfterCalculation(Sender: TObject);
begin
  Pb.Repaint;                                              // Update the graph
  CheckFigures;                                            // Check figures for validity
end;

procedure TFlyingMainForm.cxSpreadActiveCellChanging(
  Sender: TcxSSBookSheet; const ActiveCell: TPoint;
  var CanSelect: Boolean);
begin
  CanSelect := (ActiveCell.X <= 3) and
    (ActiveCell.Y <= 20);
end;

end.
