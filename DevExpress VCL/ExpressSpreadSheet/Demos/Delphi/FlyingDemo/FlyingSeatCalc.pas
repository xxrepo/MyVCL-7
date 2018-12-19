unit FlyingSeatCalc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask;

type
  TEditMode = (emKgs, emLbs, emStonesLbs);
  TFlyingSeatCalcForm = class(TForm)
    GroupBox1: TGroupBox;
    rbLsKgs: TRadioButton;
    rbLsLbs: TRadioButton;
    rbLsStones: TRadioButton;
    lblLsPrime: TLabel;
    lblLsLbs: TLabel;
    GroupBox2: TGroupBox;
    lblRsPrime: TLabel;
    lblRsLbs: TLabel;
    rbRsKgs: TRadioButton;
    rbRsLbs: TRadioButton;
    rbRsStones: TRadioButton;
    lblFormula: TLabel;
    efFormula: TEdit;
    btnOk: TButton;
    Button2: TButton;
    efLsPrime: TEdit;
    efLsLbs: TEdit;
    efRsPrime: TEdit;
    efRsLbs: TEdit;
    procedure rbLsKgsClick(Sender: TObject);
    procedure rbRsKgsClick(Sender: TObject);
    procedure meLsPrimeExit(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure EdtKeyPress(Sender: TObject; var Key: char);
  private
    fInKgs: boolean;
    fCallSign: string;
    fLsMode: TEditMode;
    fRsMode: TeditMode;
    procedure SetInKgs(const Value: boolean);
    function GetEfFloatValue(aControl: TEdit): double;
    function GetEfIntValue(aControl: TEdit): integer;
    procedure SetControls(aTag: integer; aPrime, aLbs: Tedit; aPrimeLbl,
      aLbsLbl: TLabel; var aMode: TEditMode);
  public
    constructor Create(AOwner: TComponent); override;
    property ResultInKgs: boolean read fInKgs write SetInKgs;
    property CallSign: string read fCallSign write fCallSign;
  end;

var
  FlyingSeatCalcForm: TFlyingSeatCalcForm;

const
  NumKeys: PChar = '.1234567890';

implementation

uses cxSSUtils;

{$R *.dfm}

constructor TFlyingSeatCalcForm.Create(AOwner: TComponent);
begin
  inherited;
  fLsMode := emLbs;                                        // Set Left hand seat mode to LBS
  fRsMode := emLbs;                                        // Set Right hand seat mode to LBS
end;

procedure TFlyingSeatCalcForm.SetControls(aTag: integer;
  aPrime, aLbs: Tedit;
  aPrimeLbl, aLbsLbl: TLabel;
  var aMode: TEditMode);                                   // Set up controls for a change in the weigth units
var
  fKgs: double;                                            // Local for Kgs weight
  fLbs: integer;                                           // Local for Lbs weight
  fStn: integer;                                           // Local for Stones weight
begin
  fKgs := GetEfFloatValue(aPrime);                         // Get the weight in KGS
  fStn := GetEfIntValue(aPrime);                           // Get the weight in Stones
  fLbs := GetEfIntValue(aLbs);                             // Get the weight in LBS ( for Stones and LBS)
  case aTag of                                             // Work on the change type
    0:                                                     // Weight in KGS
    begin
      aPrimeLbl.Caption := 'Weight in Kgs';                // Set title
      aPrime.MaxLength := 5;                               // Max length 5 (12.35 ot 123.5)
      case aMode of                                        // Check previous mode and convert the previous value
        emLbs: aPrime.Text := Format('%0.2f', [(fStn * 1.0) / 2.2]); // Convert from LBS
        emStonesLbs: aPrime.Text := Format('%0.2f', [((fStn * 14) + fLbs) * 1.0 / 2.2]);  // Convert from Stones and Lbs
      end;
      aMode := emKgs;                                      // Now working in Kgs
      aLbsLbl.Visible := False;                            // Don't show the Lbs label
      aLbs.Visible := False;                               // Don't show the Lbs entry field
    end;
    1:                                                     // Now working in LBS
    begin
      aPrimeLbl.Caption := 'Weight in Lbs';                // Update the Title
      aPrime.MaxLength := 3;                               // Max 3 digits
      case aMode of                                        // Check previous mode and convert
        emKgs: aPrime.Text := Format('%d', [Round(fKgs * 2.2)]);  // From Kgs
        emStonesLbs: aPrime.Text := Format('%d', [(fStn * 14) + fLbs]);  // From Stones and Lbs
      end;
      aMode := emLbs;                                      // Now Working in Lbs
      aLbsLbl.Visible := False;                            // Don't show the Lbs label
      aLbs.Visible := False;                               // Don't show the Lbs entry field
    end;
    2:                                                     // Now working in Stones and Lbs
    begin
      aPrimeLbl.Caption := 'Weight in Stones';             // Update title
      aPrime.MaxLength := 2;                               // Max 2 digits
      case aMode of                                        // Check previous mode and convert
        emKgs:                                             // was in Kgs
        begin
          FLbs := Round(fKgs * 2.2);                       // Get total in Lbs
          fStn := FLbs div 14;                             // Get stones
          FLbs := Flbs - (Fstn * 14);                      // Get Lbs
          aPrime.Text := Format('%0d', [fStn]);            // Set Text
          aLbs.Text := Format('%0d', [fLbs]);              // Set Text
        end;
        emLbs:                                             // Convert from LBS
        begin
          FLbs := fStn mod 14;                             // Get remaining Lbs
          fStn := FStn div 14;                             // Get stones
          aPrime.Text := Format('%0d', [fStn]);            // Set Text
          aLbs.Text := Format('%0d', [fLbs]);              // Set Text
        end;
      end;
      aMode := emStonesLbs;                                // Now working in stones and lbs
      aLbsLbl.Visible := True;                             // Show the lbs label
      aLbs.Visible := True;                                // show the lbs edit field
    end;
  end;
end;

procedure TFlyingSeatCalcForm.rbLsKgsClick(Sender: TObject);      // Changing the mode for the Left seat
begin
  SetControls((Sender as TRadioButton).Tag,
    efLsPrime, efLsLbs,
    lblLsPrime, lblLsLbs,
    fLsMode);                                              // Make the change
  meLsPrimeExit(Sender);                                   // Update
end;

procedure TFlyingSeatCalcForm.rbRsKgsClick(Sender: TObject);      // Changing the mode for the Right seat
begin
  SetControls((Sender as TRadioButton).Tag,
    efRsPrime, efRsLbs,
    lblRsPrime, lblRsLbs,
    fRsMode);                                              // Make the change
  meLsPrimeExit(Sender);                                   // Update
end;

function TFlyingSeatCalcForm.GetEfFloatValue(aControl: TEdit): double; // Get a value as a double
begin
  cxTryStrToFloat(aControl.Text, Result);                   // Try it
end;

function TFlyingSeatCalcForm.GetEfIntValue(aControl: TEdit): integer;  // Getb a value as an Integer
begin
  cxTryStrToInt(aControl.Text, Result);
end;

procedure TFlyingSeatCalcForm.SetInKgs(const Value: boolean);     // Change the overall result mode
begin
  fInKgs := Value;                                         // Set var
  if fInKgs then                                           // if we are working in Kgs
  begin
    lblFormula.Caption := 'Formula for Kgs';               // Update the label
    Caption := Format('%s Seat Weights in Kgs', [fCallSign]); // Set the form caption
  end
  else
  begin
    lblFormula.Caption := 'Formula for Lbs';               // Update the label
    Caption := Format('%s Seat Weights in Lbs', [fCallSign]); // Set the form caption
  end;
end;

procedure TFlyingSeatCalcForm.meLsPrimeExit(Sender: TObject);     // Exiting an entry field for Left hand seat
var
  fLeftForm, fRightForm, fFormula: string;                 // The left, Right and complete formulas
  function GetFormula(aPrime, aLbs: TEdit;
    arbK, arbL: TRadioButton;
    aKgsToLbs, aLbsToKgs: string): string;                 // Get a formula
  var
    fStones, fLbs: integer;                                // Local Vars
    fKgs: double;                                          // Local Vars
  begin
    SetLength(Result, 0);                                  // Return nothing
    if aRbK.Checked then
    begin                                                  // If In Kgs
      fKgs := GetEfFloatValue(aPrime);                     // Get KGS value
      if fKgs <> 0.0 then                                  // If we have a value
        Result := Format('%0.2f%s', [fKgs, aKgsToLbs])     // set the formula
    end
    else if aRbl.Checked then                              // If in Lbs
    begin
      fLbs := GetEfIntValue(aPrime);                       // Get the Lbs
      if fLbs <> 0 then                                    // If we have a value
        if Length(aLbsToKgs) > 0 then                      // if we are converting Lbs to Kgs
          Result := Format('(%d%s)', [fLbs, aLbsToKgs])    // Format for conversion to Kgs
        else
          Result := Format('%d', [fLbs]);                  // formula is the number
    end
    else
    begin                                                  // formula for stones and lbs
      fStones := GetEfIntValue(aPrime);                    // Get stones
      fLbs := GetEfIntValue(aLbs);                         // get Lbs
      if fStones <> 0 then                                 // If we have stones
        Result := Format('%d * 14%s', [fStones, aLbsToKgs]); // set formula including conversion to Kgs if required
      if fLbs <> 0 then                                    // if we have Lbs
      begin
        if fLbs > 13 then                                  // if they are more that 13 ( a stones = 14 Lbs)
        begin
          fLbs := 13;                                      // ensure valid
          aLbs.Text := '13';                               // update the edit field
        end;
        if fStones > 0 then                                // if we have have to add the stones
          if Length(aLbsToKgs) > 0 then                    // check conversion
            Result := Format('((%d * 14) + %d)%s', [fStones, fLbs, aLbsToKgs]) // Formula
          else
            Result := Format('(%d * 14) + %d', [fStones, fLbs]) // Formula without conversion
        else
          Result := Format('%d%s', [fLbs, aLbsToKgs]);     // formula for no stones (must be a small persoon ?)
      end;
    end;
  end;
begin
  if ResultInKgs then                                      // If we want the total result converted to Kgs
  begin
    fLeftForm := GetFormula(efLsPrime, efLsLbs, rbLsKgs,
                            rbLsLbs, '', ' / 2' + DecimalSeparator + '2');        // Get the Left hand seat formula
    fRightForm := GetFormula(efRsPrime, efRsLbs, rbRsKgs,
                             rbRsLbs, '', ' / 2' + DecimalSeparator + '2');       // Get the right hand seta formula
  end
  else
  begin                                                    // Result in Lbs
    fLeftForm := GetFormula(efLsPrime, efLsLbs, rbLsKgs,
                            rbLsLbs, ' * 2' + DecimalSeparator + '2', '');        // Get Left seat
    fRightForm := GetFormula(efRsPrime, efRsLbs, rbRsKgs,
                             rbRsLbs, ' * 2' + DecimalSeparator + '2', '');       // Get right seat
  end;
  if (Length(fLeftForm) > 0) and
     (Length(fRightForm) > 0) then                         // If both seats return a formula
    fFormula := Format('(%s) + %s', [fLeftForm,
                                     fRightForm])          // weld them together
  else if Length(fLeftForm) > 0 then                       // If left has the result
    fFormula := fLeftForm                                  // Copy to the forlula
  else
    fFormula := fRightForm;                                // Right has the result, copy
  btnOk.Enabled := Length(fFormula) > 0;                   // enable the OK button if we have a result to return
  if btnOk.Enabled then                                    // We have a result
    efFormula.Text := Format('= %s', [fFormula])           // Ensure sheet knows it's a formula
  else
    efFormula.Text := '';                                  // Nothing !
end;

procedure TFlyingSeatCalcForm.btnOkClick(Sender: TObject);        // On OK
begin
  meLsPrimeExit(Sender);                                   // Enaure updated
end;

procedure GetValidChar(var Key: char);      // Get a valid numeric char
begin
  if Key > ' ' then                                        // If anascii character
    if StrScan(NumKeys, Key) = nil then         // Scan for a valid Key
      Key := char(0)                                       // Not valid ZAP it
end;

procedure TFlyingSeatCalcForm.EdtKeyPress(Sender: TObject; var Key: char);
begin
  GetValidChar(Key);    // Check for a valid Key
end;

end.
