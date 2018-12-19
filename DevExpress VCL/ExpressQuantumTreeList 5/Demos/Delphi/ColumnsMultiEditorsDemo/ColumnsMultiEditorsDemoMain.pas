unit ColumnsMultiEditorsDemoMain;

{$I ..\cxVer.inc}

interface

uses
  Windows, Messages, SysUtils, {$IFDEF DELPHI6}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, cxControls, cxLookAndFeels, ActnList,
  ImgList, Menus, ComCtrls, StdCtrls, DemoBasicMain, cxContainer, cxEdit,
  cxTextEdit, cxStyles, cxTL, cxInplaceContainer, cxTLData, cxEditRepositoryItems,
  cxDBEditRepository, cxCustomData, ColumnsMultiEditorsDemoPopup,
  cxGraphics;

type
  TColumnsMultiEditorsDemoMainForm = class(TDemoBasicMainForm)
    EditRepository: TcxEditRepository;
    EditRepositoryBlobItem: TcxEditRepositoryBlobItem;
    EditRepositoryButtonItem: TcxEditRepositoryButtonItem;
    EditRepositoryCalcItem: TcxEditRepositoryCalcItem;
    EditRepositoryCheckBoxItem: TcxEditRepositoryCheckBoxItem;
    EditRepositoryComboBoxItem: TcxEditRepositoryComboBoxItem;
    EditRepositoryCurrencyItem: TcxEditRepositoryCurrencyItem;
    EditRepositoryDateItem: TcxEditRepositoryDateItem;
    EditRepositoryHyperLinkItem: TcxEditRepositoryHyperLinkItem;
    EditRepositoryImageItem: TcxEditRepositoryImageItem;
    EditRepositoryImageComboBoxItem: TcxEditRepositoryImageComboBoxItem;
    EditRepositoryLookupComboBoxItem: TcxEditRepositoryLookupComboBoxItem;
    EditRepositoryMaskItem: TcxEditRepositoryMaskItem;
    EditRepositoryMemoItem: TcxEditRepositoryMemoItem;
    EditRepositoryMRUItem: TcxEditRepositoryMRUItem;
    EditRepositoryPopupItem: TcxEditRepositoryPopupItem;
    EditRepositoryRadioGroupItem: TcxEditRepositoryRadioGroupItem;
    EditRepositorySpinItem: TcxEditRepositorySpinItem;
    EditRepositoryTextItem: TcxEditRepositoryTextItem;
    EditRepositoryTimeItem: TcxEditRepositoryTimeItem;
    TreeList: TcxVirtualTreeList;
    clnEditorName: TcxTreeListColumn;
    clnSample: TcxTreeListColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure clnSampleGetEditProperties(Sender: TcxTreeListColumn;
      ANode: TcxTreeListNode; var EditProperties: TcxCustomEditProperties);
    procedure EditRepositoryButtonItemPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure EditRepositoryPopupItemPropertiesInitPopup(Sender: TObject);
    procedure TreeListStylesGetContentStyle(Sender: TcxCustomTreeList;
    AColumn: TcxTreeListColumn; ANode: TcxTreeListNode; var AStyle: TcxStyle);
    procedure TreeListStylesGetNodeIndentStyle(Sender: TcxCustomTreeList;
      ANode: TcxTreeListNode; ALevel: Integer; var AStyle: TcxStyle);
  private
    FPopupForm: TColumnsMultiEditorsDemoPopupForm;
  protected
    function GetNodeItemIndex(ANode: TcxTreeListNode): Integer;
    function RootCount: Integer;
  end;

  TcxEditorsCategoryType = (ectStandard, ectComboBoxes, ectBlobs, ectPopups);
  TcxEditorsType = (etBlob, etButton, etCalc, etCheckBox, etComboBox, etCurrency,
    etDate, etHyperLink, etImage, etImageComboBox, etLookupComboBox, etMask,
    etMemo, etMRU, etPopup, etRadioGroup, etSpinItem, etText, etTime);
const
  EditorsCategoryNames: array[TcxEditorsCategoryType] of string =
    ('Standard Editors', 'ComboBoxes', 'Blobs', 'Popups');

type
  TColumnsMultiEditorsDemoDataSource = class(TcxTreeListCustomDataSource)
  private
    FEditRepository: TcxEditRepository;
    FValues: array[TcxEditorsType] of Variant;
    FEditorNames: array[TcxEditorsType] of string;
    FCategories: array[TcxEditorsType] of TcxEditorsCategoryType;
    FTreeList: TcxVirtualTreeList;
    function GetEditorName(AEditorsType: TcxEditorsType): string;
    function GetEditorValue(AEditorsType: TcxEditorsType): Variant;
    procedure SetEditorValue(AEditorsType: TcxEditorsType; const AValue: Variant);
  protected
    function GetRecordCount: Integer; override;
    function GetValue(ARecordHandle: TcxDataRecordHandle;
      AItemHandle: TcxDataItemHandle): Variant; override;
    procedure SetValue(ARecordHandle: TcxDataRecordHandle;
        AItemHandle: TcxDataItemHandle; const AValue: Variant); override;
    function GetParentRecordHandle(ARecordHandle: TcxDataRecordHandle): TcxDataRecordHandle; override;
  public
    constructor Create(const ATreeList: TcxVirtualTreeList;
      const AEditRepository: TcxEditRepository);
    function RootCount: Integer;
  end;

var
  ColumnsMultiEditorsDemoMainForm: TColumnsMultiEditorsDemoMainForm;

implementation

uses ColumnsMultiEditorsDemoData, ShellAPI, cxImage, cxDropDownEdit;

{$R *.dfm}

{ TColumnsMultiEditorsDemoDataSource }
const
  ImageFileName = '..\..\' + {$IFDEF DELPHI6}'Data'{$ELSE}'Data'{$ENDIF} + '\Car.bmp';
  scxDefaultValueBlobItem = 'Please add text here...';
  scxDefaultValueButtonItem = 'Press me...';
  scxDefaultValueMemoItem = 'Robbins studied drama at UCLA where he graduated with honors in 1981. ' +
    'That same year, he formed the Actors'''+
    ' Gang, an experimental ensemble that expressed radical political observations through ' +
    'the European avant-garde form of theater.';
  scxDefaultValueMRUItem = 'What''s your favorite color?';
  scxDefaultValuePopupItem = 'Pop me up...';
  scxDefaultValueTextItem = 'Text';
  scxDefaultValueMRUItemClick = 'You''ve pressed the MRU Inplace Editor button.';

constructor TColumnsMultiEditorsDemoDataSource.Create(
  const ATreeList: TcxVirtualTreeList;
  const AEditRepository: TcxEditRepository);

  procedure FillEditorsNames;
  begin
    FEditorNames[etImage] := 'Graphic Editor';
    FEditorNames[etImageComboBox] := 'Image ComboBox Editor';
    FEditorNames[etLookupComboBox] := 'Lookup ComboBox Editor';
    FEditorNames[etMask] := 'Advanced Mask Editor';
  end;

  procedure FillEditorsValues;
  var
    AImage: TcxImage;
  begin
    FValues[etBlob] := scxDefaultValueBlobItem;
    FValues[etButton] := scxDefaultValueButtonItem;
    FValues[etCalc] := 12345;
    FValues[etCheckBox] := True;
    FValues[etComboBox] := 'Green';
    FValues[etCurrency] := 555.35;
    FValues[etDate] := Date;
    FValues[etHyperLink] := 'http://www.devexpress.com';
    AImage := TcxImage.Create(nil);
    try
      AImage.Picture.LoadFromFile(ImageFileName);
      FValues[etImage] := AImage.EditValue;
    finally
      AImage.Free;
    end;
    FValues[etImageComboBox] := 2;
    FValues[etLookupComboBox] := ColumnsMultiEditorsDemoDataDM.tblPersonsID.Value;
    FValues[etMask] := '(234)897-235';
    FValues[etMemo] := scxDefaultValueMemoItem;
    FValues[etMRU] :=  scxDefaultValueMRUItem;
    FValues[etPopup] := scxDefaultValuePopupItem;
    FValues[etRadioGroup] := 0;
    FValues[etSpinItem] := 10;
    FValues[etText] := scxDefaultValueTextItem;
    FValues[etTime] := Now;
  end;
  procedure FillEditorsCategories;
  begin
    FCategories[etBlob] := ectBlobs;
    FCategories[etButton] := ectStandard;
    FCategories[etCalc] := ectPopups;
    FCategories[etCheckBox] := ectStandard;
    FCategories[etComboBox] := ectComboBoxes;
    FCategories[etCurrency] := ectStandard;
    FCategories[etDate] := ectPopups;
    FCategories[etHyperLink] := ectStandard;
    FCategories[etImage] := ectBlobs;
    FCategories[etImageComboBox] := ectComboBoxes;
    FCategories[etLookupComboBox] := ectComboBoxes;
    FCategories[etMask] := ectStandard;
    FCategories[etMemo] := ectBlobs;
    FCategories[etMRU] := ectComboBoxes;
    FCategories[etPopup] := ectPopups;
    FCategories[etRadioGroup] := ectStandard;
    FCategories[etSpinItem] := ectStandard;
    FCategories[etText] := ectStandard;
    FCategories[etTime] := ectStandard;
  end;
begin
  FTreeList := ATreeList;
  FEditRepository := AEditRepository;
  FillEditorsNames;
  FillEditorsValues;
  FillEditorsCategories;
end;

function TColumnsMultiEditorsDemoDataSource.RootCount: Integer;
begin
  Result := Integer(High(EditorsCategoryNames)) + 1;
end;

function TColumnsMultiEditorsDemoDataSource.GetRecordCount: Integer;
begin
  Result := RootCount + Integer(High(FValues)) + 1;
end;

function TColumnsMultiEditorsDemoDataSource.GetValue(
  ARecordHandle: TcxDataRecordHandle;
  AItemHandle: TcxDataItemHandle): Variant;
var
  ARecordIndex: Integer;
begin
  ARecordIndex := Integer(ARecordHandle);
  case Integer(AItemHandle) of
    0:
      if ARecordIndex < RootCount then
        Result := EditorsCategoryNames[TcxEditorsCategoryType(ARecordIndex)]
      else
        Result := GetEditorName(TcxEditorsType(ARecordIndex - RootCount));
    1:
      if Integer(ARecordHandle) > RootCount - 1 then
        Result := GetEditorValue(TcxEditorsType(ARecordIndex - RootCount));
  end;
end;

function TColumnsMultiEditorsDemoDataSource.GetParentRecordHandle(
  ARecordHandle: TcxDataRecordHandle): TcxDataRecordHandle;
begin
  if Integer(ARecordHandle) < RootCount then
    Result := inherited GetParentRecordHandle(ARecordHandle)
  else
    Result := TcxDataRecordHandle(FCategories[
      TcxEditorsType(Integer(ARecordHandle) - RootCount)])
end;

procedure TColumnsMultiEditorsDemoDataSource.SetValue(
  ARecordHandle: TcxDataRecordHandle; AItemHandle: TcxDataItemHandle;
  const AValue: Variant);
var
  ARecordIndex: Integer;
begin
  ARecordIndex := Integer(ARecordHandle);
  if (ARecordIndex > RootCount - 1) and (Integer(AItemHandle) = 1) then
    SetEditorValue(TcxEditorsType(ARecordIndex - RootCount), AValue);
end;

function TColumnsMultiEditorsDemoDataSource.GetEditorName(
  AEditorsType: TcxEditorsType): string;
begin
  Result := FEditorNames[AEditorsType];
  if Result = '' then
  begin
    Result := FEditRepository.Items[Integer(AEditorsType)].Name;
    Result := Copy(Result, Length(FEditRepository.Name) + 1, Length(Result));
    Result := Copy(Result, 1, Pos('Item', Result) - 1) + ' Editor';
  end;
end;

function TColumnsMultiEditorsDemoDataSource.GetEditorValue(
  AEditorsType: TcxEditorsType): Variant;
begin
  Result := FValues[AEditorsType];
end;

procedure TColumnsMultiEditorsDemoDataSource.SetEditorValue(
  AEditorsType: TcxEditorsType; const AValue: Variant);
begin
  FValues[AEditorsType] := AValue;
end;

{TColumnsMultiEditorsDemoMainForm}
procedure TColumnsMultiEditorsDemoMainForm.FormCreate(Sender: TObject);
begin
  inherited;
  FPopupForm := TColumnsMultiEditorsDemoPopupForm.Create(nil);
  EditRepositoryPopupItem.Properties.PopupControl := FPopupForm.pnlPopup;
  TreeList.DataController.CustomDataSource :=
    TColumnsMultiEditorsDemoDataSource.Create(TreeList, EditRepository);
  TreeList.FullExpand;
end;

procedure TColumnsMultiEditorsDemoMainForm.FormDestroy(Sender: TObject);
begin
  FPopupForm.Free;
  TreeList.DataController.CustomDataSource.Free;
end;

procedure TColumnsMultiEditorsDemoMainForm.FormShow(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code

  ShowMessage('WARNING: tutorial not completed. First, please apply the steps '+
              'shown in the doc file');

//}
end;

procedure TColumnsMultiEditorsDemoMainForm.clnSampleGetEditProperties(
  Sender: TcxTreeListColumn; ANode: TcxTreeListNode;
  var EditProperties: TcxCustomEditProperties);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  if GetNodeItemIndex(ANode) < 0 then Exit;
  EditProperties := EditRepository.Items[GetNodeItemIndex(ANode)].Properties;
//}
end;

procedure TColumnsMultiEditorsDemoMainForm.EditRepositoryButtonItemPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  ShowMessage('Press me...');
end;

procedure TColumnsMultiEditorsDemoMainForm.EditRepositoryPopupItemPropertiesInitPopup(
  Sender: TObject);
begin
  FPopupForm.PopupEdit := TcxPopupEdit(Sender);
end;

procedure TColumnsMultiEditorsDemoMainForm.TreeListStylesGetContentStyle(Sender: TcxCustomTreeList;
    AColumn: TcxTreeListColumn; ANode: TcxTreeListNode; var AStyle: TcxStyle);
begin
  if (ANode <> nil) and (ANode.Level = 0) then
    AStyle := ColumnsMultiEditorsDemoDataDM.stlGroupNode
end;

procedure TColumnsMultiEditorsDemoMainForm.TreeListStylesGetNodeIndentStyle(
  Sender: TcxCustomTreeList; ANode: TcxTreeListNode; ALevel: Integer;
  var AStyle: TcxStyle);
begin
  AStyle := ColumnsMultiEditorsDemoDataDM.cxStyle1;
end;

function TColumnsMultiEditorsDemoMainForm.GetNodeItemIndex(ANode: TcxTreeListNode): Integer;
begin
  Result := -1;
  if ANode.Level = 0 then Exit;
  Result := Integer(TcxVirtualTreeListNode(ANode).RecordHandle) - RootCount;
end;

function TColumnsMultiEditorsDemoMainForm.RootCount: Integer;
begin
  Result := TColumnsMultiEditorsDemoDataSource(
    TreeList.DataController.CustomDataSource).RootCount;
end;


end.
