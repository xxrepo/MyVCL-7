unit ColumnsShareDemoLookupCustomize;

{$I ..\..\cxVer.inc}

interface

uses
  Windows, Messages, SysUtils{$IFDEF DELPHI6}, Variants{$ENDIF}, Classes, Graphics, Controls, Forms,
  Dialogs, cxSpinEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxControls,
  cxContainer, cxEdit, cxCheckBox, StdCtrls, cxButtons, cxDBLookupComboBox,
  ComCtrls, cxLookAndFeelPainters, cxListBox;

type
  TColumnsShareDemoLookupCustomizeForm = class(TForm)
    lbDescr: TLabel;
    btnClose: TcxButton;
    PageControl1: TPageControl;
    tsLookupListFields: TTabSheet;
    tsLookupProperties: TTabSheet;
    lbDescription: TLabel;
    Label3: TLabel;
    btnAdd: TcxButton;
    btnDelete: TcxButton;
    chbHeaders: TcxCheckBox;
    chbIncrementalFilltering: TcxCheckBox;
    chbImmediateDropDown: TcxCheckBox;
    chbDropDownAutoSize: TcxCheckBox;
    seListFieldIndex: TcxSpinEdit;
    Label5: TLabel;
    seDropDownRows: TcxSpinEdit;
    Label4: TLabel;
    cbDropDownListStyle: TcxComboBox;
    Label2: TLabel;
    lbUnlinkedColumns: TcxListBox;
    lbListColumns: TcxListBox;
    Label1: TLabel;
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure lbUnlinkedColumnsKeyPress(Sender: TObject; var Key: Char);
    procedure lbListColumnsKeyPress(Sender: TObject; var Key: Char);
    procedure chbDropDownAutoSizeClick(Sender: TObject);
    procedure chbImmediateDropDownClick(Sender: TObject);
    procedure chbIncrementalFillteringClick(Sender: TObject);
    procedure chbHeadersClick(Sender: TObject);
    procedure cbDropDownListStylePropertiesChange(Sender: TObject);
    procedure seDropDownRowsPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure seListFieldIndexPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FEditProperty: TcxLookupComboBoxProperties;
    procedure CancelEditing;
    procedure CustomizeListBoxes;
    procedure CustomizeParams;
    procedure lbDeleteSelection(AListBox: TcxListBox);
    procedure lbMoveItem(ASourceListBox, ADestinationListBox: TcxListBox);
  public
    { Public declarations }
  end;

var
  ColumnsShareDemoLookupCustomizeForm: TColumnsShareDemoLookupCustomizeForm;

implementation

uses
  ColumnsShareDemoMain, cxLookupGrid, cxLookupDBGrid, cxGridDBCardView,
  ColumnsShareDemoData, DB, cxGridCustomView, cxGridCustomTableView;

{$R *.dfm}

procedure TColumnsShareDemoLookupCustomizeForm.CustomizeListBoxes;
var
  I,AIndex: Integer;
begin
  lbUnlinkedColumns.Clear;
  lbListColumns.Clear;
  with ColumnsShareDemoMainDM.tblUsers do
    for I := 0 to FieldCount - 1 do
      lbUnlinkedColumns.Items.Add(Fields[I].FieldName);
  with ColumnsShareDemoMainForm.eriLookupComboUsers.Properties do
    for I := 0 to ListColumns.Count - 1 do
    begin
      AIndex := lbUnlinkedColumns.Items.IndexOf(ListColumns[I].FieldName);
      if AIndex <> -1 then
      begin
        lbUnlinkedColumns.ItemIndex := AIndex;
        lbMoveItem(lbUnlinkedColumns, lbListColumns);
      end;
    end;
  if lbListColumns.Items.Count <> 0 then lbListColumns.ItemIndex := 0;
  if lbUnlinkedColumns.Items.Count <> 0 then lbUnlinkedColumns.ItemIndex := 0;
end;

procedure TColumnsShareDemoLookupCustomizeForm.CustomizeParams;
begin
  with ColumnsShareDemoMainForm.eriLookupComboUsers.Properties do
  begin
    chbDropDownAutoSize.Checked := DropDownAutoSize;
    chbImmediateDropDown.Checked := ImmediateDropDown;
    chbIncrementalFilltering.Checked := IncrementalFiltering;
    cbDropDownListStyle.ItemIndex := Integer(DropDownListStyle);
    seDropDownRows.Value := {$IFDEF CLR}Variant{$ENDIF}(DropDownRows);
    seListFieldIndex.Value := ListFieldIndex;
    chbHeaders.Checked := ListOptions.ShowHeader;
  end;
end;

procedure TColumnsShareDemoLookupCustomizeForm.btnAddClick(
  Sender: TObject);
begin
  CancelEditing;
  FEditProperty.BeginUpdate;
  with FEditProperty.ListColumns.Add do
    FieldName := lbUnlinkedColumns.Items[lbUnlinkedColumns.ItemIndex];
  FEditProperty.EndUpdate;
  lbMoveItem(lbUnlinkedColumns, lbListColumns);
  if lbUnlinkedColumns.Items.Count = 0 then
    btnAdd.Enabled := False;
  btnDelete.Enabled := True;
  seListFieldIndex.Properties.MaxValue := lbListColumns.Items.Count - 1
end;

procedure TColumnsShareDemoLookupCustomizeForm.lbDeleteSelection(
  AListBox: TcxListBox);
var
  AIndex: Integer;
begin
  AIndex := AListBox.ItemIndex;
  if AIndex = AListBox.Items.Count - 1 then dec(AIndex);
  AListBox.Items.Delete(AListBox.ItemIndex);
  if AListBox.Items.Count <> 0 then
    AListBox.ItemIndex := AIndex;
end;

procedure TColumnsShareDemoLookupCustomizeForm.lbMoveItem(ASourceListBox,
  ADestinationListBox: TcxListBox);
begin
  ADestinationListBox.Items.Add(ASourceListBox.Items[ASourceListBox.ItemIndex]);
  lbDeleteSelection(ASourceListBox);
  if ADestinationListBox.Items.Count = 1 then
    ADestinationListBox.ItemIndex := 0;
end;

procedure TColumnsShareDemoLookupCustomizeForm.btnDeleteClick(
  Sender: TObject);
begin
  CancelEditing;
  FEditProperty.BeginUpdate;
  FEditProperty.ListColumns.Items[lbListColumns.ItemIndex].Free;
  FEditProperty.EndUpdate;
  lbMoveItem(lbListColumns, lbUnlinkedColumns);
  if lbListColumns.Items.Count = 0 then
    btnDelete.Enabled := False;
  btnAdd.Enabled := True;
  seListFieldIndex.Properties.MaxValue := lbListColumns.Items.Count - 1
end;

procedure TColumnsShareDemoLookupCustomizeForm.lbUnlinkedColumnsKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then btnAddClick(nil);
end;

procedure TColumnsShareDemoLookupCustomizeForm.lbListColumnsKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then btnDeleteClick(nil);
end;

procedure TColumnsShareDemoLookupCustomizeForm.chbDropDownAutoSizeClick(
  Sender: TObject);
begin
  CancelEditing;
  FEditProperty.DropDownAutoSize := chbDropDownAutoSize.Checked;
end;

procedure TColumnsShareDemoLookupCustomizeForm.chbImmediateDropDownClick(
  Sender: TObject);
begin
  CancelEditing;
  FEditProperty.ImmediateDropDown := chbImmediateDropDown.Checked;
end;

procedure TColumnsShareDemoLookupCustomizeForm.chbIncrementalFillteringClick(
  Sender: TObject);
begin
  CancelEditing;
  FEditProperty.IncrementalFiltering := chbIncrementalFilltering.Checked;
end;

procedure TColumnsShareDemoLookupCustomizeForm.chbHeadersClick(
  Sender: TObject);
begin
  CancelEditing;
  FEditProperty.ListOptions.ShowHeader := chbHeaders.Checked;
end;

procedure TColumnsShareDemoLookupCustomizeForm.cbDropDownListStylePropertiesChange(
  Sender: TObject);
begin
  CancelEditing;
  FEditProperty.DropDownListStyle :=
    TcxEditDropDownListStyle(cbDropDownListStyle.ItemIndex);
end;

procedure TColumnsShareDemoLookupCustomizeForm.seDropDownRowsPropertiesChange(
  Sender: TObject);
begin
  CancelEditing;
  FEditProperty.DropDownRows := seDropDownRows.Value;
end;

procedure TColumnsShareDemoLookupCustomizeForm.FormCreate(Sender: TObject);
var
  AView: TcxCustomGridView;
  AController: TcxCustomGridTableController;
begin
  FEditProperty := ColumnsShareDemoMainForm.eriLookupComboUsers.Properties;
  CustomizeListBoxes;
  CustomizeParams;
  AView := ColumnsShareDemoMainForm.Grid.FocusedView;
  AController := TcxCustomGridTableController(AView.Controller);
  if AController.IsEditing then
    AController.EditingController.HideEdit(False);
  tsLookupProperties.Enabled := True;
  btnAdd.Enabled := lbUnlinkedColumns.Items.Count <> 0;
  btnDelete.Enabled := lbListColumns.Items.Count <> 0;
end;

procedure TColumnsShareDemoLookupCustomizeForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TColumnsShareDemoLookupCustomizeForm.FormDestroy(
  Sender: TObject);
begin
  ColumnsShareDemoLookupCustomizeForm := nil;
end;

procedure TColumnsShareDemoLookupCustomizeForm.CancelEditing;
var
  AView: TcxCustomGridView;
  AController: TcxCustomGridTableController;
begin
  AView := ColumnsShareDemoMainForm.Grid.FocusedView;
  AController := TcxCustomGridTableController(AView.Controller);
  if AController.IsEditing then
    AController.EditingController.HideEdit(False);
end;

procedure TColumnsShareDemoLookupCustomizeForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TColumnsShareDemoLookupCustomizeForm.seListFieldIndexPropertiesChange(
  Sender: TObject);
begin
  CancelEditing;
  FEditProperty.ListFieldIndex := seListFieldIndex.Value;
end;

end.
