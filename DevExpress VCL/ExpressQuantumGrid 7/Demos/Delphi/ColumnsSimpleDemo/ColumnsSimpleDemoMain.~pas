unit ColumnsSimpleDemoMain;

{$I ..\..\cxVer.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, cxCustomData,
  ExtCtrls, ActnList, ImgList, Menus, ComCtrls, cxGridCustomPopupMenu,
  cxGridPopupMenu, Grids, DBGrids,
  cxDBData, cxStyles, cxGraphics, cxFilter, cxData, cxEdit, DB, cxClasses,
  cxDataStorage, cxMRUEdit, cxButtonEdit, cxDropDownEdit, cxCheckBox,
  cxMaskEdit, cxDBLookupComboBox, cxTimeEdit, cxImageComboBox, cxSpinEdit,
  cxCalc, cxBlobEdit, cxImage, cxRadioGroup, cxMemo, cxHyperLinkEdit,
  cxLookAndFeels;

type
  TColumnsSimpleDemoMainForm = class(TForm)
    mmMain: TMainMenu;
    miAbout: TMenuItem;
    miFile: TMenuItem;
    miOptions: TMenuItem;
    miExit: TMenuItem;
    miLookFeel: TMenuItem;
    miKind: TMenuItem;
    miFlat: TMenuItem;
    miStandard: TMenuItem;
    miUltraFlat: TMenuItem;
    miNativeStyle: TMenuItem;
    Grid: TcxGrid;
    lvCustomers: TcxGridLevel;
    lvOrders: TcxGridLevel;
    lbDescription: TLabel;
    tvCustomers: TcxGridDBTableView;
    tvCustomersFirstName: TcxGridDBColumn;
    tvCustomersLastName: TcxGridDBColumn;
    tvCustomersCompany: TcxGridDBColumn;
    tvCustomersPrefix: TcxGridDBColumn;
    tvCustomersAddress: TcxGridDBColumn;
    tvCustomersCity: TcxGridDBColumn;
    tvCustomersState: TcxGridDBColumn;
    tvCustomersZipCode: TcxGridDBColumn;
    tvCustomersCustomer: TcxGridDBColumn;
    tvCustomersFaxPhone: TcxGridDBColumn;
    tvOrders: TcxGridDBTableView;
    tvOrdersProductID: TcxGridDBColumn;
    tvOrdersPurchaseDate: TcxGridDBColumn;
    tvOrdersTime: TcxGridDBColumn;
    tvOrdersPaymentType: TcxGridDBColumn;
    tvOrdersDescription: TcxGridDBColumn;
    tvOrdersQuantity: TcxGridDBColumn;
    tvOrdersPaymentAmount: TcxGridDBColumn;
    tvOrdersCarInfo: TcxGridDBColumn;
    N1: TMenuItem;
    miShowEditButtons: TMenuItem;
    miEditButtonsNever: TMenuItem;
    miEditButtonsForFocusedRecord: TMenuItem;
    miEditButtonsAlways: TMenuItem;
    miOptionsSelection: TMenuItem;
    miCellSelect: TMenuItem;
    miHideFocusRect: TMenuItem;
    miHideSelection: TMenuItem;
    miInvertSelect: TMenuItem;
    miMultiSelect: TMenuItem;
    LookAndFeelController: TcxLookAndFeelController;
    procedure miAboutClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miNativeStyleClick(Sender: TObject);
    procedure miLookAndFeelKindClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tvCustomersStatePropertiesButtonClick(Sender: TObject);
    procedure tvCustomersCityPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure tvOrdersCarInfoPropertiesInitPopup(Sender: TObject);
    procedure tvOrdersCarInfoPropertiesCloseUp(Sender: TObject);
    procedure GridFocusedViewChanged(Sender: TcxCustomGrid;
      APrevFocusedView, AFocusedView: TcxCustomGridView);
    procedure miEditButtonsClick(Sender: TObject);
    procedure miCellSelectClick(Sender: TObject);
    procedure miHideFocusRectClick(Sender: TObject);
    procedure miHideSelectionClick(Sender: TObject);
    procedure miInvertSelectClick(Sender: TObject);
    procedure miMultiSelectClick(Sender: TObject);
    procedure tvCustomersCompanyGetCellHint(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; ACellViewInfo: TcxGridTableDataCellViewInfo;
      const AMousePos: TPoint; var AHintText: TCaption;
      var AIsHintMultiLine: Boolean; var AHintTextRect: TRect);
  private
    function GetView: TcxGridTableView;
    procedure UpdateMenu;
  public
    property View: TcxGridTableView read GetView;
  end;

var
  ColumnsSimpleDemoMainForm: TColumnsSimpleDemoMainForm;

implementation

uses
{$IFDEF CLR}
  Variants,
{$ENDIF}
  ShellAPI, ColumnsSimpleDemoData, ColumnsSimpleDemoCities,
  ColumnsSimpleDemoCars, AboutDemoForm;

{$R *.dfm}

function TColumnsSimpleDemoMainForm.GetView: TcxGridTableView;
begin
  Result := TcxGridTableView(Grid.FocusedView);
end;

procedure TColumnsSimpleDemoMainForm.UpdateMenu;
begin
  miShowEditButtons[Ord(View.OptionsView.ShowEditButtons)].Checked := True;

  miCellSelect.Checked := View.OptionsSelection.CellSelect;
  miHideFocusRect.Checked := View.OptionsSelection.HideFocusRect;
  miHideSelection.Checked := View.OptionsSelection.HideSelection;
  miInvertSelect.Checked := View.OptionsSelection.InvertSelect;
  miMultiSelect.Checked := View.OptionsSelection.MultiSelect;

  miNativeStyle.Checked := LookAndFeelController.NativeStyle;
  miKind[Ord(LookAndFeelController.Kind)].Checked := True;
end;

procedure TColumnsSimpleDemoMainForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TColumnsSimpleDemoMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TColumnsSimpleDemoMainForm.miNativeStyleClick(Sender: TObject);
begin
  with LookAndFeelController do
    NativeStyle := not NativeStyle;
  UpdateMenu;
end;

procedure TColumnsSimpleDemoMainForm.miLookAndFeelKindClick(Sender: TObject);
begin
  LookAndFeelController.Kind := TcxLookAndFeelKind(TMenuItem(Sender).MenuIndex);
  UpdateMenu;
end;

procedure TColumnsSimpleDemoMainForm.FormShow(Sender: TObject);
begin
  if tvCustomers.Controller.FocusedRecord <> nil then
    tvCustomers.Controller.FocusedRecord.Expanded := True;
end;

procedure TColumnsSimpleDemoMainForm.tvCustomersStatePropertiesButtonClick(Sender: TObject);
begin
  MessageDlg('Button click event handler', mtInformation, [mbOK], 0);
end;

procedure TColumnsSimpleDemoMainForm.tvCustomersCityPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  case AButtonIndex of
    0: if ColumnsSimpleDemoCitiesForm.ShowModal = mrOk then
       begin
         ColumnsSimpleDemoDataDM.tblCustomers.Edit;
         ColumnsSimpleDemoDataDM.tblCustomersCity.Value :=
           {$IFDEF CLR}VarToStr{$ENDIF}(ColumnsSimpleDemoCitiesForm.Value);
       end;
    1:
     {$IFNDEF CLR}
       ShellExecute(Handle, PChar('OPEN'), PChar('http://www.usacitiesonline.com/'), nil, nil, SW_SHOWMAXIMIZED);
     {$ELSE}
       ShellExecute(Handle, 'OPEN', 'http://www.usacitiesonline.com/', '', nil, SW_SHOWMAXIMIZED);
     {$ENDIF}
  end;
end;

procedure TColumnsSimpleDemoMainForm.tvCustomersCompanyGetCellHint(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  ACellViewInfo: TcxGridTableDataCellViewInfo; const AMousePos: TPoint;
  var AHintText: TCaption; var AIsHintMultiLine: Boolean;
  var AHintTextRect: TRect);
begin
  AHintText := ARecord.DisplayTexts[tvCustomersAddress.Index] + #13 +
    ARecord.DisplayTexts[tvCustomersCity.Index] + ', ' + ARecord.DisplayTexts[tvCustomersState.Index] + ' ' +
    ARecord.DisplayTexts[tvCustomersZipCode.Index] + #13 +
    ARecord.DisplayTexts[tvCustomersFaxPhone.Index];
  AHintTextRect.Top := ACellViewInfo.Bounds.Bottom + 3;  
end;

procedure TColumnsSimpleDemoMainForm.tvOrdersCarInfoPropertiesInitPopup(Sender: TObject);
begin
  ColumnSimpleDemoCarsForm.bvCars.DataController.LocateByKey(
    ColumnsSimpleDemoDataDM.tblOrdersProductID.AsInteger);
end;

procedure TColumnsSimpleDemoMainForm.tvOrdersCarInfoPropertiesCloseUp(Sender: TObject);
begin
  with ColumnsSimpleDemoDataDM do
  begin
    tblOrders.Edit;
    tblOrdersProductID.Value := tblCarsID.Value;
  end;
end;

procedure TColumnsSimpleDemoMainForm.GridFocusedViewChanged(Sender: TcxCustomGrid;
  APrevFocusedView, AFocusedView: TcxCustomGridView);
begin
  UpdateMenu;
end;

procedure TColumnsSimpleDemoMainForm.miEditButtonsClick(Sender: TObject);
begin
  View.OptionsView.ShowEditButtons := TcxGridShowEditButtons(TMenuItem(Sender).MenuIndex);
  UpdateMenu;
end;

procedure TColumnsSimpleDemoMainForm.miCellSelectClick(Sender: TObject);
begin
  with View.OptionsSelection do
    CellSelect := not CellSelect;
  UpdateMenu;
end;

procedure TColumnsSimpleDemoMainForm.miHideFocusRectClick(Sender: TObject);
begin
  with View.OptionsSelection do
    HideFocusRectOnExit := not HideFocusRectOnExit;
  UpdateMenu;
end;

procedure TColumnsSimpleDemoMainForm.miHideSelectionClick(Sender: TObject);
begin
  with View.OptionsSelection do
    HideSelection := not HideSelection;
  UpdateMenu;  
end;

procedure TColumnsSimpleDemoMainForm.miInvertSelectClick(Sender: TObject);
begin
  with View.OptionsSelection do
    InvertSelect := not InvertSelect;
  UpdateMenu;  
end;

procedure TColumnsSimpleDemoMainForm.miMultiSelectClick(Sender: TObject);
begin
  with View.OptionsSelection do
    MultiSelect := not MultiSelect;
  UpdateMenu;  
end;

end.  
