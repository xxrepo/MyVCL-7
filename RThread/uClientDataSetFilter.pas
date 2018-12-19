unit uClientDataSetFilter;

interface
  uses
    SysUtils, Classes, StdCtrls, Db, Grids, DBGrids, DBClient, ExtCtrls, comctrls, Graphics,
    controls, ToolEdit, CurrEdit, RxCtrls, menus;
type
  DisableFieldType = (dsbString, // ftString, ftMemo, ftWideString, ftFixedChar
                     dsbDate,   // ftDate, ftDateTime
                     dsbTime,   // ftTime
                     dsbBoolean,        // ftBoolean
                     dsbNumeric  // ftAutoInc, ftInteger, ftWord, ftFloat, ftCurrency
  );
  DisableFieldTypes = set of DisableFieldType;

  TClientDataSetFilter = class (TPanel)
  private
  {}
   FFilterString:string;
   FDataSet:TDataSet;
   FOnOkClick:TNotifyEvent;
   FOnCancelClick:TNotifyEvent;
   function GetDataSet:TDataSet;
   procedure SetDataSet(Value:TDataSet);
   procedure ChangeFieldsList(Sender:TObject);
   procedure ReplButton(Sender:TObject);
   procedure OkClick(Sender:TObject);
   procedure CancelClick(Sender:TObject);
  protected
   FieldsList:TComboBox;
   StrEdit:TEdit;
   DateEdit:TDateTimePicker;
   OkButton:TButton;
   CancelButton:TButton;
  public
   constructor Create(Owner:TComponent); override;
   destructor Destroy; override;
  published
   property DataSet :TDataSet read GetDataSet write SetDataSet;
   property FilterString:string read FFilterString;
   property OnOkClick:TNotifyEvent  read FOnOkClick write FOnOkClick;
   property OnCancelClick:TNotifyEvent  read FOnCancelClick write FOnCancelClick;
  end;

  TDSFilter = class (TCustomControl)
  private
    FSL : TStringList; 
    FSpeedButton : TRxSpeedButton;
    FDBGrid : TCustomDBGrid;
    FCaption: String;
    AColumn : TColumn;
    AEditor : TWinControl;
    FPopupMenu: TPopupMenu;
    FDateFilter: TDateEdit;
    FTextFilter: TEdit;
    FDigitFilter: TCurrencyEdit;
    FTimePicker : TDateTimePicker;
    FCheckBox : TCheckBox;
    FComboBox: TComboBox;
    FFieldTypes: DisableFieldTypes;
    FDefFilter: String;
    function GetCheckBox : TCheckBox;
    function GetDateFilter: TDateEdit;
    function GetTextFilter: TEdit;
    function GetDigitFilter: TCurrencyEdit;
    function GetTimeFilter : TDateTimePicker;
    procedure PopupMenuPopup(Sender: TObject);
    procedure MIClick(Sender: TObject);
    procedure FilterChange(Sender: TObject);
    procedure FilteredDate;
    function GetDBGrid: TCustomDBGrid;
    procedure SetDBGrid(const Value: TCustomDBGrid);
    procedure SetCaption(const Value: String);
    procedure ClearFilter;
    procedure RecalcWidth;
    procedure SetFieldTypes(const Value: DisableFieldTypes);
    procedure SetDefFilter(const Value: String);
    procedure CalcFilter(ACaption: String);
    procedure CreateMenuItems;
    function DesTypes(const Value: TFieldType): boolean;
    procedure Resize; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function GetComboBox: TComboBox;
  public
   constructor Create(Owner:TComponent); override;
   destructor Destroy; override;
   procedure Loaded; override;
  published
    property FieldTypes : DisableFieldTypes read FFieldTypes write SetFieldTypes;
    property DefFilter : String read FDefFilter write SetDefFilter;
    property Caption : String read FCaption write SetCaption;
    property DBGrid :TCustomDBGrid read GetDBGrid write SetDBGrid;
  end;

  procedure Register;
implementation


type
  THackCustomDBGrid = class(TCustomDBGrid)
    property Columns;
  end;
  THackControl = class(TControl)
    property Text;
  end;
procedure Register;
begin
   RegisterComponents('Midas', [TClientDataSetFilter]);
   RegisterComponents('Midas', [TDSFilter]);
end;

constructor TClientDataSetFilter.Create;
begin
 inherited;
 Caption:='';
 Width:=250;
 Height:=100;
 OnResize:=ReplButton;
  OkButton:=TButton.Create(Self);
  with OkButton do
  begin
   Parent:=Self;
   Width:=40; Height:=20;
   Caption:='Ok';
   Top:=Self.Height-Height-BevelWidth;
   Left:=BevelWidth;
   OnClick:=Self.OkClick;
  end;

   CancelButton:=TButton.Create(Self);
  with CancelButton do
  begin
   Parent:=Self;
   Width:=40; Height:=20;
   Caption:='Отказ';
   Top:=Self.Height-Height-BevelWidth;
   Left:=Self.Width-Width-BevelWidth;
   OnClick:=Self.CancelClick;
  end;


 FieldsList:=TComboBox.Create(Self);
  with FieldsList do
  begin
   Parent:=Self;
   Top:=20; Left:= 10;
   Width:=Self.Width-20;
   OnChange:=Self.ChangeFieldsList;
  end;

 StrEdit:=TEdit.Create(Self);
 with StrEdit do
  begin
   Parent:=Self;
   Visible:=False;
   Top:=45; Left:= 10;
  end;

 DateEdit:=TDateTimePicker.Create(Self);
  with DateEdit do
  begin
   Parent:=Self;
   Visible:=False;
   Top:=45; Left:= 10;
  end;
  Invalidate;
end;

destructor TClientDataSetFilter.Destroy;
begin
 inherited;
{}
end;

function TClientDataSetFilter.GetDataSet:TDataSet;
begin
 Result:=FDataSet;
end;

procedure TClientDataSetFilter.SetDataSet(Value:TDataSet);
var
 i:integer;
begin
 FDataSet:=Value;
 if (Value<>nil) and (FDataSet.Active) then
 begin
  FieldsList.Items.Clear;
   for i:=0 to FDataSet.Fields.Count-1 do
     FieldsList.Items.add(FDataSet.Fields[i].FullName);
 end;
end;

procedure TClientDataSetFilter.ChangeFieldsList(Sender:TObject);
begin
 if FDataSet.Fields[FieldsList.ItemIndex].DataType =ftDateTime then
   DateEdit.Visible:=True
   else
   DateEdit.Visible:=False;

 if (FDataSet.Fields[FieldsList.ItemIndex].DataType =ftInteger) or  (FDataSet.Fields[FieldsList.ItemIndex].DataType=ftString) then
   StrEdit.Visible:=True
   else
   StrEdit.Visible:=False;
end;

procedure TClientDataSetFilter.ReplButton(Sender:TObject);
begin
 if OkButton<>nil then
  with OkButton do
  begin
   Top:=Self.Height-Height-BevelWidth;
   Left:=BevelWidth;
  end;
 if CancelButton<>nil then
  with CancelButton do
  begin
   Top:=Self.Height-Height-BevelWidth;
   Left:=Self.Width-Width-BevelWidth;
  end;
  if FieldsList<>nil then
   FieldsList.Width:=Self.Width-20;
end;

procedure TClientDataSetFilter.OkClick(Sender:TObject);
var

 iY,iM,iD:word;
 y,m,d:string;

begin
 if FDataSet.Fields[FieldsList.ItemIndex].DataType =ftDateTime then
  Begin
  DecodeDate(DateEdit.date, iY, iM, iD);
  d:=IntToStr(iD);
  m:=IntToStr(iM);
  y:=IntToStr(iY);
   DataSet.Filter:='Year('+FDataSet.Fields[FieldsList.ItemIndex].FullName+')'+'='+y+
   'and Month('+FDataSet.Fields[FieldsList.ItemIndex].FullName+')'+'='+m+
   'and Day('+FDataSet.Fields[FieldsList.ItemIndex].FullName+')'+'='+d
  end;

 if (FDataSet.Fields[FieldsList.ItemIndex].DataType =ftInteger) then
  Begin
   DataSet.Filter:=FDataSet.Fields[FieldsList.ItemIndex].FullName+'='+StrEdit.Text
  end;

 if  (FDataSet.Fields[FieldsList.ItemIndex].DataType=ftString) then
  Begin
   DataSet.Filter:=
      FDataSet.Fields[FieldsList.ItemIndex].FullName+' LIKE ''%'+StrEdit.Text+'%'' or '+
      FDataSet.Fields[FieldsList.ItemIndex].FullName+' LIKE '''+StrEdit.Text+'%'' or '+
      FDataSet.Fields[FieldsList.ItemIndex].FullName+' LIKE ''%'+StrEdit.Text+''' or '+
      FDataSet.Fields[FieldsList.ItemIndex].FullName+' = '''+StrEdit.Text+''''  ;
  end;
   DataSet.Filtered:=True;

  if Assigned(FOnOkClick) then FOnOkClick(Self);
end;

procedure TClientDataSetFilter.CancelClick(Sender:TObject);
begin
  if Assigned(FOnCancelClick) then FOnCancelClick(Self);
end;

{ TDSFilter }

constructor TDSFilter.Create(Owner: TComponent);
var ANewMI : TMenuItem;
begin
  inherited;
  FSL := TStringList.Create;   
  Caption := 'Фильтр';
  AEditor := nil;
  AColumn := nil;
  FSpeedButton := TRxSpeedButton.Create(Self);
  FSpeedButton.Parent := Self;
  FSpeedButton.Caption := FCaption;
//  FSpeedButton.Width := 70;
  FSpeedButton.Anchors := FSpeedButton.Anchors + [akBottom, akRight];

  FPopupMenu := TPopupMenu.Create(Self);
  FPopupMenu.OnPopup := PopupMenuPopup;
  FSpeedButton.DropDownMenu := FPopupMenu;
//  if (FPopupMenu.Items.Count > 0) then
  begin
    ANewMI := TMenuItem.Create(Self);
    ANewMI.RadioItem := true;
    FPopupMenu.Items.Insert(0, ANewMI);
    ANewMI.Caption := 'Показывать все';
    ANewMI.Checked := true;
    ANewMI.OnClick := MIClick;
  end;
  RecalcWidth;
end;

destructor TDSFilter.Destroy;
begin
  FSL.Free;
  inherited;
end;

function TDSFilter.GetDBGrid: TCustomDBGrid;
begin
  Result := FDBGrid;
end;

function TDSFilter.GetDateFilter: TDateEdit;
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
end;

function TDSFilter.GetCheckBox: TCheckBox;
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

function TDSFilter.GetComboBox: TComboBox;
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
//  Result.Height := Height;
end;

function TDSFilter.GetDigitFilter: TCurrencyEdit;
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
end;

function TDSFilter.GetTextFilter: TEdit;
begin
  if FTextFilter = nil then
  begin
    FTextFilter := TEdit.Create(Self);
    FTextFilter.OnChange := FilterChange;
    FTextFilter.Visible := false;
    FTextFilter.parent := Self;
  end;
  Result := FTextFilter;
end;

procedure TDSFilter.RecalcWidth;
var W : integer;
begin
  FSpeedButton.Anchors := FSpeedButton.Anchors - [akRight];
  try
    W := FSpeedButton.Width;
    if (AEditor <> nil) and (AEditor.Visible) then
      W := W + AEditor.Width + 1;
    Width := W;
  finally
    FSpeedButton.Anchors := FSpeedButton.Anchors + [akRight];
  end;
end;

procedure TDSFilter.PopupMenuPopup(Sender: TObject);
begin
  if FPopupMenu.Items.Count = 1 then
    CreateMenuItems;
end;

procedure TDSFilter.CreateMenuItems;
var i : integer;
    AColumn : TColumn;
    AMI, ANewMI : TMenuItem;
begin
  if FDBGrid <> nil then
  begin
    FSL.Clear;
    for i := 0 to THackCustomDBGrid(FDBGrid).Columns.Count - 1 do
    begin
      AColumn := THackCustomDBGrid(FDBGrid).Columns[i];
      AMI := FPopupMenu.Items.Find(AColumn.Title.Caption);
      if (AMI = nil) and (AColumn.Field <> nil) and (not DesTypes(AColumn.Field.DataType)) then
      begin
        ANewMI := TMenuItem.Create(Self);
        ANewMI.RadioItem := true;
        FPopupMenu.Items.Add(ANewMI);
        ANewMI.Caption := AColumn.Title.Caption;
        FSL.Add(AColumn.Title.Caption);
        ANewMI.OnClick := MIClick;
      end;
    end;
  end;
end;

procedure TDSFilter.SetDBGrid(const Value: TCustomDBGrid);
begin
  FDBGrid := Value;
end;


procedure TDSFilter.MIClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := true;
  AColumn := nil;
  if AEditor <> nil then
  begin
    AEditor.Visible := false;
    ClearFilter;
  end;
  AEditor := nil;
  if ((Sender as TMenuItem).MenuIndex > 0) and (FSL.Count = (Sender as TMenuItem).GetParentMenu.Items.Count - 1) then
    CalcFilter(FSL.Strings[(Sender as TMenuItem).MenuIndex - 1])
  else
    CalcFilter('');
end;

procedure TDSFilter.CalcFilter(ACaption: String);
var i : integer;
begin
  if FDBGrid <> nil then
  begin
    if ACaption <> '' then
    begin
      for i := 0 to THackCustomDBGrid(FDBGrid).Columns.Count - 1 do
      begin
        if (THackCustomDBGrid(FDBGrid).Columns[i].Title.Caption = ACaption) then
        begin
          AColumn := THackCustomDBGrid(FDBGrid).Columns[i];
          Break;
        end;
      end;
      if (AColumn <> nil) and (AColumn.Field <> nil) then
      begin
        if AColumn.Field.DataType in [ftString, ftMemo, ftWideString, ftFixedChar] then
          AEditor := GetTextFilter;
          
        if (AColumn.Field.DataType in [ftDate, ftDateTime]) then 
          AEditor := GetDateFilter;
          
        if (AColumn.Field  is TTimeField) then
          AEditor := GetTimeFilter;

        if (AColumn.Field  is TBooleanField) then
          AEditor := GetComboBox;// GetCheckBox; 1013

        if (AColumn.Field.DataType in [ftAutoInc, ftInteger, ftWord, ftFloat, ftCurrency]) then
        begin
          AEditor := GetDigitFilter;
          TCurrencyEdit(AEditor).DisplayFormat := TNumericField(AColumn.Field).DisplayFormat;
        end;
        
        if AEditor <> nil then
        begin
          AEditor.Left := FSpeedButton.Width + 1;
          AEditor.Visible := true;
        end;
      end;
    end
    else
    begin

    end;
  end;
  RecalcWidth;
  FilteredDate;
end;

procedure TDSFilter.SetCaption(const Value: String);
begin
  FCaption := Value;
  FSpeedButton.Caption := FCaption;
end;

function TDSFilter.GetTimeFilter: TDateTimePicker;
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

procedure TDSFilter.FilteredDate;
var Str, FilterStr, FilterFieldName : String;
    Year, Month, Day : Word;
begin
  if (FDBGrid <> nil) and (FDBGrid.DataSource <> nil) and (FDBGrid.DataSource.DataSet <> nil) then
  begin
    FDBGrid.DataSource.DataSet.DisableControls;
    try
      Str := '1=1';
      if (AColumn <> nil) and (AEditor <> nil) then
      begin
        FilterFieldName := AColumn.FieldName;
        if (AEditor is TEdit) and (Trim(TEdit(AEditor).Text) <> '') then
//          FilterStr := FilterFieldName + ' LIKE ''%' + TEdit(AEditor).Text + '%''' + ' OR ' + FilterFieldName + '=''' + TEdit(AEditor).Text + '''';
          FilterStr := 'Upper(' + FilterFieldName + ') LIKE ''%' + AnsiUpperCase(TEdit(AEditor).Text) + '%''' + ' OR Upper(' + FilterFieldName + ')=''' + AnsiUpperCase(TEdit(AEditor).Text) + '''';
        if (AColumn.Field.DataType in [ftAutoInc, ftInteger, ftWord]) and (TCurrencyEdit(AEditor).Text <> '') then
          FilterStr := FilterFieldName + '=' + FloatToStr(TCurrencyEdit(AEditor).Value);
        if (AColumn.Field.DataType in [ftFloat, ftCurrency]) and (TCurrencyEdit(AEditor).Text <> '') then
          FilterStr := FilterFieldName + '>=' + FloatToStr(TCurrencyEdit(AEditor).Value - 0.005) + ' AND ' + FilterFieldName + '<=' + FloatToStr(TCurrencyEdit(AEditor).Value + 0.005);
        if (AColumn.Field.DataType in [ftDate, ftDateTime]) and (TDateEdit(AEditor).Date <> 0) then
        begin
          DecodeDate(TDateEdit(AEditor).Date, Year, Month, Day);
          FilterStr := FilterFieldName + '>=''' + DateToStr(EncodeDate(Year, Month, Day)) + ''' AND ' + FilterFieldName + '<''' + DateToStr(EncodeDate(Year, Month, Day) + 1) + '''';
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
      if trim(FDefFilter) <> '' then
        Str := Str + ' and (' + trim(FDefFilter) + ')';
         
      FDBGrid.DataSource.DataSet.Filtered := False;
      FDBGrid.DataSource.DataSet.Filter := Str;
      FDBGrid.DataSource.DataSet.Filtered := true;
    finally
      FDBGrid.DataSource.DataSet.EnableControls;
    end;
  end;
end;

procedure TDSFilter.FilterChange(Sender: TObject);
begin
  if (Sender as TWinControl).Visible then
    FilteredDate;
end;

procedure TDSFilter.ClearFilter;
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
end;


procedure TDSFilter.Loaded;
begin
  inherited;
  FSpeedButton.Height := Height - 1;
  FSpeedButton.Width := Width - 1;
end;

function TDSFilter.DesTypes(const Value: TFieldType) : boolean;
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
  if Value in [ftAutoInc, ftInteger, ftWord, ftFloat, ftCurrency] then
     Result := dsbNumeric in FFieldTypes;
end;

procedure TDSFilter.SetFieldTypes(const Value: DisableFieldTypes);
begin
  FFieldTypes := Value;

  CreateMenuItems;
end;

procedure TDSFilter.SetDefFilter(const Value: String);
begin
  FDefFilter := Value;
  FilteredDate;
end;

procedure TDSFilter.Resize;
begin
  inherited;
  FSpeedButton.Height := Height - 1;
  RecalcWidth;
end;

procedure TDSFilter.Notification(AComponent: TComponent;
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

end.
