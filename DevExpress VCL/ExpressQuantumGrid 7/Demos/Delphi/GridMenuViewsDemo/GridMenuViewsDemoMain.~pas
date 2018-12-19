unit GridMenuViewsDemoMain;

{$I ..\..\cxVer.inc}

interface

uses
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, cxCustomData,
  ExtCtrls, ActnList, ImgList, Menus, ComCtrls, cxGridCustomPopupMenu,
  cxGridPopupMenu, ToolWin, cxStyles, cxGraphics,
  cxFilter, cxData, cxEdit, DB, cxDBData, cxClasses, cxDataStorage,
  cxDBLookupComboBox, cxCalendar, cxImageComboBox, cxCalc, cxBlobEdit,
  cxSpinEdit, cxLookAndFeels;

type
  TGridMenuViewsDemoMainForm = class(TForm)
    mmMain: TMainMenu;
    miAbout: TMenuItem;
    miFile: TMenuItem;
    miOptions: TMenuItem;
    miExit: TMenuItem;
    sbMain: TStatusBar;
    Grid: TcxGrid;
    tvOrders: TcxGridDBTableView;
    tvOrdersCustomerID: TcxGridDBColumn;
    tvOrdersPurchaseDate: TcxGridDBColumn;
    tvOrdersPaymentType: TcxGridDBColumn;
    tvOrdersPaymentAmount: TcxGridDBColumn;
    tvOrdersDescription: TcxGridDBColumn;
    tvOrdersQuantity: TcxGridDBColumn;
    lbDescription: TLabel;
    GridPopupMenu: TcxGridPopupMenu;
    lvOrders: TcxGridLevel;
    tvOrdersProductID: TcxGridDBColumn;
    tvOrdersPurchaseMonth: TcxGridDBColumn;
    PopupMenu: TPopupMenu;
    miDelete: TMenuItem;
    miInsert: TMenuItem;
    CustomizePopupmenus1: TMenuItem;
    miUseBuiltInPopupMenu: TMenuItem;
    miAddCopyToClipboard: TMenuItem;
    miUseCustomPopupMenu: TMenuItem;
    LookAndFeelController: TcxLookAndFeelController;
    procedure miAboutClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure miCopyToClipboardClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridMenuPopup(ASenderMenu: TComponent;
      AHitTest: TcxCustomGridHitTest; X, Y: Integer);
    procedure miDeleteClick(Sender: TObject);
    procedure miInsertClick(Sender: TObject);
    procedure miUseBuiltInPopupMenuClick(Sender: TObject);
    procedure miAddCopyToClipboardClick(Sender: TObject);
    procedure miUseCustomPopupMenuClick(Sender: TObject);
  public
    { Public declarations }
    FMenuItem: TMenuItem;
    procedure InsertMenuItem;
  end;

var
  GridMenuViewsDemoMainForm: TGridMenuViewsDemoMainForm;

implementation

{$R *.dfm}

uses
  GridMenuViewsDemoData, Clipbrd, AboutDemoForm;

procedure TGridMenuViewsDemoMainForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TGridMenuViewsDemoMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TGridMenuViewsDemoMainForm.FormShow(Sender: TObject);
begin
  if GridMenuViewsDemoDataDM.tblOrders.Active then
  begin
    tvOrders.DataController.Groups.FullCollapse;
    tvOrders.DataController.Groups.ChangeExpanding(0, False, False);
    tvOrders.DataController.GotoFirst;
  end
end;

procedure TGridMenuViewsDemoMainForm.FormCreate(Sender: TObject);
begin
  InsertMenuItem;
end;

procedure TGridMenuViewsDemoMainForm.miDeleteClick(Sender: TObject);
begin
  tvOrders.Controller.DeleteSelection;
end;

procedure TGridMenuViewsDemoMainForm.miInsertClick(Sender: TObject);
begin
  tvOrders.DataController.Insert;
end;

procedure TGridMenuViewsDemoMainForm.miCopyToClipboardClick(
  Sender: TObject);

  function GetSummaryItemIndexByColumn(ASummaryItems: TcxDataSummaryItems;
    AColumn: TcxGridColumn): Integer;
  var
    I: Integer;
  begin
    Result := -1;
    for I := 0 to ASummaryItems.Count - 1 do
      if (TcxGridDBTableSummaryItem(ASummaryItems[I]).Column = AColumn)
        and (ASummaryItems[I].Position = spFooter) then
      begin
        Result :=  I;
        Break;
      end;
  end;

  function GetFooterSummaryValue(AHitTest: TcxGridFooterCellHitTest): Variant;
  var
    ASummary: TcxDataSummary;
  begin
    ASummary := tvOrders.DataController.Summary;
    Result := ASummary.FooterSummaryValues[
      GetSummaryItemIndexByColumn(ASummary.FooterSummaryItems, AHitTest.Column)];
  end;

  function GetGroupFooterSummaryValue(
    AHitTest: TcxGridGroupFooterCellHitTest): Variant;
  var
    ASummary: TcxDataSummary;
    ARowIndex, ADataGroupIndex: Integer;
    ADataControllerGroups: TcxDataControllerGroups;
  begin
    ASummary := tvOrders.DataController.Summary;
    ADataControllerGroups := tvOrders.DataController.Groups;
    ARowIndex :=
      (AHitTest.ViewInfo as TcxGridRowFooterCellViewInfo).GridRecord.Index;
    ADataGroupIndex :=
      ADataControllerGroups.DataGroupIndexByRowIndex[ARowIndex];
    Result := ASummary.GroupSummaryValues[ ADataGroupIndex,
      GetSummaryItemIndexByColumn(ASummary.DefaultGroupSummaryItems,
      AHitTest.Column)];
  end;

var
  AHitTest: TcxCustomGridHitTest;
  AHitType: TcxGridViewHitType;
  AValue: Variant;
begin
  AHitTest := GridPopupMenu.HitTest;
  AHitType := GetHitTypeByHitCode(AHitTest.HitTestCode);
  case AHitType of
    gvhtFooterCell:
      AValue :=
        GetFooterSummaryValue(TcxGridFooterCellHitTest(AHitTest));
    gvhtGroupFooterCell:
      AValue :=
        GetGroupFooterSummaryValue(TcxGridGroupFooterCellHitTest(AHitTest));
  end;
  Clipboard.AsText := VarToStr(AValue);
  MessageDlg('Clipboard: '+ VarToStr(AValue), mtInformation, [mbOK], 0);
end;

procedure TGridMenuViewsDemoMainForm.InsertMenuItem;
var
  I: Integer;
  AMenu: TComponent;
  ABuiltInMenus: TcxGridDefaultPopupMenu;
begin
  AMenu := nil;
  ABuiltInMenus := GridPopupMenu.BuiltInPopupMenus;
  for I := 0 to ABuiltInMenus.Count - 1 do
    if ([gvhtFooter, gvhtFooterCell, gvhtGroupFooter, gvhtGroupFooterCell] *
      ABuiltInMenus[I].HitTypes) <> [] then
    begin
      AMenu := ABuiltInMenus[I].PopupMenu;
    end;
  if Assigned(AMenu) and AMenu.InheritsFrom(TPopupMenu) then
  begin
    FMenuItem := TMenuItem.Create(Self);
    FMenuItem.Caption := '-';
    TPopupMenu(AMenu).Items.Add(FMenuItem);
    
    FMenuItem := TMenuItem.Create(Self);
    with FMenuItem do
    begin
      Caption := 'Copy to clipboard';
      Hint := 'Copy the contents to clipboard';
      OnClick := miCopyToClipboardClick;
    end;  
    TPopupMenu(AMenu).Items.Add(FMenuItem);
  end;
end;

procedure TGridMenuViewsDemoMainForm.GridMenuPopup(
  ASenderMenu: TComponent; AHitTest: TcxCustomGridHitTest; X, Y: Integer);
begin
  PopupMenu.Popup(X, Y);
end;

procedure TGridMenuViewsDemoMainForm.miUseBuiltInPopupMenuClick(
  Sender: TObject);
begin
  with Sender as TMenuItem do
    Checked := not Checked;
  GridPopupMenu.UseBuiltInPopupMenus := (Sender as TMenuItem).Checked;
  if GridPopupMenu.UseBuiltInPopupMenus then
  begin
    InsertMenuItem;
    miAddCopyToClipboard.Enabled := True;
    miAddCopyToClipboard.Checked := True;
  end
  else
    miAddCopyToClipboard.Enabled := False;
end;

procedure TGridMenuViewsDemoMainForm.miAddCopyToClipboardClick(
  Sender: TObject);
begin
  with Sender as TMenuItem do
    Checked := not Checked;
  if GridPopupMenu.UseBuiltInPopupMenus then
    FMenuItem.Visible := (Sender as TMenuItem).Checked;
end;

procedure TGridMenuViewsDemoMainForm.miUseCustomPopupMenuClick(
  Sender: TObject);
begin
  with Sender as TMenuItem do
    Checked := not Checked;
  if (Sender as TMenuItem).Checked then
  begin
    GridPopupMenu[0].OnPopup := GridMenuPopup;
    GridPopupMenu[0].PopupMenu := PopupMenu;
  end
  else
  begin
    GridPopupMenu[0].OnPopup := nil;
    GridPopupMenu[0].PopupMenu := nil;
  end;
end;

end.  
