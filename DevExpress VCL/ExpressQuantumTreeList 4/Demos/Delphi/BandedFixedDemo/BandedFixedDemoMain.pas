unit BandedFixedDemoMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  cxStyles, cxTL, cxMaskEdit, cxCurrencyEdit, cxMemo, cxCheckBox, Menus,
  cxLookAndFeels, ActnList, ImgList, cxInplaceContainer, cxDBTL,
  cxControls, cxTLData, ComCtrls, StdCtrls, DemoBasicMain,
  cxDBLookupComboBox, cxEdit, cxEditRepositoryItems, Grids, DBGrids, cxCalc,
  cxGraphics, cxCustomData;

type
  TBandedFixedDemoMainForm = class(TDemoBasicMainForm)
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
    miFixBand: TMenuItem;
    miColumnCustomization: TMenuItem;
    CustomisationForm1: TMenuItem;
    actCustomizationForm: TAction;
    N2: TMenuItem;
    miBandMoving: TMenuItem;
    miBandHorzSizing: TMenuItem;
    miBandVertSizing: TMenuItem;
    miBandHide: TMenuItem;
    cxEditRepository1: TcxEditRepository;
    eriTelephoneMaskEdit: TcxEditRepositoryMaskItem;
    cxEditRepository1TextItem1: TcxEditRepositoryTextItem;
    cxDBTreeListID: TcxDBTreeListColumn;
    cxDBTreeListPROJECTID: TcxDBTreeListColumn;
    cxDBTreeListProjectManagerID: TcxDBTreeListColumn;
    cxDBTreeListEmployee: TcxDBTreeListColumn;
    cxDBTreeListSUNDAY: TcxDBTreeListColumn;
    cxDBTreeListMONDAY: TcxDBTreeListColumn;
    cxDBTreeListTUESDAY: TcxDBTreeListColumn;
    cxDBTreeListWEDNESDAY: TcxDBTreeListColumn;
    cxDBTreeListTHURSDAY: TcxDBTreeListColumn;
    cxDBTreeListFRIDAY: TcxDBTreeListColumn;
    cxDBTreeListSATURDAY: TcxDBTreeListColumn;
    cxDBTreeListEmployeePhone: TcxDBTreeListColumn;
    cxDBTreeListEmployeeEmail: TcxDBTreeListColumn;
    cxDBTreeListWeekSum: TcxDBTreeListColumn;
    cxDBTreeListWeekAVG: TcxDBTreeListColumn;
    cxEditRepositoryCalcItem: TcxEditRepositoryCalcItem;
    miShowBands: TMenuItem;
    miShowHeaders: TMenuItem;
    miFixBandLeft: TMenuItem;
    miFixBandRight: TMenuItem;
    miFixBandNone: TMenuItem;
    Office111: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure LookAndFeelChange(Sender: TObject);
    procedure actCustomizationFormExecute(Sender: TObject);
    procedure miBandHorzSizingClick(Sender: TObject);
    procedure miBandVertSizingClick(Sender: TObject);
    procedure miBandMovingClick(Sender: TObject);
    procedure mnuNodeOptionsPopup(Sender: TObject);
    procedure miBandHideClick(Sender: TObject);
    procedure cxDBTreeListStylesGetContentStyle(Sender, AItem: TObject;
      ANode: TcxTreeListNode; var AStyle: TcxStyle);
    procedure cxDBTreeListEmployeeGetDisplayText(Sender: TcxTreeListColumn;
      ANode: TcxTreeListNode; var Value: String);
    procedure cxDBTreeListEmployeeGetEditProperties(
      Sender: TcxTreeListColumn; ANode: TcxTreeListNode;
      var EditProperties: TcxCustomEditProperties);
    procedure miShowBandsClick(Sender: TObject);
    procedure miShowHeadersClick(Sender: TObject);
    procedure miFixBandClick(Sender: TObject);
  private
    FHitBand: TcxTreeListBand;
  end;

var
  BandedFixedDemoMainForm: TBandedFixedDemoMainForm;

implementation

uses BandedFixedDemoData, ShellAPI, DB, Dialogs, cxListBox;

{$R *.dfm}

procedure TBandedFixedDemoMainForm.FormShow(Sender: TObject);
begin
  if cxDBTreeList.TopNode <> nil then
  begin
    cxDBTreeList.TopNode.Focused := True;
    cxDBTreeList.TopNode.MakeVisible;
  end;

{ remove/add the closing brace on this line to disable/enable the following code

  ShowMessage('WARNING: tutorial not completed. First, please apply the steps '+
              'shown in the doc file');

//}
end;

procedure TBandedFixedDemoMainForm.LookAndFeelChange(Sender: TObject);
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

procedure TBandedFixedDemoMainForm.actCustomizationFormExecute(Sender: TObject);
begin
  cxDBTreeList.Customizing.Visible := True;
end;

procedure TBandedFixedDemoMainForm.miBandHorzSizingClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  cxDBTreeList.OptionsCustomizing.BandHorzSizing := TMenuItem(Sender).Checked;
end;

procedure TBandedFixedDemoMainForm.miBandVertSizingClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  cxDBTreeList.OptionsCustomizing.BandVertSizing := TMenuItem(Sender).Checked;
end;

procedure TBandedFixedDemoMainForm.miBandMovingClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  cxDBTreeList.OptionsCustomizing.BandMoving := TMenuItem(Sender).Checked;
end;

procedure TBandedFixedDemoMainForm.mnuNodeOptionsPopup(Sender: TObject);
begin
  FHitBand := cxDBTreeList.HitTest.HitBand;
  if FHitBand = nil then
    Abort
  else
    miFixBand[Integer(FHitBand.FixedKind)].Checked := True;
end;

procedure TBandedFixedDemoMainForm.miBandHideClick(Sender: TObject);
begin
  FHitBand.Visible := False;
end;

procedure TBandedFixedDemoMainForm.cxDBTreeListStylesGetContentStyle(Sender,
  AItem: TObject; ANode: TcxTreeListNode; var AStyle: TcxStyle);
begin
  if ANode.IsGroupNode then
    AStyle := BandedFixedDemoDataDM.stlGroupNode;
end;

procedure TBandedFixedDemoMainForm.cxDBTreeListEmployeeGetDisplayText(
  Sender: TcxTreeListColumn; ANode: TcxTreeListNode; var Value: String);
var
  AProjectID: Variant;
begin
  if ANode.IsGroupNode then
  begin
    AProjectID := ANode.Values[cxDBTreeListPROJECTID.ItemIndex];
    Value := 'Project: ' + BandedFixedDemoDataDM.GetProjectNameByID(AProjectID)+
      '; Manager: ' + BandedFixedDemoDataDM.GetPersonNameByID(
      TcxTreeListDataNode(ANode).KeyValue) + ' (' + IntToStr(ANode.Count) + ' employees)' ;
  end;
end;

procedure TBandedFixedDemoMainForm.cxDBTreeListEmployeeGetEditProperties(
  Sender: TcxTreeListColumn; ANode: TcxTreeListNode;
  var EditProperties: TcxCustomEditProperties);
begin
  inherited;
  if ANode.IsGroupNode then
    EditProperties := cxEditRepository1TextItem1.Properties;
end;

procedure TBandedFixedDemoMainForm.miShowBandsClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  cxDBTreeList.OptionsView.Bands := TMenuItem(Sender).Checked;
end;

procedure TBandedFixedDemoMainForm.miShowHeadersClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  cxDBTreeList.OptionsView.Headers := TMenuItem(Sender).Checked;
end;

procedure TBandedFixedDemoMainForm.miFixBandClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := True;
  FHitBand.FixedKind := TcxTreeListBandFixedKind(TMenuItem(Sender).Tag);
end;

end.