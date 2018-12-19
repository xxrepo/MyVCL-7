unit BandedDemoMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  cxStyles, cxTL, cxMaskEdit, cxCurrencyEdit, cxMemo, cxCheckBox, Menus,
  cxLookAndFeels, ActnList, ImgList, cxInplaceContainer, cxDBTL,
  cxControls, cxTLData, ComCtrls, StdCtrls, DemoBasicMain,
  cxDBLookupComboBox, cxEdit, cxEditRepositoryItems, Grids, DBGrids,
  cxGraphics, cxCustomData;

type
  TBandedDemoMainForm = class(TDemoBasicMainForm)
    miAddBand: TMenuItem;
    miRemoveBands: TMenuItem;
    miSeparator1: TMenuItem;
    miGridLookFeel: TMenuItem;
    miKind: TMenuItem;
    miFlat: TMenuItem;
    miStandard: TMenuItem;
    miUltraFlat: TMenuItem;
    miNativeStyle: TMenuItem;
    miSeparator2: TMenuItem;
    cxDBTreeList: TcxDBTreeList;
    mnuNodeOptions: TPopupMenu;
    miBandDelete: TMenuItem;
    N1: TMenuItem;
    miColumnCustomization: TMenuItem;
    cxDBTreeListID: TcxDBTreeListColumn;
    cxDBTreeListPARENTID: TcxDBTreeListColumn;
    cxDBTreeListNAME: TcxDBTreeListColumn;
    cxDBTreeListBUDGET: TcxDBTreeListColumn;
    cxDBTreeListPHONE: TcxDBTreeListColumn;
    cxDBTreeListFAX: TcxDBTreeListColumn;
    cxDBTreeListVACANCY: TcxDBTreeListColumn;
    cxDBTreeListManager: TcxDBTreeListColumn;
    cxDBTreeListManagerPhone: TcxDBTreeListColumn;
    cxDBTreeListManagerEmail: TcxDBTreeListColumn;
    miCustomisationForm: TMenuItem;
    actCustomizationForm: TAction;
    N2: TMenuItem;
    miBandMoving: TMenuItem;
    miBandHorzSizing: TMenuItem;
    miBandVertSizing: TMenuItem;
    miBandHide: TMenuItem;
    cxEditRepository1: TcxEditRepository;
    eriTelephoneMaskEdit: TcxEditRepositoryMaskItem;
    Office111: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure LookAndFeelChange(Sender: TObject);
    procedure miAddBandClick(Sender: TObject);
    procedure miRemoveBandsClick(Sender: TObject);
    procedure actCustomizationFormExecute(Sender: TObject);
    procedure miBandHorzSizingClick(Sender: TObject);
    procedure miBandVertSizingClick(Sender: TObject);
    procedure miBandMovingClick(Sender: TObject);
    procedure mnuNodeOptionsPopup(Sender: TObject);
    procedure miBandDeleteClick(Sender: TObject);
    procedure miBandHideClick(Sender: TObject);
    procedure cxDBTreeListInitInsertingRecord(Sender: TObject;
      AFocusedNode: TcxTreeListDataNode; var AHandled: Boolean);
    procedure cxDBTreeListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
    FHitBand: TcxTreeListBand;
    function GetBandByCaption(ABandCaption: string): TcxTreeListBand;
  public
    function GetFocusedNodeParentValue: Variant;
  end;

var
  BandedDemoMainForm: TBandedDemoMainForm;

implementation

uses BandedDemoData, ShellAPI, DB, Dialogs, cxListBox, BandedDemoBands;

{$R *.dfm}

procedure TBandedDemoMainForm.FormShow(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  cxDBTreeList.FullExpand;
  cxDBTreeListNAME.ApplyBestFit;

//}

{ remove/add the closing brace on this line to disable/enable the following code

  ShowMessage('WARNING: tutorial not completed. First, please apply the steps '+
              'shown in the doc file');

//}
end;

procedure TBandedDemoMainForm.LookAndFeelChange(Sender: TObject);
begin
  if TMenuItem(Sender).Tag > 3 then
  begin
    cxLookAndFeelController.NativeStyle :=
      not cxLookAndFeelController.NativeStyle;
    TMenuItem(Sender).Checked := cxLookAndFeelController.NativeStyle;
  end
  else
  begin
    TMenuItem(Sender).Checked := True;
    cxLookAndFeelController.Kind := TcxLookAndFeelKind(TMenuItem(Sender).Tag);
    cxLookAndFeelController.NativeStyle := False;
    miNativeStyle.Checked := False;
  end;
end;

procedure TBandedDemoMainForm.miAddBandClick(Sender: TObject);
var
  ABandCaption: string;
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  if InputQuery('Create band', 'Specify a caption of the band', ABandCaption) then
    if GetBandByCaption(ABandCaption) <> nil then
       MessageDlg('Band with this caption already exists', mtWarning, [mbOK], 0)
    else
      with cxDBTreeList.Bands.Add do
      begin
        Caption.Text := ABandCaption;
        Caption.AlignHorz := taCenter;
      end;

//}
end;

procedure TBandedDemoMainForm.miRemoveBandsClick(Sender: TObject);
  procedure HideCoulmns;
  var
    J: Integer;
  begin
    for J := 0 to cxDBTreeList.ColumnCount - 1 do
      if (cxDBTreeList.Columns[J].OwnerBand = nil) and cxDBTreeList.Columns[j].Visible then
        cxDBTreeList.Columns[j].Visible := False;
  end;
  procedure AddBands(AStringList: TStrings);
  var
    I: Integer;
  begin
    for I := 0 to cxDBTreeList.Bands.Count - 1 do
      AStringList.AddObject(cxDBTreeList.Bands[I].Caption.Text,
        cxDBTreeList.Bands[I]);
  end;

  procedure RemoveBands(AListBox: TcxListBox);
  var
    I: Integer;
  begin
    for I := 0 to AListBox.Items.Count - 1 do
      if AListBox.Selected[I] then
        TcxTreeListBand(AListBox.Items.Objects[I]).Free;
    HideCoulmns;
  end;
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  with TBandedDemoBandsForm.Create(nil) do
    try
      lbBands.Items.Clear;
      AddBands(lbBands.Items);
      if ShowModal = mrOK then
        RemoveBands(lbBands);
    finally
      Free;
    end;

//}
end;

procedure TBandedDemoMainForm.actCustomizationFormExecute(Sender: TObject);
begin
  cxDBTreeList.Customizing.Visible := True;
end;

function TBandedDemoMainForm.GetBandByCaption(
  ABandCaption: string): TcxTreeListBand;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to cxDBTreeList.Bands.Count - 1 do
    if cxDBTreeList.Bands[I].Caption.Text = ABandCaption then
    begin
      Result := cxDBTreeList.Bands[I];
      Break;
    end;
end;

procedure TBandedDemoMainForm.miBandHorzSizingClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  cxDBTreeList.OptionsCustomizing.BandHorzSizing := TMenuItem(Sender).Checked;
end;

procedure TBandedDemoMainForm.miBandVertSizingClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  cxDBTreeList.OptionsCustomizing.BandVertSizing := TMenuItem(Sender).Checked;
end;

procedure TBandedDemoMainForm.miBandMovingClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  cxDBTreeList.OptionsCustomizing.BandMoving := TMenuItem(Sender).Checked;
end;

procedure TBandedDemoMainForm.mnuNodeOptionsPopup(Sender: TObject);
begin
  FHitBand := cxDBTreeList.HitTest.HitBand;
  if FHitBand = nil then
    Abort;
end;

procedure TBandedDemoMainForm.miBandDeleteClick(Sender: TObject);
begin
  FHitBand.Free;
end;

procedure TBandedDemoMainForm.miBandHideClick(Sender: TObject);
begin
  FHitBand.Visible := False;
end;

function TBandedDemoMainForm.GetFocusedNodeParentValue: Variant;
begin
  Result := TcxTreeListDataNode(cxDBTreeList.FocusedNode).ParentValue;
end;

procedure TBandedDemoMainForm.cxDBTreeListInitInsertingRecord(
  Sender: TObject; AFocusedNode: TcxTreeListDataNode;
  var AHandled: Boolean);
begin
  if AFocusedNode <> nil then
    BandedDemoDataDM.SetParentValue(AFocusedNode.ParentValue);
end;

procedure TBandedDemoMainForm.cxDBTreeListDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  //
end;

end.
