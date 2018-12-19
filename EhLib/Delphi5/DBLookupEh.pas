{*******************************************************}
{                                                       }
{                       EhLib v2.0                      }
{             TDBLookupComboboxEh component             }
{                                                       }
{      Copyright (c) 2001 by Dmitry V. Bolshakov        }
{                                                       }
{*******************************************************}

unit DBLookupEh;

//{$define eval}
{$I EhLib.Inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
{$IFDEF EH_LIB_6} Variants, {$ENDIF}
  StdCtrls, Mask, Db, DBCtrls, Buttons, DBCtrlsEh, ToolCtrlsEh;

type

{ TDropDownBoxEh }

  TCustomDBLookupComboboxEh = class;

  TDropDownBoxEh = class(TPersistent)
  private
    FDBLookupCombobox: TCustomDBLookupComboboxEh;
    FWidth: Integer;
    FRows: Integer;
    FAlign: TDropDownAlign;
    FSizable: Boolean;
    FShowTitles: Boolean;
    FAutoDrop: Boolean;
    //FAutoFitColWidths: Boolean;
  public
    constructor Create(DBLookupCombobox: TCustomDBLookupComboboxEh);
    procedure Assign(Source: TPersistent); override;
  published
    property Align: TDropDownAlign read FAlign write FAlign default daLeft;
    property AutoDrop: Boolean read FAutoDrop write FAutoDrop default False;
    property Rows: Integer read FRows write FRows default 7;
    property Width: Integer read FWidth write FWidth default 0;
    property Sizable: Boolean read FSizable write FSizable default False;
    property ShowTitles: Boolean read FShowTitles write FShowTitles default False;
    //property AutoFitColWidths: Boolean read FAutoFitColWidths write FAutoFitColWidths default False;
  end;

{ TDataSourceLinkEh }

  TDataSourceLinkEh = class(TFieldDataLinkEh)
  private
    FDBLookupControl: TCustomDBLookupComboboxEh;
    FDataIndependentValueAsText:Boolean;
  protected
    constructor Create;
    procedure LayoutChanged; override;
  end;

{ TListSourceLinkEh }

  TListSourceLinkEh = class(TDataLink)
  private
    FDBLookupControl: TCustomDBLookupComboboxEh;
  protected
    procedure ActiveChanged; override;
    procedure DataSetChanged; override;
    procedure LayoutChanged; override;
  public
    constructor Create;
  end;

{ TDBLookupComboboxEh }

  TDBLookupComboboxEhStyle = (csDropDownListEh, csDropDownEh);

  TCustomDBLookupComboboxEh = class(TCustomDBEditEh)
  private
    FDataFields: TFieldsArrEh;
    FDataFieldName: String;
    FDataFieldsUpdating:Boolean;
    FDataList: TPopupDataListEh;
    FDropDownBox: TDropDownBoxEh;
    FInternalTextSetting: Boolean;
    FKeyFields: TFieldsArrEh;
    FKeyFieldName: String;
    FKeyTextIndependent:Boolean;
    FKeyValue: Variant;
    FListActive: Boolean;
    FListField: TField;
    FListFieldIndex: Integer;
    FListFieldName: String;
    FListFields: TList;
    FListLink: TListSourceLinkEh;
    FListVisible: Boolean;
    FLockUpdateKeyTextIndependent: Boolean;
    FLookupMode: Boolean;
    FLookupSource: TDataSource;
    FMasterFields: TFieldsArrEh;
    FMasterFieldNames:String;
    FOnCloseUp: TCloseUpEventEh;
    FOnDropDown: TNotifyEvent;
    FOnKeyValueChanged: TNotifyEvent;
    FOnNotInList: TNotInListEventEh;
    FStyle: TDBLookupComboboxEhStyle;
    function GetDataLink: TDataSourceLinkEh;
    function GetKeyFieldName: String;
    function GetListSource: TDataSource;
    function GetOnButtonClick: TButtonClickEventEh;
    function GetOnButtonDown: TButtonDownEventEh;
    procedure CheckNotCircular;
    procedure CheckNotLookup;
    procedure CMCancelMode(var Message: TCMCancelMode); message CM_CANCELMODE;
    procedure CMWantSpecialKey(var Message: TCMWantSpecialKey); message CM_WANTSPECIALKEY;
    procedure DataListKeyValueChanged(Sender: TObject);
    procedure EMReplacesel(var Message: TMessage); message EM_REPLACESEL;
    procedure ListMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SetDataFieldName(const Value: String);
    procedure SetDropDownBox(const Value: TDropDownBoxEh);
    procedure SetKeyFieldName(const Value: String);
    procedure SetKeyValue(const Value: Variant);
    procedure SetListFieldName(const Value: String);
    procedure SetListSource(Value: TDataSource);
    procedure SetLookupMode(Value: Boolean);
    procedure SetOnButtonClick(const Value: TButtonClickEventEh);
    procedure SetOnButtonDown(const Value: TButtonDownEventEh);
    procedure SetStyle(const Value: TDBLookupComboboxEhStyle);
    procedure UpdateKeyTextIndependent;
    procedure UpdateReadOnly;
    procedure WMChar(var Message: TWMChar); message WM_CHAR;
    procedure WMCut(var Message: TMessage); message WM_CUT;
    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
    procedure WMSetCursor(var Message: TWMSetCursor); message WM_SETCURSOR;
  protected
    function ButtonEnabled: Boolean; override;
    function LocateKey: Boolean; virtual;
    function LocateStr(Str: String; PartialKey:Boolean): Boolean; virtual;
    function CanModify(TryEdit:Boolean): Boolean; virtual;
    function CreateDataLink: TFieldDataLinkEh; override;
    function CreateEditButton: TEditButtonEh; override;
    function DefaultAlignment: TAlignment; override;
    function GetDataField: TField; reintroduce;
    function GetListFieldsWidth: Integer; virtual;
    function GetVariantValue:Variant; override;
    function IsValidChar(InputChar: Char): Boolean; override;
    procedure ActiveChanged; override;
    procedure ButtonDown(IsDownButton:Boolean); override;
    procedure DataChanged; override;
    procedure InternalSetText(AText:String); override;
    procedure InternalSetValue(AValue:Variant); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure KeyValueChanged; virtual;
    procedure ListLinkDataChanged; virtual;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure ProcessSearchStr(Str: String); virtual;
    procedure SelectKeyValue(const Value: Variant); virtual;
    procedure SetEditText(Value:String);
    procedure UpdateDataFields; virtual;
    procedure UpdateListFields; virtual;
    property DataLink: TDataSourceLinkEh read GetDataLink;
    property ListActive: Boolean read FListActive;
    property ListFields: TList read FListFields;
    property ListLink: TListSourceLinkEh read FListLink;
    property OnButtonClick: TButtonClickEventEh read GetOnButtonClick write SetOnButtonClick;
    property OnButtonDown: TButtonDownEventEh read GetOnButtonDown write SetOnButtonDown;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ClearDataProps;
    procedure CloseUp(Accept: Boolean); override;
    procedure DefaultHandler(var Message); override;
    procedure DropDown; override;
    procedure SelectAll;
    procedure SelectNextValue(IsPrior:Boolean);
    procedure UpdateData; override;
    property DataField: String read FDataFieldName write SetDataFieldName;
    //property DataSource: TDataSource read GetDataSource write SetDataSource; Internal error: E4983
    property DropDownBox: TDropDownBoxEh read FDropDownBox write SetDropDownBox;
    property Field: TField read GetDataField;
    property KeyField: String read GetKeyFieldName write SetKeyFieldName;
    property KeyValue: Variant read FKeyValue write SelectKeyValue;
    property ListField: String read FListFieldName write SetListFieldName;
    property ListFieldIndex: Integer read FListFieldIndex write FListFieldIndex default 0;
    property ListSource: TDataSource read GetListSource write SetListSource;
    property ListVisible: Boolean read FListVisible;
    property OnCloseUp: TCloseUpEventEh read FOnCloseUp write FOnCloseUp;
    property OnDropDown: TNotifyEvent read FOnDropDown write FOnDropDown;
    property OnKeyValueChanged: TNotifyEvent read FOnKeyValueChanged write FOnKeyValueChanged;
    property OnNotInList: TNotInListEventEh read FOnNotInList write FOnNotInList;
    property Style: TDBLookupComboboxEhStyle read FStyle write SetStyle default csDropDownListEh;
    property Text;
  end;

  TDBLookupComboboxEh = class(TCustomDBLookupComboboxEh)
  published
    property Alignment;
    property AlwaysShowBorder;
    property AutoSelect;
    property AutoSize;
    property BorderStyle;
    property Anchors;
    property BiDiMode;
    property Constraints;
    property DragKind;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
    {$IFDEF EH_LIB_5}
    property OnContextPopup;
    {$ENDIF}
    property Color;
    property Ctl3D;
    property DataField;
    property DataSource;
    property DragCursor;
    property DragMode;
    property DropDownBox;
    property Enabled;
    property EditButton;
    property Font;
    property Flat;
    property ImeMode;
    property ImeName;
    property KeyField;
    property ListField;
    property ListFieldIndex;
    property ListSource;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
    property WordWrap;
    property OnButtonClick;
    property OnButtonDown;
    property OnChange;
    property OnClick;
    property OnCloseUp;
    property OnDragDrop;
    property OnDragOver;
    property OnDropDown;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnKeyValueChanged;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnNotInList;
    property OnUpdateData;
    property OnStartDrag;
  end;
implementation

uses DbConsts, Clipbrd {$IFDEF EH_LIB_6} ,VDBConsts {$ENDIF};

function VarEquals(const V1, V2: Variant): Boolean;
var i:Integer;
begin
  Result := not (VarIsArray(V1) xor VarIsArray(V2));
  if not Result then Exit;
  Result := False;
  try
    if VarIsArray(V1) and VarIsArray(V2) and
     (VarArrayDimCount(V1) = VarArrayDimCount(V2)) and
     (VarArrayLowBound(V1,1) = VarArrayLowBound(V2,1)) and
     (VarArrayHighBound(V1,1) = VarArrayHighBound(V2,1))
    then
      for i := VarArrayLowBound(V1,1) to VarArrayHighBound(V1,1) do
      begin
        Result := V1[i] = V2[i];
        if not Result then Exit;
      end
    else
      Result := V1 = V2;
  except
  end;
end;

{ TDataSourceLinkEh }

constructor TDataSourceLinkEh.Create;
begin
  inherited Create;
  MultiFields := True;
end;

procedure TDataSourceLinkEh.LayoutChanged;
begin
  if FDBLookupControl <> nil then FDBLookupControl.UpdateDataFields;
end;

{ TListSourceLinkEh }

constructor TListSourceLinkEh.Create;
begin
  inherited Create;
  VisualControl := True;
end;

procedure TListSourceLinkEh.ActiveChanged;
begin
  if FDBLookupControl <> nil then FDBLookupControl.UpdateListFields;
end;

procedure TListSourceLinkEh.DataSetChanged;
begin
  if FDBLookupControl <> nil then FDBLookupControl.ListLinkDataChanged;
end;

procedure TListSourceLinkEh.LayoutChanged;
begin
  if FDBLookupControl <> nil then FDBLookupControl.UpdateListFields;
end;

{ TCustomDBLookupComboboxEh }

constructor TCustomDBLookupComboboxEh.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FLookupSource := TDataSource.Create(Self);
  FListLink := TListSourceLinkEh.Create;
  FListLink.FDBLookupControl := Self;
  FListFields := TList.Create;
  FKeyValue := Null;

  FDataList := TPopupDataListEh.Create(Self);
  FDataList.Visible := False;
  FDataList.Parent := Self;
  FDataList.OnMouseUp := ListMouseUp;
  FDataList.OnUserKeyValueChange := DataListKeyValueChanged;

  FDropDownBox := TDropDownBoxEh.Create(Self);
  FDropDownBox.FRows := 7;
  FKeyTextIndependent := True;
  UpdateButtonState;
end;

destructor TCustomDBLookupComboboxEh.Destroy;
begin
  FListFields.Free;
  FListFields := nil;
  FListLink.FDBLookupControl := nil;
  FListLink.Free;
  FListLink := nil;
  FDropDownBox.Free;
  inherited Destroy;
end;

function TCustomDBLookupComboboxEh.CanModify(TryEdit:Boolean): Boolean;
  function MasterFieldsCanModify: Boolean;
  var i:Integer;
  begin
    Result := True;
    for i := 0 to Length(FMasterFields)-1 do
      if not FMasterFields[i].CanModify then
      begin
        Result := False;
        Exit;
      end;
  end;
begin
  Result := (FKeyTextIndependent or FListActive) and
            not ReadOnly and
            ( (FDataLink.DataSource = nil) or (Length(FMasterFields) <> 0) and MasterFieldsCanModify );
  if TryEdit and Result and (Length(FMasterFields) <> 0) then
    Result := FDataLink.Edit;
end;

function TCustomDBLookupComboboxEh.CreateEditButton: TEditButtonEh;
begin
  Result := TVisibleEditButtonEh.Create(Self,FEditSpeedButton);
end;

function TCustomDBLookupComboboxEh.CreateDataLink: TFieldDataLinkEh;
begin
  Result := TFieldDataLinkEh(TDataSourceLinkEh.Create);
  TDataSourceLinkEh(Result).FDBLookupControl := Self;
end;

procedure TCustomDBLookupComboboxEh.CheckNotCircular;
begin
  if FListLink.Active and FListLink.DataSet.IsLinkedTo(DataSource) then
    DatabaseError(SCircularDataLink);
end;

procedure TCustomDBLookupComboboxEh.CheckNotLookup;
begin
  if FLookupMode then DatabaseError(SPropDefByLookup);
  if FDataLink.DataSourceFixed then DatabaseError(SDataSourceFixed);
end;

function TCustomDBLookupComboboxEh.DefaultAlignment: TAlignment;
begin
  if FKeyTextIndependent then Result := inherited DefaultAlignment
  else Result := taLeftJustify;
end;

procedure TCustomDBLookupComboboxEh.UpdateDataFields;
 function MasterFieldNames: String;
  var i:Integer;
  begin
    Result := '';
    for i := 0 to Length(FMasterFields)-1 do
      if Result = '' then
        Result := FMasterFields[i].FieldName else
        Result := Result + ';' + FMasterFields[i].FieldName;
  end;
begin
  if FDataFieldsUpdating then Exit;
  FDataFieldsUpdating := True;
  try
    SetLength(FDataFields,0); //FDataField := nil;
    SetLength(FMasterFields,0); //FMasterField := nil;
    FMasterFieldNames := '';
    if FDataLink.DataSetActive and (FDataFieldName <> '') then
    begin
      CheckNotCircular;
      FDataFields := GetFieldsProperty(FDataLink.DataSet, Self, FDataFieldName);
      if (Length(FDataFields) = 1) and (FDataFields[0].FieldKind = fkLookup) then
        FMasterFields := GetFieldsProperty(FDataLink.DataSet, Self, FDataFields[0].KeyFields)
      else
        FMasterFields := FDataFields;
      FMasterFieldNames := MasterFieldNames;
    end;
    SetLookupMode((Length(FDataFields) = 1) and (FDataFields[0].FieldKind = fkLookup));
    if FMasterFieldNames = '' then DataLink.FieldName := FDataFieldName
    else DataLink.FieldName := FMasterFieldNames;
    UpdateReadOnly;
    UpdateKeyTextIndependent;
    UpdateButtonState;
    if not FKeyTextIndependent then
      DataLink.RecordChanged(nil);
  finally
    FDataFieldsUpdating := False;
  end;
end;

procedure TCustomDBLookupComboboxEh.UpdateListFields;
var
  DataSet: TDataSet;
  ResultField: TField;
  i: Integer;
begin
  FListActive := False;
  //FKeyField := nil;
  FListField := nil;
  FListFields.Clear;
  if FListLink.Active and (FKeyFieldName <> '') then
  begin
    CheckNotCircular;
    DataSet := FListLink.DataSet;
    FKeyFields := GetFieldsProperty(DataSet, Self, FKeyFieldName);
    try
      DataSet.GetFieldList(FListFields, FListFieldName);
    except
      DatabaseErrorFmt(SFieldNotFound, [Self.Name, FListFieldName]);
    end;
    if FLookupMode then
    begin
      ResultField := GetFieldProperty(DataSet, Self, FDataFields[0].LookupResultField);
      if FListFields.IndexOf(ResultField) < 0 then
        FListFields.Insert(0, ResultField);
      FListField := ResultField;
    end else
    begin
      if FListFields.Count = 0 then
        for i := 0 to Length(FKeyFields)-1 do FListFields.Add(FKeyFields[i]);
      if (FListFieldIndex >= 0) and (FListFieldIndex < FListFields.Count) then
        FListField := FListFields[FListFieldIndex] else
        FListField := FListFields[0];
    end;
    FListActive := True;
  end;
  UpdateReadOnly;
  UpdateKeyTextIndependent;
  UpdateButtonState;
  KeyValueChanged;
  if not FKeyTextIndependent then
    if not FListActive then
      if csDesigning in ComponentState then
        SetEditText(Name)
      else {if not DataIndepended then}
        SetEditText('')
    else if not LocateKey then
      SetEditText('');
  Invalidate;
end;

procedure TCustomDBLookupComboboxEh.DataChanged;
begin
  //if (Field = nil) or (Field = FMasterField) then
  if DataIndepended and
     (TDataSourceLinkEh(FDataLink).FDataIndependentValueAsText = True) then
  begin
    SetEditText(VarToStr(DataLink.DataIndependentValue));
    LocateStr(Text,False);
  end else
  begin
     if DataLink.DataSetActive and (Length(FMasterFields) > 0) and (FMasterFieldNames <> '')
       then  SetKeyValue(DataLink.DataSet.FieldValues[FMasterFieldNames])
       else if DataIndepended then SetKeyValue(DataLink.DataIndependentValue)
       else SetKeyValue(Null);
    if ListActive and not LocateKey then
      SetEditText('');
  end;
  Modified := False;
end;

function TCustomDBLookupComboboxEh.GetKeyFieldName: String;
begin
  if FLookupMode then Result := '' else Result := FKeyFieldName;
end;

function TCustomDBLookupComboboxEh.GetListSource: TDataSource;
begin
  if FLookupMode then Result := nil else Result := FListLink.DataSource;
end;

procedure TCustomDBLookupComboboxEh.KeyValueChanged;
begin
  FDataLink.Modified;
  Modified := True;
  if not FKeyTextIndependent then
    if ListActive and LocateKey then
        SetEditText(FListField.DisplayText)
      {else if KeyValue = Null then
        SetEditText('')}
    else if csDesigning in ComponentState then
      SetEditText(Name);
  {else if Style = csDropDownListEh then
    SetEditText('');}
  if FListVisible then
    FDataList.KeyValue := KeyValue;
  if (Style = csDropDownListEh) and HandleAllocated then SelectAll;
  if Assigned(FOnKeyValueChanged) then FOnKeyValueChanged(Self);
end;

procedure TCustomDBLookupComboboxEh.ListLinkDataChanged;
begin
end;

function TCustomDBLookupComboboxEh.ButtonEnabled: Boolean;
begin
  Result := inherited ButtonEnabled and
    (ListActive or Assigned(OnButtonClick) or Assigned(OnButtonDown));
end;

function TCustomDBLookupComboboxEh.LocateKey: Boolean;
var
  KeySave: Variant;
begin
  Result := False;
  try
    KeySave := FKeyValue;
    if not VarIsNull(FKeyValue) and FListLink.DataSet.Active and
      FListLink.DataSet.Locate(FKeyFieldName, FKeyValue, []) then
    begin
      Result := True;
      FKeyValue := KeySave;
    end;
  except
  end;
end;

procedure TCustomDBLookupComboboxEh.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
    if (FListLink <> nil) and (AComponent = ListSource) then ListSource := nil;
end;

procedure TCustomDBLookupComboboxEh.ProcessSearchStr(Str: String);
var
  S, SearchText: String;
  OldSelLenght:Integer;
begin
  if (FListField <> nil) and (FListField.FieldKind in [fkData, fkInternalCalc]) and
     (FListField.DataType in [ftString, ftWideString]) then
    if CanModify(True) then
    begin
      if (Length(Str) = 1) and (Str[1] = #8) then
      begin
        if Length(Text) = SelLength then
        begin
          SelStart := MAXINT;
          SelLength := -1;
        end else
        begin
          OldSelLenght := Abs(SelLength);
          SelStart := MAXINT;
          SelLength := -OldSelLenght-1;
        end
      end else
      begin
        SearchText := Copy(Text,1,SelStart);

        S := SearchText + Str;
        LocateStr(S, True);
      end;
    end;
end;

function TCustomDBLookupComboboxEh.LocateStr(Str: String; PartialKey: Boolean): Boolean;
var Options: TLocateOptions;
begin
  Result := False;
  if not FListActive or not CanModify(True) then Exit;
  if PartialKey then
    Options := [loCaseInsensitive, loPartialKey]
  else
    Options := [loCaseInsensitive];
  try
    Result := FListLink.DataSet.Locate(FListField.FieldName, Str, Options);
    if Result then
    begin
      SetKeyValue(FListLink.DataSet.FieldValues[FKeyFieldName]);
      SetEditText(FListField.DisplayText);
      SelStart := Length(Text);
      SelLength := Length(Str) - SelStart;
    end else
    if Style = csDropDownEh then
      SetKeyValue(Null);
  except
    { If you attempt to search for a String larger than what the field
      can hold, and exception will be raised.  Just trap it and
      reset the SearchText back to the old value. }
    if Style = csDropDownListEh then
    begin
      SetEditText(Text);
      SelStart := Length(Text);
      SelLength := Length(Text) - SelStart;
    end else
      SetKeyValue(Null);
  end;
end;

procedure TCustomDBLookupComboboxEh.SelectKeyValue(const Value: Variant);
begin
  if Length(FMasterFields) > 0 then
  begin
    if FDataLink.Edit then
      FDataLink.DataSet.FieldValues[FMasterFieldNames] := Value;
  end else
  begin
    SetKeyValue(Value);
    if FDataPosting then Exit;
    try
      UpdateData;
    except
      FDataLink.Reset;
      raise;
    end;
  end;
  if ListActive and not LocateKey then
    SetEditText('');
//  Repaint;
//  Click;
end;

procedure TCustomDBLookupComboboxEh.SetDataFieldName(const Value: String);
begin
  if FDataFieldName <> Value then
  begin
    FDataFieldName := Value;
    UpdateDataFields;
  end;
end;

procedure TCustomDBLookupComboboxEh.SetKeyFieldName(const Value: String);
begin
  CheckNotLookup;
  if FKeyFieldName <> Value then
  begin
    FKeyFieldName := Value;
    UpdateListFields;
  end;
end;

procedure TCustomDBLookupComboboxEh.SetKeyValue(const Value: Variant);
begin
  if not VarEquals(FKeyValue, Value) then
  begin
    FKeyValue := Value;
    KeyValueChanged;
  end;
end;

procedure TCustomDBLookupComboboxEh.SetListFieldName(const Value: String);
begin
  if FListFieldName <> Value then
  begin
    FListFieldName := Value;
    UpdateListFields;
  end;
end;

procedure TCustomDBLookupComboboxEh.SetListSource(Value: TDataSource);
begin
  CheckNotLookup;
  FListLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TCustomDBLookupComboboxEh.SetLookupMode(Value: Boolean);
begin
  if FLookupMode <> Value then
    if Value then
    begin
      FMasterFields := GetFieldsProperty(FDataFields[0].DataSet, Self, FDataFields[0].KeyFields);
      FLookupSource.DataSet := FDataFields[0].LookupDataSet;
      FKeyFieldName := FDataFields[0].LookupKeyFields;
      FLookupMode := True;
      FListLink.DataSource := FLookupSource;
    end else
    begin
      FListLink.DataSource := nil;
      FLookupMode := False;
      FKeyFieldName := '';
      FLookupSource.DataSet := nil;
      FMasterFields := FDataFields;
    end;
end;

procedure TCustomDBLookupComboboxEh.WMKillFocus(var Message: TWMKillFocus);
begin
  if FListVisible and not(Message.FocusedWnd = FDataList.Handle) then
    CloseUp(False);
  inherited;
end;

procedure TCustomDBLookupComboboxEh.ListMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    CloseUp(PtInRect(FDataList.ClientRect, Point(X, Y)));
end;

procedure TCustomDBLookupComboboxEh.CloseUp(Accept: Boolean);
var
  ListValue: Variant;
begin
  if FListVisible then
  begin
    if GetCapture <> 0 then SendMessage(GetCapture, WM_CANCELMODE, 0, 0);
    //SetFocus;
    ListValue := FDataList.KeyValue;
    SetWindowPos(FDataList.Handle, 0, 0, 0, 0, 0, SWP_NOZORDER or
      SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_HIDEWINDOW);
    //FDataList.Visible := False;
    FListVisible := False;
    if FDataList.SizeGripResized then
    begin
      DropDownBox.Rows := FDataList.RowCount;
      DropDownBox.Width := FDataList.Width;
    end;
    FDataList.ListSource := nil;
    Invalidate;
    if Accept and CanModify(True) then
    begin
      SetKeyValue(ListValue); //??? SelectKeyValue(ListValue);
    end;
    if (Style = csDropDownEh) and HandleAllocated then SelectAll;
    {else if FEditTextFromDataList then
    begin
      FEditTextFromDataList := False;
      SetEditText(FEditTextOldValue);
      SelectAll;
    end};
    if Assigned(FOnCloseUp) then FOnCloseUp(Self,Accept);
  end;
end;

function AlignDropDownWindow(MasterWin,DropDownWin:TWinControl;Align:TDropDownAlign):TPoint;
var P:TPoint;
    Y:Integer;
    WorkArea: TRect;
begin
  P := MasterWin.Parent.ClientToScreen(Point(MasterWin.Left, MasterWin.Top));
  Y := P.Y + MasterWin.Height;
  SystemParametersInfo(SPI_GETWORKAREA,0,Pointer(@WorkArea),0);

  if ((Y + DropDownWin.Height > WorkArea.Bottom) and (P.Y - DropDownWin.Height >= WorkArea.Top)) or
     ((P.Y - DropDownWin.Height < WorkArea.Top) and (WorkArea.Bottom - Y < P.Y - WorkArea.Top))
    then
  begin
    if P.Y - DropDownWin.Height < WorkArea.Top then
      DropDownWin.Height := P.Y - WorkArea.Top;
    Y := P.Y - DropDownWin.Height;
    DropDownWin.Perform(cm_SetSizeGripChangePosition,Ord(sgcpToTop),0);
  end else
  begin
    if Y + DropDownWin.Height > WorkArea.Bottom then
      DropDownWin.Height := WorkArea.Bottom - Y;
    DropDownWin.Perform(cm_SetSizeGripChangePosition,Ord(sgcpToBottom),0);
  end;

  case Align of
    daRight: Dec(P.X, DropDownWin.Width - MasterWin.Width);
    daCenter: Dec(P.X, (DropDownWin.Width - MasterWin.Width) div 2);
  end;

  if (DropDownWin.Width > WorkArea.Right - WorkArea.Left) then
    DropDownWin.Width := WorkArea.Right - WorkArea.Left;
  if (P.X + DropDownWin.Width > WorkArea.Right) then
  begin
    P.X := WorkArea.Right - DropDownWin.Width;
    DropDownWin.Perform(cm_SetSizeGripChangePosition,Ord(sgcpToLeft),0);
  end
  else if P.X < 0 then
  begin
    P.X := 0;
    DropDownWin.Perform(cm_SetSizeGripChangePosition,Ord(sgcpToRight),0);
  end else if Align = daRight then
    DropDownWin.Perform(cm_SetSizeGripChangePosition,Ord(sgcpToLeft),0)
  else
    DropDownWin.Perform(cm_SetSizeGripChangePosition,Ord(sgcpToRight),0);

  Result := Point(P.X,Y);
end;

procedure TCustomDBLookupComboboxEh.DropDown;
var
  P: TPoint;
  I: Integer;
  S: String;
  ADropDownAlign: TDropDownAlign;
begin
  if not FListVisible and ListActive then
  begin
    if not FFocused then SetFocus;
    if Assigned(FOnDropDown) then FOnDropDown(Self);
    FDataList.Color := Color;
    FDataList.Font := Font;
    FDataList.ShowTitles := FDropDownBox.ShowTitles;

    if (FDropDownBox.Width = -1) then
      FDataList.ClientWidth := GetListFieldsWidth
    else if FDropDownBox.Width > 0 then
      FDataList.Width := FDropDownBox.Width
    else
      FDataList.Width := Width;
    if (FDataList.Width < Width) then
      FDataList.Width := Width;

    FDataList.ReadOnly := not CanModify(False);
    if ListLink.DataSet.IsSequenced and
       (ListLink.DataSet.RecordCount > 0) and
       (FDropDownBox.Rows > ListLink.DataSet.RecordCount) then
      FDataList.RowCount := ListLink.DataSet.RecordCount else
      FDataList.RowCount := FDropDownBox.Rows;
    FDataList.KeyField := FKeyFieldName;
    for I := 0 to ListFields.Count - 1 do
      S := S + TField(ListFields[I]).FieldName + ';';
    FDataList.ListField := S;
    FDataList.ListFieldIndex := ListFields.IndexOf(FListField);
    FDataList.ListSource := ListLink.DataSource;
    FDataList.KeyValue := KeyValue;
    FDataList.ReadOnly := not CanModify(False);
    ADropDownAlign := FDropDownBox.Align;
    { This alignment is for the ListField, not the control }
    if DBUseRightToLeftAlignment(Self, FListField) then
    begin
      if ADropDownAlign = daLeft then
        ADropDownAlign := daRight
      else if ADropDownAlign = daRight then
        ADropDownAlign := daLeft;
    end;
    {case ADropDownAlign of
      daRight: Dec(P.X, FDataList.Width - Width);
      daCenter: Dec(P.X, (FDataList.Width - Width) div 2);
    end;}
    P := AlignDropDownWindow(Self,FDataList,ADropDownAlign);

    SetWindowPos(FDataList.Handle, HWND_TOPMOST, P.X, P.Y, 0, 0,
      SWP_NOSIZE or SWP_NOACTIVATE or SWP_SHOWWINDOW);
    FDataList.SizeGrip.Visible := FDropDownBox.Sizable;
    //FDataList.Visible := True;
    FListVisible := True;
    Repaint;
    FDataList.SizeGripResized := False;
  end
  else CloseUp(False);
end;

procedure TCustomDBLookupComboboxEh.WMSetCursor(var Message: TWMSetCursor);
var
  P: TPoint;
begin
  GetCursorPos(P);
  P := ScreenToClient(P);
  if (Style = csDropDownListEh) then Windows.SetCursor(LoadCursor(0, idc_Arrow))
  else inherited;
end;

procedure TCustomDBLookupComboboxEh.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//var Handled, AutoRepeat:Boolean;
//    OnButtonClickEvent:TButtonClickEventEh;
begin
//  Handled := False;
  if (Button = mbLeft) and (Style = csDropDownListEh) and
      not PtInRect(ButtonRect,Point(X,Y)) and ButtonEnabled then
  begin
    MouseCapture := True;
    SelectAll;
    FTracking := True;
    TrackButton(X, Y);
//    OnButtonClickEvent := OnButtonClick;
//    if Assigned(OnButtonClickEvent) then
      //OnButtonClickEvent(Self,Handled);
//      OnButtonClickEvent(Self,FDownButton <> 2,AutoRepeat,Handled);
    {if not Handled then }ButtonDown(FDownButton = 2);
  end;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TCustomDBLookupComboboxEh.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  ListPos: TPoint;
  MousePos: TSmallPoint;
begin
  if FTracking then
  begin
    if FListVisible then
    begin
      ListPos := FDataList.ScreenToClient(ClientToScreen(Point(X, Y)));
      if PtInRect(FDataList.ClientRect, ListPos) then
      begin
        StopTracking;
        MousePos := PointToSmallPoint(ListPos);
        SendMessage(FDataList.Handle, WM_LBUTTONDOWN, 0, Integer(MousePos));
        Exit;
      end;
    end;
  end;
  inherited MouseMove(Shift, X, Y);
end;

procedure TCustomDBLookupComboboxEh.CMCancelMode(var Message: TCMCancelMode);
  function CheckDataListChilds:Boolean;
  var i:Integer;
  begin
    Result := False;
    if FDataList <> nil then
      for i := 0 to FDataList.ControlCount - 1 do
        if FDataList.Controls[I] = Message.Sender then
        begin
          Result := True;
          Exit;
        end;
  end;
begin
  if (Message.Sender <> Self) and
     (Message.Sender <> FDataList) and not CheckDataListChilds
{and (Message.Sender <> FEditSpeedButton)} then
    CloseUp(False);
end;

procedure TCustomDBLookupComboboxEh.InternalSetText(AText:String);
begin
  if FKeyTextIndependent then
    SetEditText(AText)
  else
  begin
    if Style = csDropDownEh then SetEditText(AText);
    LocateStr(AText,False);
  end;
end;

procedure TCustomDBLookupComboboxEh.InternalSetValue(AValue:Variant);
begin
  SetKeyValue(AValue);
end;

procedure TCustomDBLookupComboboxEh.SetEditText(Value: String);
begin
  FInternalTextSetting := True;
  try
    inherited InternalSetText(Value);
  finally
    FInternalTextSetting := False;
  end;
end;

procedure TCustomDBLookupComboboxEh.CMWantSpecialKey(var Message: TCMWantSpecialKey);
begin
  if (Message.CharCode in [VK_RETURN, VK_ESCAPE]) and FListVisible then
  begin
    //CloseUp(Message.CharCode = VK_RETURN);
    Message.Result := 1;
  end else
    inherited;
end;

type
  TDBLookupListBoxCracker = class(TDBLookupListBoxEh) end;

procedure TCustomDBLookupComboboxEh.KeyDown(var Key: Word; Shift: TShiftState);
  function MasterFieldsRequired: Boolean;
  var i:Integer;
  begin
    Result := False;
    for i := 0 to Length(FMasterFields)-1 do
      if FMasterFields[i].Required then
      begin
        Result := True;
        Exit;
      end;
  end;
begin
  inherited KeyDown(Key, Shift);
  if ListActive and ((Key = VK_UP) or (Key = VK_DOWN)) then
    {if ssAlt in Shift then
    begin
      if FListVisible then CloseUp(True) else DropDown;
      Key := 0;
    end else}
    if CanModify(True) then
      if not FListVisible then
      begin
        SelectNextValue(Key = VK_UP);
        Key := 0;
      end;
  if (Key <> 0) and FListVisible and ((Key in [VK_UP, VK_DOWN, VK_PRIOR, VK_NEXT]) or
                                     ((Key in [VK_HOME,VK_END]) and (ssCtrl in Shift)) ) then
  begin
    TDBLookupListBoxCracker(FDataList).KeyDown(Key, Shift);
    Key := 0;
  end;
  if (Key = VK_DELETE) and (Style = csDropDownListEh) then
  begin
    if (SelLength = Length(Text)) and (Length(FMasterFields) > 0) or not MasterFieldsRequired then
    begin
      SetKeyValue(Null);
      SetEditText('');
    end;
    Key := 0;
  end;
end;

procedure TCustomDBLookupComboboxEh.KeyPress(var Key: Char);
begin
  if FListVisible and (Key in [#13, #27]) then
  begin
    CloseUp(Key = #13);
    Key := #0;
  end;
  inherited KeyPress(Key);
  case Key of
    #8:
    if (Style = csDropDownListEh) then
    begin
      ProcessSearchStr(Key);
      Key := #0;
    end;
    {#13:
    begin
      Key := #0;
      FDataLink.UpdateRecord;
      SelectAll;
    end;}
    #32..#255:
    begin
      if DropDownBox.AutoDrop and not FListVisible and FListActive then DropDown;
      if (Style = csDropDownListEh) then
      begin
        ProcessSearchStr(Key);
        Key := #0;
      end;
    end;
  end;
end;

procedure TCustomDBLookupComboboxEh.DataListKeyValueChanged(Sender: TObject);
begin
end;

procedure TCustomDBLookupComboboxEh.DefaultHandler(var Message);
begin
  with TWMMouse(Message) do
    case Msg of
      WM_LBUTTONDBLCLK,WM_LBUTTONDOWN,WM_LBUTTONUP,
      WM_MBUTTONDBLCLK,WM_MBUTTONDOWN,WM_MBUTTONUP,
      WM_RBUTTONDBLCLK,WM_RBUTTONDOWN,WM_RBUTTONUP:
        if (Style = csDropDownListEh) or PtInRect(ButtonRect,Point(XPos,YPos)) then
         Exit;
    end;
  inherited DefaultHandler(Message);
end;

function TCustomDBLookupComboboxEh.GetListFieldsWidth: Integer;
var
  DC: HDC;
  SaveFont: HFont;
  Metrics: TTextMetric;
  i:Integer;
  NullSize:TSize;
begin
  DC := GetDC(0);
  try
    SaveFont := SelectObject(DC, Font.Handle);
    GetTextMetrics(DC, Metrics);
    GetTextExtentPoint32(DC, '0', 1,NullSize);
    SelectObject(DC, SaveFont);

    Result := 0;
    for i := 0 to ListFields.Count - 1 do
      Inc(Result,TField(ListFields[i]).DisplayWidth * (NullSize.cX - Metrics.tmOverhang) + Metrics.tmOverhang + 4);
  finally
    ReleaseDC(0, DC);
  end
end;

function TCustomDBLookupComboboxEh.GetVariantValue:Variant;
begin
  Result := FKeyValue;
//  if FKeyTextIndependent then inherited GetVariantValue
//  else Result := FKeyValue;
end;

function TCustomDBLookupComboboxEh.IsValidChar(InputChar: Char): Boolean;
begin
  if FListActive then Result := FListField.IsValidChar(InputChar)
  else Result := inherited IsValidChar(InputChar);
end;

procedure TCustomDBLookupComboboxEh.ActiveChanged;
begin
  inherited ActiveChanged;
  UpdateDataFields;
end;

procedure TCustomDBLookupComboboxEh.ButtonDown(IsDownButton:Boolean);
begin
  if (EditButton.Style = ebsUpDownEh) and (FDownButton<>0) then
  begin
    if EditCanModify then
    begin
      SelectNextValue(FDownButton=1);
    end;
  end else
    inherited ButtonDown(IsDownButton);
end;

procedure TCustomDBLookupComboboxEh.WMCut(var Message: TMessage);
begin
  FDataLink.Edit;
  inherited;
  if Style = csDropDownEh then LocateStr(Text,False);
end;

procedure TCustomDBLookupComboboxEh.WMPaste(var Message: TMessage);
begin
  FDataLink.Edit;
  if Style = csDropDownEh then
  begin
    inherited;
    LocateStr(Text,False);
  end else
  if Clipboard.HasFormat(CF_TEXT) then
    ProcessSearchStr(Clipboard.AsText);
end;

procedure TCustomDBLookupComboboxEh.SetStyle(const Value: TDBLookupComboboxEhStyle);
begin
  FStyle := Value;
  UpdateReadOnly;
end;

procedure TCustomDBLookupComboboxEh.SelectAll;
begin
  SendMessage(Handle, EM_SETSEL, MAXINT, 0);
end;

procedure TCustomDBLookupComboboxEh.SelectNextValue(IsPrior:Boolean);
var Delta:Integer;
begin
  if CanModify(True) and ListLink.Active then
  begin
    if not LocateKey then
      ListLink.DataSet.First
    else
    begin
      if IsPrior then Delta := -1 else Delta := 1;
      ListLink.DataSet.MoveBy(Delta);
    end;
    SetKeyValue(FListLink.DataSet.FieldValues[FKeyFieldName]);
    if FFocused then SelectAll;
  end;
end;

procedure TCustomDBLookupComboboxEh.UpdateData;
var RecheckInList:Boolean;
begin
  if FListActive and Assigned(FOnNotInList) {and Focused} then
  begin
    RecheckInList := False;
    if not FListLink.DataSet.Locate(FListField.FieldName, Text, [loCaseInsensitive]) then
    begin
      FOnNotInList(Self,Text, RecheckInList);
      if RecheckInList and FListLink.DataSet.Locate(FListField.FieldName, Text, [loCaseInsensitive]) then
        SetKeyValue(FListLink.DataSet.FieldValues[FKeyFieldName]);
    end;
  end;
  ValidateEdit;
  if PostDataEvent then Exit; 
  if DataIndepended and FListActive and not LocateKey and (Text <> '') and (Style = csDropDownEh) then
  begin
    TDataSourceLinkEh(FDataLink).FDataIndependentValueAsText := True;
    FDataLink.SetValue(Text);
  end else
  begin
    TDataSourceLinkEh(FDataLink).FDataIndependentValueAsText := False;
    FDataLink.SetValue(Value);
  end;
end;

procedure TCustomDBLookupComboboxEh.WMChar(var Message: TWMChar);
  function SpecialKey:Boolean;
  begin
    Result := (Message.CharCode = VK_DELETE) or
              ([ssCtrl,ssAlt] * KeyDataToShiftState(Message.KeyData) <> []);
  end;
var OldSelStart:Integer;
begin
  inherited;
  if (Style = csDropDownEh) and not SpecialKey and not (Message.CharCode = 0) then
    if not ((SelStart = Length(Text)) and (SelLength = 0)) or (Message.CharCode = VK_BACK) then
    begin
      OldSelStart := SelStart;
      if LocateStr(Text,False) then
      begin
        SelStart := Length(Text);
        SelLength := OldSelStart - SelStart;
      end;
    end else
      ProcessSearchStr('');
end;

procedure TCustomDBLookupComboboxEh.WMKeyDown(var Message: TWMKeyDown);
var OldSelStart:Integer;
begin
  if (Style = csDropDownEh) and (Message.CharCode = VK_DELETE) then
  begin
    FDataLink.Edit;
    inherited;
    OldSelStart := SelStart;
    if LocateStr(Text,False) then
    begin
      SelStart := Length(Text);
      SelLength := OldSelStart - SelStart;
    end;
  end
  else inherited;
end;

procedure TCustomDBLookupComboboxEh.SetDropDownBox(const Value: TDropDownBoxEh);
begin
  FDropDownBox.Assign(Value);
end;

procedure TCustomDBLookupComboboxEh.EMReplacesel(var Message: TMessage);
var OldSelStart:Integer;
    S:String;
begin
  if Style = csDropDownListEh then
    S := Copy(Text,1,SelStart) + String(PChar(Message.LParam)) + Copy(Text,SelStart+SelLength+1,Length(Text))
  else
  begin
    inherited;
    S := Text;
  end;

  OldSelStart := SelStart;
  if LocateStr(S,False) then
  begin
    SelStart := Length(Text);
    SelLength := OldSelStart - SelStart;
  end;
end;

procedure TCustomDBLookupComboboxEh.UpdateReadOnly;
begin
  SetControlReadOnly(not CanModify(False) or (Style = csDropDownListEh));
end;

procedure TCustomDBLookupComboboxEh.UpdateKeyTextIndependent;
begin
  if not FLockUpdateKeyTextIndependent then
    FKeyTextIndependent := (DataSource = nil) and (DataField = '') and
      (ListSource = nil) and (ListField = '') and (KeyField = '');
end;

procedure TCustomDBLookupComboboxEh.ClearDataProps;
begin
  FKeyTextIndependent := True;
  try
    FLockUpdateKeyTextIndependent := True;
    DataSource := nil;
    DataField := '';
    KeyField := '';
    ListField := '';
    DataSource := nil;
  finally
    FLockUpdateKeyTextIndependent := False;
    UpdateKeyTextIndependent;
  end;
end;

function TCustomDBLookupComboboxEh.GetDataLink: TDataSourceLinkEh;
begin
  Result := TDataSourceLinkEh(FDataLink);
end;

function TCustomDBLookupComboboxEh.GetDataField: TField;
begin
  if Length(FDataFields) = 0 then Result := nil
  else Result := FDataFields[0];
end;

function TCustomDBLookupComboboxEh.GetOnButtonClick: TButtonClickEventEh;
begin
  Result := inherited OnButtonClick;
end;

procedure TCustomDBLookupComboboxEh.SetOnButtonClick(const Value: TButtonClickEventEh);
begin
  if @Value <> @OnButtonClick then
  begin
    inherited OnButtonClick := Value;
    UpdateButtonState;
  end;
end;

function TCustomDBLookupComboboxEh.GetOnButtonDown: TButtonDownEventEh;
begin
  Result := inherited OnButtonDown;
end;

procedure TCustomDBLookupComboboxEh.SetOnButtonDown(const Value: TButtonDownEventEh);
begin
  if @Value <> @OnButtonDown then
  begin
    inherited OnButtonDown := Value;
    UpdateButtonState;
  end;
end;

{ TDropDownBoxEh }

procedure TDropDownBoxEh.Assign(Source: TPersistent);
begin
  if Source is TDropDownBoxEh then
  begin
    Align := TDropDownBoxEh(Source).Align;
    Rows := TDropDownBoxEh(Source).Rows;
    Width := TDropDownBoxEh(Source).Width;
    Sizable := TDropDownBoxEh(Source).Sizable;
    ShowTitles := TDropDownBoxEh(Source).ShowTitles;
  end else
    inherited Assign(Source);
end;

constructor TDropDownBoxEh.Create(DBLookupCombobox: TCustomDBLookupComboboxEh);
begin
  inherited Create;
  FDBLookupCombobox := DBLookupCombobox;
end;

end.
