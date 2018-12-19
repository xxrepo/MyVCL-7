unit LayoutViewDemoMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxClasses, cxGridLevel, cxGrid, StdCtrls, Menus, cxMemo, cxImage, cxCurrencyEdit,
  cxHyperLinkEdit, cxTextEdit, cxEditRepositoryItems, cxLookAndFeels, cxLookAndFeelPainters,
  dxLayoutContainer, cxGridLayoutView, cxGridDBLayoutView, cxGridCustomLayoutView,
  cxContainer, cxGroupBox, dxLayoutLookAndFeels, ExtCtrls, cxButtons, DBTables,
  dxmdaset;

type
  TfrmMain = class(TForm)
    Grid: TcxGrid;
    dsCars: TDataSource;
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miView: TMenuItem;
    miAbout: TMenuItem;
    Label1: TLabel;
    EditRepository: TcxEditRepository;
    EditRepositoryImage: TcxEditRepositoryImageItem;
    EditRepositoryMemo: TcxEditRepositoryMemoItem;
    EditRepositoryHyperLink: TcxEditRepositoryHyperLinkItem;
    EditRepositoryPrice: TcxEditRepositoryCurrencyItem;
    EditRepositoryAutomatic: TcxEditRepositoryCheckBoxItem;
    miCustomize: TMenuItem;
    GridLevel1: TcxGridLevel;
    LayoutViewGroup_Root: TdxLayoutGroup;
    LayoutView: TcxGridDBLayoutView;
    LayoutViewGroup1: TdxLayoutGroup;
    LayoutViewGroup2: TdxLayoutGroup;
    LayoutViewGroup3: TdxLayoutGroup;
    LayoutViewLayoutItem1: TcxGridLayoutItem;
    LayoutViewRecId: TcxGridDBLayoutViewItem;
    LayoutViewLayoutItem2: TcxGridLayoutItem;
    LayoutViewID: TcxGridDBLayoutViewItem;
    LayoutViewLayoutItem3: TcxGridLayoutItem;
    LayoutViewTrademark: TcxGridDBLayoutViewItem;
    LayoutViewLayoutItem4: TcxGridLayoutItem;
    LayoutViewModel: TcxGridDBLayoutViewItem;
    LayoutViewLayoutItem5: TcxGridLayoutItem;
    LayoutViewHP: TcxGridDBLayoutViewItem;
    LayoutViewLayoutItem6: TcxGridLayoutItem;
    LayoutViewLiter: TcxGridDBLayoutViewItem;
    LayoutViewLayoutItem7: TcxGridLayoutItem;
    LayoutViewCyl: TcxGridDBLayoutViewItem;
    LayoutViewLayoutItem8: TcxGridLayoutItem;
    LayoutViewTransmissSpeedCount: TcxGridDBLayoutViewItem;
    LayoutViewLayoutItem9: TcxGridLayoutItem;
    LayoutViewTransmissAutomatic: TcxGridDBLayoutViewItem;
    LayoutViewLayoutItem10: TcxGridLayoutItem;
    LayoutViewMPG_City: TcxGridDBLayoutViewItem;
    LayoutViewLayoutItem11: TcxGridLayoutItem;
    LayoutViewMPG_Highway: TcxGridDBLayoutViewItem;
    LayoutViewLayoutItem12: TcxGridLayoutItem;
    LayoutViewCategory: TcxGridDBLayoutViewItem;
    LayoutViewLayoutItem13: TcxGridLayoutItem;
    LayoutViewDescription: TcxGridDBLayoutViewItem;
    LayoutViewLayoutItem14: TcxGridLayoutItem;
    LayoutViewHyperlink: TcxGridDBLayoutViewItem;
    LayoutViewLayoutItem15: TcxGridLayoutItem;
    LayoutViewPicture: TcxGridDBLayoutViewItem;
    LayoutViewLayoutItem16: TcxGridLayoutItem;
    LayoutViewPrice: TcxGridDBLayoutViewItem;
    Label2: TLabel;
    rgViewMode: TRadioGroup;
    btnCustomize: TcxButton;
    cbCenterRecords: TCheckBox;
    cbShowOnlyEntireRecords: TCheckBox;
    cbMultiSelectRecords: TCheckBox;
    LayoutViewGroup4: TdxLayoutGroup;
    LayoutViewGroup5: TdxLayoutGroup;
    LayoutViewGroup6: TdxLayoutGroup;
    LayoutViewGroup7: TdxLayoutGroup;
    LayoutViewGroup8: TdxLayoutGroup;
    LayoutViewSpaceItem1: TdxLayoutEmptySpaceItem;
    cxStyleRepository1: TcxStyleRepository;
    stValues: TcxStyle;
    stItems: TcxStyle;
    LayoutViewGroup10: TdxLayoutGroup;
    cbRecordCaptions: TCheckBox;
    cbExpandableRecords: TCheckBox;
    LayoutViewSeparatorItem1: TdxLayoutSeparatorItem;
    LayoutViewGroup9: TdxLayoutGroup;
    LayoutViewSpaceItem2: TdxLayoutEmptySpaceItem;
    LayoutViewSpaceItem3: TdxLayoutEmptySpaceItem;
    LayoutViewSpaceItem4: TdxLayoutEmptySpaceItem;
    LayoutViewSpaceItem5: TdxLayoutEmptySpaceItem;
    LayoutViewGroup11: TdxLayoutGroup;
    stHeader: TcxStyle;
    stRecordCaption: TcxStyle;
    mdCars: TdxMemData;
    mdCarsID: TAutoIncField;
    mdCarsTrademark: TStringField;
    mdCarsModel: TStringField;
    mdCarsHP: TSmallintField;
    mdCarsLiter: TFloatField;
    mdCarsCyl: TSmallintField;
    mdCarsTransmissSpeedCount: TSmallintField;
    mdCarsTransmissAutomatic: TStringField;
    mdCarsMPG_City: TSmallintField;
    mdCarsMPG_Highway: TSmallintField;
    mdCarsCategory: TStringField;
    mdCarsDescription: TMemoField;
    mdCarsHyperlink: TStringField;
    mdCarsPicture: TBlobField;
    mdCarsPrice: TFloatField;
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure miCustomizeClick(Sender: TObject);
    procedure rgViewModeClick(Sender: TObject);
    procedure cbCenterRecordsClick(Sender: TObject);
    procedure btnCustomizeClick(Sender: TObject);
    procedure cbShowOnlyEntireRecordsClick(Sender: TObject);
    procedure cbMultiSelectRecordsClick(Sender: TObject);
    procedure cbExpandableRecordsClick(Sender: TObject);
    procedure cbRecordCaptionsClick(Sender: TObject);
    procedure LayoutViewTrademarkStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  AboutDemoForm;

procedure TfrmMain.miCustomizeClick(Sender: TObject);
begin
  (Grid.ActiveView as TcxGridLayoutView).Controller.Customization := True;
end;

procedure TfrmMain.btnCustomizeClick(Sender: TObject);
begin
  LayoutView.Controller.Customization := True;
end;

procedure TfrmMain.cbCenterRecordsClick(Sender: TObject);
begin
  LayoutView.OptionsView.CenterRecords := cbCenterRecords.Checked;
end;

procedure TfrmMain.cbExpandableRecordsClick(Sender: TObject);
begin
  LayoutView.OptionsCustomize.RecordExpanding := cbExpandableRecords.Checked;
end;

procedure TfrmMain.cbMultiSelectRecordsClick(Sender: TObject);
begin
  LayoutView.OptionsSelection.MultiSelect := cbMultiSelectRecords.Checked;
end;

procedure TfrmMain.cbShowOnlyEntireRecordsClick(Sender: TObject);
begin
  LayoutView.OptionsView.ShowOnlyEntireRecords := cbShowOnlyEntireRecords.Checked;
end;

procedure TfrmMain.LayoutViewTrademarkStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
 AStyle := stHeader;
end;

procedure TfrmMain.cbRecordCaptionsClick(Sender: TObject);
begin
  LayoutView.OptionsView.RecordCaption.Visible := cbRecordCaptions.Checked;
end;

procedure TfrmMain.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TfrmMain.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.rgViewModeClick(Sender: TObject);
begin
  LayoutView.OptionsView.ViewMode := TcxGridLayoutViewViewMode(rgViewMode.ItemIndex);
end;

procedure TfrmMain.FormCreate(Sender: TObject);

  function GetDir(const AFileName: string; ALevelUp: Integer): string;
  var
    I: Integer;
  begin
    Result := AFileName;
    for I := 1 to ALevelUp do
      Result := ExtractFileDir(Result);
  end;

begin
  mdCars.LoadFromBinaryFile(GetDir(Application.ExeName, 3) + '\Data\Cars.dat');
end;

end.


