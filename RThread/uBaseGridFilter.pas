unit uBaseGridFilter;

interface
  uses
    SysUtils, Classes, StdCtrls, Db, Grids, DBClient, ExtCtrls, comctrls, Graphics,
    controls, ToolEdit, CurrEdit, RxCtrls, menus, DBGridEh;
type
  TAddFieldEvent = procedure (Sender: TObject; AColumn: TObject; var AllowAdd : boolean) of object;

  DisableFieldType = (dsbString, // ftString, ftMemo, ftWideString, ftFixedChar
                     dsbDate,   // ftDate, ftDateTime
                     dsbTime,   // ftTime
                     dsbBoolean,        // ftBoolean
                     dsbNumeric  // ftAutoInc, ftInteger, ftWord, ftFloat, ftCurrency
  );
  DisableFieldTypes = set of DisableFieldType;

  TBaseGridFilter = class (TCustomControl)
  private
    FCaption: String;
    FDateFilter: TDateEdit;
    FTextFilter: TEdit;
    FDigitFilter: TCurrencyEdit;
    FTimePicker : TDateTimePicker;
    FCheckBox : TCheckBox;
    FComboBox: TComboBox;
    FFieldTypes: DisableFieldTypes;
    FDefFilter: String;
    FAddFieldEvent: TAddFieldEvent;
    procedure PopupMenuPopup(Sender: TObject);
    procedure FilterChange(Sender: TObject);
    procedure SetCaption(const Value: String);
    procedure SetFieldTypes(const Value: DisableFieldTypes);
    procedure SetDefFilter(const Value: String);
    procedure Resize; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  protected
    FLastMenuItem : TMenuItem;
    FNameColumn : String;
    FComboBoxCond : TComboBox;
    OldColumnColor : TColor;
    FPopupMenu: TPopupMenu;
    FSL : TStringList;
    AEditor : TWinControl;
    FDBGrid : TDBGridEh;
    FSpeedButton : TRxSpeedButton;

    procedure FilteredDate_Ex(FilterFieldName : String; ADataType: TFieldType; var Str : String);
//***********
    procedure FilteredDate; virtual; abstract;
    procedure CalcFilter(ACaption: String); virtual; abstract;
    procedure CreateMenuItems; virtual; abstract;
    procedure ClearFilter; virtual;
//***********

    procedure MIClick(Sender: TObject);
    function DesTypes(const Value: TFieldType): boolean;

    function GetListBox : TComboBox;

    function GetCheckBox : TCheckBox;
    function GetDateFilter: TDateEdit;
    function GetTextFilter: TEdit;
    function GetDigitFilter: TCurrencyEdit;
    function GetTimeFilter : TDateTimePicker;
    function GetComboBox: TComboBox;
    procedure RecalcWidth;
  public
   constructor Create(Owner:TComponent); override;
   destructor Destroy; override;
   procedure Loaded; override;
  published
    property DisableFieldType : DisableFieldTypes read FFieldTypes write SetFieldTypes;
    property DefFilter : String read FDefFilter write SetDefFilter;
    property Caption : String read FCaption write SetCaption;

    property AddFieldEvent : TAddFieldEvent read FAddFieldEvent write FAddFieldEvent;
  end;

implementation


{ TBaseGridFilter }

procedure TBaseGridFilter.FilteredDate_Ex(FilterFieldName : String; ADataType: TFieldType; var Str : String);
var FilterStr : String;
    Year, Month, Day : Word;
begin
    try
      Str := '1=1';
      if (AEditor <> nil) then
      begin
        if (AEditor is TEdit) and (Trim(TEdit(AEditor).Text) <> '') then
          FilterStr := FilterFieldName + ' LIKE ''%' + AnsiUpperCase(TEdit(AEditor).Text) + '%''' + ' OR ' + FilterFieldName + '=''' + AnsiUpperCase(TEdit(AEditor).Text) + '''' +
           ' OR UPPER(' + FilterFieldName + ') LIKE ''%' + AnsiUpperCase(TEdit(AEditor).Text) + '%''' + ' OR UPPER(' + FilterFieldName + ')=''' + AnsiUpperCase(TEdit(AEditor).Text) + '''';
        if (ADataType in [ftAutoInc, ftInteger, ftWord]) and (TCurrencyEdit(AEditor).Text <> '') then
        begin
          if (FComboBoxCond <> nil) and (FComboBoxCond.Visible) then
          begin
            FilterStr := FilterFieldName + FComboBoxCond.Text + FloatToStr(TCurrencyEdit(AEditor).Value);
          end
          else
            FilterStr := FilterFieldName + '=' + FloatToStr(TCurrencyEdit(AEditor).Value);
        end;
        if (ADataType in [ftFloat, ftCurrency]) and (TCurrencyEdit(AEditor).Text <> '') then
        begin
          if (FComboBoxCond <> nil) and (FComboBoxCond.Visible) and (FComboBoxCond.ItemIndex <> 0) then
          begin
            FilterStr := FilterFieldName + FComboBoxCond.Text + FloatToStr(TCurrencyEdit(AEditor).Value);
          end
          else
            FilterStr := FilterFieldName + '>=' + FloatToStr(TCurrencyEdit(AEditor).Value - 0.005) + ' AND ' + FilterFieldName + '<=' + FloatToStr(TCurrencyEdit(AEditor).Value + 0.005);
        end;

        if (ADataType in [ftDate, ftDateTime]) and (TDateEdit(AEditor).Date <> 0) then
        begin
          if (FComboBoxCond <> nil) and (FComboBoxCond.Visible) and (FComboBoxCond.ItemIndex <> 0) then
          begin
            DecodeDate(TDateEdit(AEditor).Date, Year, Month, Day);
            if FComboBoxCond.Text = '<=' then
              FilterStr := FilterFieldName + FComboBoxCond.Text + '''' + DateToStr(EncodeDate(Year, Month, Day) + 1) + ''''
            else
              FilterStr := FilterFieldName + FComboBoxCond.Text + '''' + DateToStr(EncodeDate(Year, Month, Day)) + '''';
          end
          else
          begin
            DecodeDate(TDateEdit(AEditor).Date, Year, Month, Day);
            FilterStr := FilterFieldName + '>=''' + DateToStr(EncodeDate(Year, Month, Day)) + ''' AND ' + FilterFieldName + '<''' + DateToStr(EncodeDate(Year, Month, Day) + 1) + '''';
          end;
        end;

        if (AEditor is TCheckBox) and (TCheckBox(AEditor).State <> cbGrayed) then
        begin
          if TCheckBox(AEditor).State = cbChecked then
            FilterStr := FilterFieldName + '<>0'
          else
            FilterStr := FilterFieldName + '=0';
        end;
        if (AEditor is TComboBox) and (TComboBox(AEditor).ItemIndex <> 0) then
        begin
          if TComboBox(AEditor).ItemIndex = 2 then
            FilterStr := FilterFieldName + '<>0'
          else
            FilterStr := FilterFieldName + '=0';
        end;
      end;
      if FilterStr <> '' then
      begin
        Str := Str + ' and (' + FilterStr + ')';
        FSpeedButton.Font.Color := clRed;
      end
      else
      begin
        FSpeedButton.Font.Color := clWindowText;
      end;
      if trim(DefFilter) <> '' then
        Str := Str + ' and (' + trim(DefFilter) + ')';
         
    finally
    end;
end;

constructor TBaseGridFilter.Create(Owner: TComponent);
var ANewMI : TMenuItem;
begin
  inherited;
  FSL := TStringList.Create;   
  Caption := 'Фильтр';
  AEditor := nil;
//  AColumn := nil;
  FSpeedButton := TRxSpeedButton.Create(Self);
  FSpeedButton.Parent := Self;
  FSpeedButton.Caption := FCaption;
  FSpeedButton.Width := 70;
  FSpeedButton.Anchors := FSpeedButton.Anchors + [akBottom, akRight];

  FPopupMenu := TPopupMenu.Create(Self);
  FPopupMenu.OnPopup := PopupMenuPopup;
  FSpeedButton.DropDownMenu := FPopupMenu;

  Height := FSpeedButton.Height + 1;
  RecalcWidth;
end;

destructor TBaseGridFilter.Destroy;
begin
  FSL.Free;
  inherited;
end;

function TBaseGridFilter.GetDateFilter: TDateEdit;
begin
  if FDateFilter = nil then
  begin
    FDateFilter := TDateEdit.Create(Self);
    FDateFilter.OnChange := FilterChange;
    FDateFilter.Visible := false;
    FDateFilter.parent := Self;
    FDateFilter.DirectInput := false;
  end;
  Result := FDateFilter;
  GetListBox;
end;

function TBaseGridFilter.GetCheckBox: TCheckBox;
begin
  if FCheckBox = nil then
  begin
    FCheckBox := TCheckBox.Create(Self);
    FCheckBox.OnClick := FilterChange;
    FCheckBox.AllowGrayed := true;
    FCheckBox.State := cbGrayed;
    FCheckBox.Visible := false;
    FCheckBox.parent := Self;
    FCheckBox.Width := 20;
  end;
  Result := FCheckBox;
  Result.Height := Height;
end;

function TBaseGridFilter.GetComboBox: TComboBox;
begin
  if FComboBox = nil then
  begin
    FComboBox := TComboBox.Create(Self);
    FComboBox.Visible := false;
    FComboBox.Parent := Self;
    FComboBox.Width := 90;
    FComboBox.Style := csDropDownList;
    FComboBox.Items.AddObject('Все', pointer(-1));
    FComboBox.Items.AddObject('Не отмеченные', pointer(0));
    FComboBox.Items.AddObject('Отмеченные', pointer(1));
    FComboBox.ItemIndex := 0;
    FComboBox.OnClick := FilterChange;
  end;
  Result := FComboBox;
  if FComboBoxCond <> nil then
    FComboBoxCond.Visible := false;
//  Result.Height := Height;
end;

function TBaseGridFilter.GetDigitFilter: TCurrencyEdit;
begin
  if FDigitFilter = nil then
  begin
    FDigitFilter := TCurrencyEdit.Create(Self);
    FDigitFilter.OnChange := FilterChange;
    FDigitFilter.Visible := false;
    FDigitFilter.parent := Self;
    FDigitFilter.ZeroEmpty := true;
  end;
  Result := FDigitFilter;
  GetListBox;
end;

function TBaseGridFilter.GetTextFilter: TEdit;
begin
  if FTextFilter = nil then
  begin
    FTextFilter := TEdit.Create(Self);
    FTextFilter.OnChange := FilterChange;
    FTextFilter.Visible := false;
    FTextFilter.parent := Self;
  end;
  Result := FTextFilter;
//  GetListBox;
end;

procedure TBaseGridFilter.RecalcWidth;
var W : integer;
begin
  FSpeedButton.Anchors := FSpeedButton.Anchors - [akRight];
  try
    W := FSpeedButton.Width;
    if (AEditor <> nil) and (AEditor.Visible) then
      W := W + AEditor.Width + 1;
    if (FComboBoxCond <> nil) and (FComboBoxCond.Visible) then
      W := W + FComboBoxCond.Width + 1;
    Width := W;
  finally
    FSpeedButton.Anchors := FSpeedButton.Anchors + [akRight];
  end;
end;

procedure TBaseGridFilter.PopupMenuPopup(Sender: TObject);
begin
  if FPopupMenu.Items.Count = 1 then
    CreateMenuItems;
end;

procedure TBaseGridFilter.MIClick(Sender: TObject);
begin
  if FLastMenuItem <> nil then
    FLastMenuItem.Checked := false;
  (Sender as TMenuItem).Checked := true;
  FLastMenuItem := (Sender as TMenuItem);
//  AColumn := nil;
  if AEditor <> nil then
  begin
    AEditor.Visible := false;
    ClearFilter;
  end;
  if FComboBoxCond <> nil then
  begin
    FComboBoxCond.Visible := false;
  end;
  AEditor := nil;
  if ((Sender as TMenuItem).Tag > 0) and (FSL.Count >= (Sender as TMenuItem).Tag) then
    CalcFilter(FSL.Strings[(Sender as TMenuItem).Tag])
  else
  begin
    FSpeedButton.Font.Color := clWindowText;
    CalcFilter('');
  end;
{  if ((Sender as TMenuItem).MenuIndex > 0) and (FSL.Count = (Sender as TMenuItem).GetParentMenu.Items.Count - 1) then
    CalcFilter(FSL.Strings[(Sender as TMenuItem).MenuIndex - 1])
  else
  begin
    FSpeedButton.Font.Color := clWindowText;
    CalcFilter('');
  end;  }
end;

procedure TBaseGridFilter.SetCaption(const Value: String);
begin
  FCaption := Value;
  FSpeedButton.Caption := FCaption;
end;

function TBaseGridFilter.GetTimeFilter: TDateTimePicker;
begin
  if FTimePicker = nil then
  begin
    FTimePicker := TDateTimePicker.Create(Self);
    FTimePicker.Kind := dtkTime;
    FTimePicker.OnChange := FilterChange;
    FTimePicker.Visible := false;
    FTimePicker.parent := Self;
  end;
  Result := FTimePicker;
end;

procedure TBaseGridFilter.FilterChange(Sender: TObject);
begin
  if (Sender as TWinControl).Visible then
    FilteredDate;
end;

procedure TBaseGridFilter.ClearFilter;
begin
  if AEditor <> nil then
  begin
    if AEditor is TEdit then
      TEdit(AEditor).Text := ''
    else
    if AEditor is TCurrencyEdit then
      TCurrencyEdit(AEditor).Value := 0
    else
    if AEditor is TDateEdit then
      TDateEdit(AEditor).Text := '';
  end;
  if FComboBoxCond <> nil then
  begin
    FComboBoxCond.ItemIndex := 0;
  end;
end;


procedure TBaseGridFilter.Loaded;
begin
  inherited;
  FSpeedButton.Height := Height - 1;
  FSpeedButton.Width := Width - 1;
end;

function TBaseGridFilter.DesTypes(const Value: TFieldType) : boolean;
begin
  result := true;

  if Value in [ftString, ftMemo, ftWideString, ftFixedChar] then
    Result := (dsbString in FFieldTypes);
  if Value in [ftDate, ftDateTime] then
     Result := dsbDate in FFieldTypes;
  if Value in [ftTime] then
     Result := dsbTime in FFieldTypes;
  if Value in [ftBoolean] then
     Result := dsbBoolean in FFieldTypes;
  if Value in [ftAutoInc, ftInteger, ftSmallint, ftWord, ftFloat, ftCurrency] then       
     Result := dsbNumeric in FFieldTypes;
end;

procedure TBaseGridFilter.SetFieldTypes(const Value: DisableFieldTypes);
begin
  FFieldTypes := Value;

  CreateMenuItems;
end;

procedure TBaseGridFilter.SetDefFilter(const Value: String);
begin
  FDefFilter := Value;
  FilteredDate;
end;

procedure TBaseGridFilter.Resize;
begin
  inherited;
  FSpeedButton.Height := Height - 1;
  RecalcWidth;
end;

procedure TBaseGridFilter.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if not (csDestroying in ComponentState) then
  try
    if Operation = opRemove then
    begin
      if FDBGrid = AComponent then
        FDBGrid := nil;
    end;
  except
  end
end;

function TBaseGridFilter.GetListBox: TComboBox;
begin
//  if (AEditor is TDateEdit) or (AEditor is TCurrencyEdit) then
  begin
    if FComboBoxCond = nil then
    begin
      FComboBoxCond := TComboBox.Create(Self);
      FComboBoxCond.Parent := Self;
      FComboBoxCond.Width := 40;
      FComboBoxCond.Left := FSpeedButton.Width + 1;
  //    FComboBoxCond.Align := alLeft;
      FComboBoxCond.Style := csDropDownList;
      FComboBoxCond.Items.AddObject('=', Pointer(1));

      FComboBoxCond.Items.AddObject('>=', Pointer(2));
      FComboBoxCond.Items.AddObject('<=', Pointer(3));
      FComboBoxCond.Items.AddObject('<>', Pointer(4));
      FComboBoxCond.ItemIndex := 0;
      FComboBoxCond.OnChange := FilterChange;
      FComboBoxCond.Visible := true;
    end
    else
      FComboBoxCond.Visible := true;
  end;
  Result := FComboBoxCond;
end;

end.
