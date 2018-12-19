unit CardLayoutDemoMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridCardView, cxGridDBCardView, cxClasses, cxGridLevel, cxGrid, StdCtrls,
  Menus, DBTables, cxMemo, cxImage, cxCurrencyEdit, cxHyperLinkEdit, cxTextEdit,
  cxEditRepositoryItems;

type
  TfrmMain = class(TForm)
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
    cvHorizontal: TcxGridDBCardView;
    GridLevel2: TcxGridLevel;
    cvVertical: TcxGridDBCardView;
    dbMain: TDatabase;
    dsCars: TDataSource;
    tblCars: TTable;
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miView: TMenuItem;
    miAbout: TMenuItem;
    Label1: TLabel;
    cvHorizontalTrademark: TcxGridDBCardViewRow;
    cvHorizontalModel: TcxGridDBCardViewRow;
    cvHorizontalHP: TcxGridDBCardViewRow;
    cvHorizontalLiter: TcxGridDBCardViewRow;
    cvHorizontalCyl: TcxGridDBCardViewRow;
    cvHorizontalTransmissSpeedCount: TcxGridDBCardViewRow;
    cvHorizontalTransmissAutomatic: TcxGridDBCardViewRow;
    cvHorizontalMPG_City: TcxGridDBCardViewRow;
    cvHorizontalMPG_Highway: TcxGridDBCardViewRow;
    cvHorizontalCategory: TcxGridDBCardViewRow;
    cvHorizontalDescription: TcxGridDBCardViewRow;
    cvHorizontalHyperlink: TcxGridDBCardViewRow;
    cvHorizontalPicture: TcxGridDBCardViewRow;
    cvHorizontalPrice: TcxGridDBCardViewRow;
    cvHorizontalRow1: TcxGridDBCardViewRow;
    StyleRepository: TcxStyleRepository;
    styleSelection: TcxStyle;
    styleCardHeader: TcxStyle;
    styleCardBorder: TcxStyle;
    styleBackground: TcxStyle;
    styleCategoryRow: TcxStyle;
    cvHorizontalRow2: TcxGridDBCardViewRow;
    stylePrice: TcxStyle;
    cvHorizontalRow3: TcxGridDBCardViewRow;
    cvHorizontalRow4: TcxGridDBCardViewRow;
    tblCarsID: TAutoIncField;
    tblCarsTrademark: TStringField;
    tblCarsModel: TStringField;
    tblCarsHP: TSmallintField;
    tblCarsLiter: TFloatField;
    tblCarsCyl: TSmallintField;
    tblCarsTransmissSpeedCount: TSmallintField;
    tblCarsTransmissAutomatic: TStringField;
    tblCarsMPG_City: TSmallintField;
    tblCarsMPG_Highway: TSmallintField;
    tblCarsCategory: TStringField;
    tblCarsDescription: TMemoField;
    tblCarsHyperlink: TStringField;
    tblCarsPicture: TBlobField;
    tblCarsPrice: TFloatField;
    tblCarsFuelEconomy: TStringField;
    cvVerticalTrademark: TcxGridDBCardViewRow;
    cvVerticalModel: TcxGridDBCardViewRow;
    cvVerticalHP: TcxGridDBCardViewRow;
    cvVerticalLiter: TcxGridDBCardViewRow;
    cvVerticalCyl: TcxGridDBCardViewRow;
    cvVerticalTransmissSpeedCount: TcxGridDBCardViewRow;
    cvVerticalTransmissAutomatic: TcxGridDBCardViewRow;
    cvVerticalMPG_City: TcxGridDBCardViewRow;
    cvVerticalMPG_Highway: TcxGridDBCardViewRow;
    cvVerticalCategory: TcxGridDBCardViewRow;
    cvVerticalDescription: TcxGridDBCardViewRow;
    cvVerticalHyperlink: TcxGridDBCardViewRow;
    cvVerticalPicture: TcxGridDBCardViewRow;
    cvVerticalPrice: TcxGridDBCardViewRow;
    cvVerticalFuelEconomy: TcxGridDBCardViewRow;
    CardsStyleSheet: TcxGridCardViewStyleSheet;
    EditRepository: TcxEditRepository;
    EditRepositoryImage: TcxEditRepositoryImageItem;
    EditRepositoryMemo: TcxEditRepositoryMemoItem;
    EditRepositoryHyperLink: TcxEditRepositoryHyperLinkItem;
    EditRepositoryPrice: TcxEditRepositoryCurrencyItem;
    cvVerticalRow1: TcxGridDBCardViewRow;
    cvVerticalRow2: TcxGridDBCardViewRow;
    EditRepositoryFuelEconomy: TcxEditRepositoryTextItem;
    cvVerticalRow3: TcxGridDBCardViewRow;
    EditRepositoryAutomatic: TcxEditRepositoryCheckBoxItem;
    miCardAutoWidth: TMenuItem;
    miCustomize: TMenuItem;
    miCellSelection: TMenuItem;
    N1: TMenuItem;
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure tblCarsCalcFields(DataSet: TDataSet);
    procedure miCardAutoWidthClick(Sender: TObject);
    procedure miCellSelectionClick(Sender: TObject);
    procedure miCustomizeClick(Sender: TObject);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure UpdateMenuValues;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  AboutDemoForm;

procedure TfrmMain.UpdateMenuValues;
begin
  with Grid.ActiveView as TcxGridCardView do
  begin
    miCardAutoWidth.Checked := OptionsView.CardAutoWidth;
    miCellSelection.Checked := OptionsSelection.CellSelect;
  end;
end;

procedure TfrmMain.miCardAutoWidthClick(Sender: TObject);
begin
  with (Grid.ActiveView as TcxGridCardView).OptionsView do
    CardAutoWidth := not CardAutoWidth;
  UpdateMenuValues;
end;

procedure TfrmMain.miCellSelectionClick(Sender: TObject);
begin
  with (Grid.ActiveView as TcxGridCardView).OptionsSelection do
    CellSelect := not CellSelect;
  UpdateMenuValues;
end;

procedure TfrmMain.miCustomizeClick(Sender: TObject);
begin
  (Grid.ActiveView as TcxGridCardView).Controller.Customization := True;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  UpdateMenuValues;
end;

procedure TfrmMain.GridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  UpdateMenuValues;
end;

procedure TfrmMain.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TfrmMain.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.tblCarsCalcFields(DataSet: TDataSet);
begin
  tblCarsFuelEconomy.AsString :=
    tblCarsMPG_City.AsString + '/' + tblCarsMPG_Highway.AsString;
end;

end.
