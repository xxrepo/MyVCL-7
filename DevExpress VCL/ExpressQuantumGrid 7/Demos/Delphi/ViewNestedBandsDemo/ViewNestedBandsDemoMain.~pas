unit ViewNestedBandsDemoMain;

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
  cxLookAndFeels, cxGridBandedTableView, cxGridDBBandedTableView,
  cxCalendar;

type
  TViewNestedBandsDemoMainForm = class(TForm)
    mmMain: TMainMenu;
    miAbout: TMenuItem;
    miFile: TMenuItem;
    miOptions: TMenuItem;
    miExit: TMenuItem;
    sbMain: TStatusBar;
    Grid: TcxGrid;
    lbDescription: TLabel;
    LookAndFeelController: TcxLookAndFeelController;
    lvOrders: TcxGridLevel;
    bvOrders: TcxGridDBBandedTableView;
    clnCustomerID: TcxGridDBBandedColumn;
    clnOrdersProductID: TcxGridDBBandedColumn;
    clnPurchaseDate: TcxGridDBBandedColumn;
    clnPaymentType: TcxGridDBBandedColumn;
    clnQuantity: TcxGridDBBandedColumn;
    clnPaymentAmount: TcxGridDBBandedColumn;
    clnCustomerCompany: TcxGridDBBandedColumn;
    clnCustomerAddres: TcxGridDBBandedColumn;
    clnCustomerFax: TcxGridDBBandedColumn;
    clnCustomerPhone: TcxGridDBBandedColumn;
    clnCustomerOccupation: TcxGridDBBandedColumn;
    clnCustomerZipCode: TcxGridDBBandedColumn;
    clnCarCyl: TcxGridDBBandedColumn;
    clnCarHP: TcxGridDBBandedColumn;
    clnCarLiter: TcxGridDBBandedColumn;
    clnCarMPG_City: TcxGridDBBandedColumn;
    clnCarMPG_Highway: TcxGridDBBandedColumn;
    clnCarTransMissAuto: TcxGridDBBandedColumn;
    clnCarTransmissSpeedCount: TcxGridDBBandedColumn;
    miNestedBands: TMenuItem;
    N1: TMenuItem;
    miBandsQuickCustomization: TMenuItem;
    miColumnsQuickCustomization: TMenuItem;
    N2: TMenuItem;
    miCellMerging: TMenuItem;
    procedure miAboutClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miNestedBandsClick(Sender: TObject);
    procedure miBandsQuickCustomizationClick(Sender: TObject);
    procedure miColumnsQuickCustomizationClick(Sender: TObject);
    procedure miCellMergingClick(Sender: TObject);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  private
    FNestedBands: TList;
    procedure AddNestedBandInfo(ABand: TcxGridBand);
    procedure AdjustCellMerging(AUseCelMerging: Boolean);
    procedure AdjustNestedBands(AUseNestedBands: Boolean);
    procedure ChangeBandVisibility(AIndex: Integer; AVisible: Boolean);
    procedure HideNestedBands;
    procedure ReleaseNestedBandInfos;
    procedure ShowNestedBands;
  end;

var
  ViewNestedBandsDemoMainForm: TViewNestedBandsDemoMainForm;

implementation

uses
  AboutDemoForm, ViewNestedBandsDemoData;

{$R *.dfm}

type
  TcxNestedBandInfo = class
  private
    FBand, FParentBand: TcxGridBand;
    FColumnIndex: Integer;
    FCaption: TCaption;
  public
    constructor Create(ABand: TcxGridBand);
    procedure RestoreBand;
    property Band: TcxGridBand read FBand;
    property Caption: TCaption read FCaption;
    property ColumnIndex: Integer read FColumnIndex;
    property ParentBand: TcxGridBand read FParentBand;
  end;

constructor TcxNestedBandInfo.Create(ABand: TcxGridBand);
begin
  inherited Create;
  FBand := ABand;
  FParentBand := ABand.Bands[ABand.Position.BandIndex];
  FCaption := ABand.Caption;
  FColumnIndex := ABand.Position.ColIndex;
end;

procedure TcxNestedBandInfo.RestoreBand;
begin
  FBand.Caption := FCaption;
  FBand.Position.BandIndex := FParentBand.Index;
  FBand.Position.ColIndex := FColumnIndex;
end;

procedure TViewNestedBandsDemoMainForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TViewNestedBandsDemoMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

constructor TViewNestedBandsDemoMainForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FNestedBands := TList.Create;
end;

destructor TViewNestedBandsDemoMainForm.Destroy;
begin
  inherited Destroy;
  ReleaseNestedBandInfos;
  FNestedBands.Free;
end;

procedure TViewNestedBandsDemoMainForm.AddNestedBandInfo(ABand: TcxGridBand);
begin
  FNestedBands.Add(TcxNestedBandInfo.Create(ABand));
end;

procedure TViewNestedBandsDemoMainForm.AdjustCellMerging(AUseCelMerging: Boolean);
begin
  bvOrders.BeginUpdate;
  try
    clnCustomerID.Options.CellMerging := AUseCelMerging;
    clnOrdersProductID.Options.CellMerging := AUseCelMerging;
    clnPurchaseDate.Options.CellMerging := AUseCelMerging;
    clnPaymentType.Options.CellMerging := AUseCelMerging;
    clnCustomerCompany.Options.CellMerging := AUseCelMerging;
    clnCustomerAddres.Options.CellMerging := AUseCelMerging;
    clnCustomerFax.Options.CellMerging := AUseCelMerging;
    clnCustomerPhone.Options.CellMerging := AUseCelMerging;
    clnCustomerOccupation.Options.CellMerging := AUseCelMerging;
    clnCustomerZipCode.Options.CellMerging := AUseCelMerging;
    clnCarCyl.Options.CellMerging := AUseCelMerging;
    clnCarHP.Options.CellMerging := AUseCelMerging;
    clnCarLiter.Options.CellMerging := AUseCelMerging;
    clnCarMPG_City.Options.CellMerging := AUseCelMerging;
    clnCarMPG_Highway.Options.CellMerging := AUseCelMerging;
    clnCarTransMissAuto.Options.CellMerging := AUseCelMerging;
    clnCarTransmissSpeedCount.Options.CellMerging := AUseCelMerging;
  finally
    bvOrders.EndUpdate;
  end;
end;

procedure TViewNestedBandsDemoMainForm.AdjustNestedBands(AUseNestedBands: Boolean);
begin
  if AUseNestedBands then
    ShowNestedBands
  else
    HideNestedBands;
end;

procedure TViewNestedBandsDemoMainForm.ChangeBandVisibility(AIndex: Integer;
  AVisible: Boolean);
begin
  bvOrders.Bands[AIndex].Visible := AVisible;
end;

procedure TViewNestedBandsDemoMainForm.HideNestedBands;
var
  I: Integer;
begin
  ReleaseNestedBandInfos;
  bvOrders.BeginUpdate;
  try
    for I := 0 to bvOrders.Bands.Count - 1 do
      if bvOrders.Bands[I].Position.BandIndex <> -1 then
      begin
        AddNestedBandInfo(bvOrders.Bands[I]);
        ChangeBandVisibility(bvOrders.Bands[I].Position.BandIndex, False);
        bvOrders.Bands[I].Caption :=
          bvOrders.Bands[bvOrders.Bands[I].Position.BandIndex].Caption + '''s ' +
            bvOrders.Bands[I].Caption;
        bvOrders.Bands[I].Position.BandIndex := -1;
      end
   finally
     bvOrders.EndUpdate;
   end;
end;

procedure TViewNestedBandsDemoMainForm.ReleaseNestedBandInfos;
var
  I: Integer;
begin
  for I := 0 to FNestedBands.Count - 1 do
    if TObject(FNestedBands[I]) is TcxNestedBandInfo then
      TcxNestedBandInfo(FNestedBands[I]).Free;
  FNestedBands.Clear;
end;

procedure TViewNestedBandsDemoMainForm.ShowNestedBands;
var
  I: Integer;
begin
  bvOrders.BeginUpdate;
  try
    for I := 0 to FNestedBands.Count - 1 do
      if TObject(FNestedBands[I]) is TcxNestedBandInfo then
      begin
        TcxNestedBandInfo(FNestedBands[I]).RestoreBand;
        ChangeBandVisibility(TcxNestedBandInfo(FNestedBands[I]).ParentBand.Index, True);
      end;
    ReleaseNestedBandInfos;
  finally
    bvOrders.EndUpdate;
  end;
end;

procedure TViewNestedBandsDemoMainForm.miNestedBandsClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  AdjustNestedBands(TMenuItem(Sender).Checked);
  bvOrders.OptionsCustomize.NestedBands := TMenuItem(Sender).Checked;
end;

procedure TViewNestedBandsDemoMainForm.miBandsQuickCustomizationClick(
  Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  bvOrders.OptionsCustomize.BandsQuickCustomization := TMenuItem(Sender).Checked;
end;

procedure TViewNestedBandsDemoMainForm.miColumnsQuickCustomizationClick(
  Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  bvOrders.OptionsCustomize.ColumnsQuickCustomization := TMenuItem(Sender).Checked;
end;

procedure TViewNestedBandsDemoMainForm.miCellMergingClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  AdjustCellMerging(TMenuItem(Sender).Checked);
end;

end.
