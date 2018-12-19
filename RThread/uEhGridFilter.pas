unit uEhGridFilter;

interface
  uses
    SysUtils, Classes, StdCtrls, Db, Grids, DBGrids, DBClient, ExtCtrls, comctrls, Graphics,
    controls, ToolEdit, CurrEdit, RxCtrls, menus,
    uBaseGridFilter, DBGridEh;
type

  TEhGridFilter = class (TBaseGridFilter)
  private
    AColumn, OldColumn : TColumnEh;
  protected
//***********
    procedure FilteredDate; override;
    procedure CalcFilter(ACaption: String); override;
    procedure CreateMenuItems; override;
    function GetDBGrid: TDBGridEh;
    procedure SetDBGrid(const Value: TDBGridEh);
    procedure ClearFilter; override;
//***********
  public
  published
    property DBGrid : TDBGridEh read GetDBGrid write SetDBGrid;
  end;

  procedure Register;
implementation


type
  THackCustomEhDBGrid = class(TDBGridEh)
    property Columns;
  end;
  THackControl = class(TControl)
    property Text;
  end;
procedure Register;
begin
   RegisterComponents('Midas', [TEhGridFilter]);
end;

{ TEhGridFilter }

procedure TEhGridFilter.CalcFilter(ACaption: String);
var i : integer;
begin
  if FDBGrid <> nil then
  begin
    if ACaption <> '' then
    begin
      for i := 0 to THackCustomEhDBGrid(FDBGrid).Columns.Count - 1 do
      begin
        if (THackCustomEhDBGrid(FDBGrid).Columns[i].Title.Caption = ACaption) then
        begin
          AColumn := THackCustomEhDBGrid(FDBGrid).Columns[i];
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
          if (FComboBoxCond <> nil) and (FComboBoxCond.Visible) then
            AEditor.Left := AEditor.Left + FComboBoxCond.Width + 1;
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

procedure TEhGridFilter.ClearFilter;
begin
  inherited;
  if OldColumn <> nil then
  begin
    OldColumn.Title.Font.Color := OldColumnColor;
    FNameColumn := '';
  end;
end;

procedure TEhGridFilter.CreateMenuItems;
var i, j : integer;
    AColumn : TColumnEh;
    AMI, ANewMI, ALastMI : TMenuItem;
    AllowAdd : boolean;
    SL : TStringList;
begin
  ANewMI := TMenuItem.Create(Self);
  ANewMI.RadioItem := true;
  FPopupMenu.Items.Insert(0, ANewMI);
  ANewMI.Caption := 'Показывать все';
  ANewMI.Checked := true;
  ANewMI.OnClick := MIClick;
  FLastMenuItem := ANewMI;

  ALastMI := nil;
  if FDBGrid <> nil then
  begin
    SL := TStringList.Create;
    try
      FSL.Clear;
      for i := 0 to THackCustomEhDBGrid(FDBGrid).VisibleColumns.Count - 1 do
      begin
        AColumn := THackCustomEhDBGrid(FDBGrid).VisibleColumns[i];
        if (AColumn.Field <> nil) then
        begin
          ALastMI := nil;
          SL.Text := StringReplace(Trim(AColumn.Title.Caption), '|', #13 + #10, []);
          for j := 0 to SL.Count - 1 do
          begin
            if j = 0 then
              AMI := FPopupMenu.Items.Find(SL[j])
            else
            begin
              AMI := ALastMI.Find(SL[j]);
            end;
            if AMI = nil then
            begin
              AMI := TMenuItem.Create(Self);
              AMI.Caption := SL[j];
              if ALastMI = nil then
                FPopupMenu.Items.Add(AMI)
              else
                ALastMI.Add(AMI);
              ALastMI := AMI;

              if j = SL.Count - 1 then
              begin
                AllowAdd := true;
            //    AllowAdd := not DesTypes(AColumn.Field.DataType);
            //    if Assigned(AddFieldEvent) then
            //      AddFieldEvent(Self, AColumn, AllowAdd);
                if AllowAdd then
                begin
                  ALastMI.RadioItem := true;
                  FSL.Add(AColumn.Title.Caption);
                  ALastMI.OnClick := MIClick;
                  ALastMI.Tag := i;
                end;
              end;
            end
            else
              ALastMI := AMI;
          end;
        end;
     {   if (AMI = nil) and (AColumn.Field <> nil) then
        begin
          AllowAdd := true;
          AllowAdd := not DesTypes(AColumn.Field.DataType);
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
        end;}
      end;
    finally
      SL.Free;
    end;
  end;
end;

procedure TEhGridFilter.FilteredDate;
var Str : String;
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
      DBGrid.DataSource.DataSet.FilterOptions := [foCaseInsensitive];
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

function TEhGridFilter.GetDBGrid: TDBGridEh;
begin
  Result := TDBGridEh(FDBGrid);
end;

procedure TEhGridFilter.SetDBGrid(const Value: TDBGridEh);
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
      if (FPopupMenu.Items[i].Tag < FPopupMenu.Items.Count) and (FNameColumn = THackCustomEhDBGrid(FDBGrid).VisibleColumns[FPopupMenu.Items[i].Tag].FieldName) then
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
