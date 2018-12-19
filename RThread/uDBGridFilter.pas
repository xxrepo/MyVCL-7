unit uDBGridFilter;

interface
  uses
    SysUtils, Classes, StdCtrls, Db, Grids, DBGrids, DBClient, ExtCtrls, comctrls, Graphics,
    controls, ToolEdit, CurrEdit, RxCtrls, menus,
    uBaseGridFilter;
type

  TDBGridFilter = class (TBaseGridFilter)
  private
    AColumn, OldColumn : TColumn;
//***********
    procedure FilteredDate; override;
    procedure CalcFilter(ACaption: String); override;
    procedure CreateMenuItems; override;
    function GetDBGrid: TDBGrid;
    procedure SetDBGrid(const Value: TDBGridEh);
    procedure ClearFilter; override;
//***********
  public
  published
    property DBGrid : TDBGrid read GetDBGrid write SetDBGrid;
  end;

  procedure Register;
implementation


type
  THackCustomDBGrid = class(TDBGrid)
    property Columns;
  end;
  THackControl = class(TControl)
    property Text;
  end;
procedure Register;
begin
   RegisterComponents('Midas', [TDBGridFilter]);
end;

{ TEhGridFilter }

procedure TDBGridFilter.CalcFilter(ACaption: String);
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

procedure TDBGridFilter.ClearFilter;
begin
  inherited;
  if OldColumn <> nil then
  begin
    OldColumn.Title.Font.Color := OldColumnColor;
    FNameColumn := '';
  end;
end;

procedure TDBGridFilter.CreateMenuItems;
var i : integer;
    AColumn : TColumn;
    AMI, ANewMI : TMenuItem;
    AllowAdd : boolean;
begin
  ANewMI := TMenuItem.Create(Self);
  ANewMI.RadioItem := true;
  FPopupMenu.Items.Insert(0, ANewMI);
  ANewMI.Caption := 'Показывать все';
  ANewMI.Checked := true;
  ANewMI.OnClick := MIClick;

  if FDBGrid <> nil then
  begin
    FSL.Clear;
    for i := 0 to THackCustomDBGrid(FDBGrid).Columns.Count - 1 do
    begin
      AColumn := THackCustomDBGrid(FDBGrid).Columns[i];
      AMI := FPopupMenu.Items.Find(AColumn.Title.Caption);
      if (AColumn.Visible) and (AMI = nil) and (AColumn.Field <> nil) and (not DesTypes(AColumn.Field.DataType)) then
      begin
        AllowAdd := true;
        if Assigned(AddFieldEvent) then
          AddFieldEvent(Self, AColumn, AllowAdd);
        if AllowAdd then
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
end;

procedure TDBGridFilter.FilteredDate;
var Str, FilterStr, FilterFieldName : String;
    Year, Month, Day : Word;
begin
  if (DBGrid <> nil) and (DBGrid.DataSource <> nil) and (DBGrid.DataSource.DataSet <> nil) then
  begin
    DBGrid.DataSource.DataSet.DisableControls;
    try
      Str := '1=1';
      if (AColumn <> nil) and (AEditor <> nil) then
      begin
         FilteredDate_Ex(AColumn.FieldName, AColumn.Field.DataType, Str)
      end
      else
      begin
        if DefFilter <> '' then
          Str := Str + ' AND ' + DefFilter;
      end;

      DBGrid.DataSource.DataSet.Filtered := False;
      DBGrid.DataSource.DataSet.Filter := Str;
      DBGrid.DataSource.DataSet.Filtered := true;
    finally
      DBGrid.DataSource.DataSet.EnableControls;
      if (AColumn <> nil) then
      begin
        if (AEditor <> nil) then
        begin
          if OldColumn <> nil then
          begin
            OldColumn.Title.Font.Color := OldColumnColor;
            FNameColumn := OldColumn.FieldName;
          end;
          OldColumnColor := AColumn.Title.Font.Color;
          OldColumn := AColumn;
          AColumn.Title.Font.Color := clRed;
        end
      end
      else
        if OldColumn <> nil then
        begin
          OldColumn.Title.Font.Color := OldColumnColor;
          FNameColumn := OldColumn.FieldName;
        end;
    end;
  end;
end;

function TDBGridFilter.GetDBGrid: TDBGrid;
begin
  Result := TDBGrid(FDBGrid);
end;

procedure TDBGridFilter.SetDBGrid(const Value: TDBGridEh);
var i : integer;
    ClearNeed : boolean;
begin
  FDBGrid := Value;
  FPopupMenu.Items.Clear;
  CreateMenuItems;
  ClearNeed := true;
  if FNameColumn <> '' then
  begin
    for i := 0 to FPopupMenu.Items.Count - 1 do
    begin
      if (FPopupMenu.Items[i].Tag < FPopupMenu.Items.Count) and (FNameColumn = THackCustomDBGrid(FDBGrid).Columns[FPopupMenu.Items[i].Tag].FieldName) then
      begin
        FPopupMenu.Items[i].Checked := true;
        ClearNeed := false;
        Break;
      end;
    end;
  end;
  if ClearNeed then
  begin
    ClearFilter;
    if AEditor <> nil then
      AEditor.Visible := false;
  end;
end;

end.
