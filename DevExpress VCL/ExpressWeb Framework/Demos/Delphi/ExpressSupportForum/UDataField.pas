unit UDataField;

interface

type
  TFieldRestriction = (frNotNull, frSingle, frSize);
  TFieldRestrictionSet = set of TFieldRestriction;

  TFieldValidator = class
  private
    FRestrictions: TFieldRestrictionSet;

    property Restrictions: TFieldRestrictionSet read FRestrictions write FRestrictions;
  public
    procedure Assign(ARestrictions: TFieldRestrictionSet);
  end;

  TDataField = class
  private
    FName: string;
    FValidator: TFieldValidator;
    FValue: Variant;
    FOldValue: Variant;

    function GetIsChange: Boolean;

    property Validator: TFieldValidator read FValidator write FValidator;
  public
    destructor Destroy; override;

    procedure AssignValidator(ARestrictions: TFieldRestrictionSet);

    property IsChange: Boolean read GetIsChange;
    property Name: string read FName write FName;
    property FieldValue: Variant read FValue write FValue;
    property OldValue: Variant read FOldValue write FOldValue;
  end;

  TFieldInitInfo = record
    FieldName: string;
    FieldRest: TFieldRestrictionSet;
  end;

  TFieldInfo = record
    FieldName: string;
    FieldRest: TFieldValidator;
  end;

implementation

uses Variants;
{ TDataField }

procedure TDataField.AssignValidator(ARestrictions: TFieldRestrictionSet);
begin
  Validator := TFieldValidator.Create;
  Validator.Assign(ARestrictions);
end;

destructor TDataField.Destroy;
begin
  if Validator <> nil then
    Validator.Free;

  inherited;
end;

function TDataField.GetIsChange: Boolean;
begin
  Result := not VarSameValue(OldValue, FieldValue);
end;


{ TFieldValidator }

procedure TFieldValidator.Assign(ARestrictions: TFieldRestrictionSet);
begin
  Restrictions := ARestrictions;
end;

end.
