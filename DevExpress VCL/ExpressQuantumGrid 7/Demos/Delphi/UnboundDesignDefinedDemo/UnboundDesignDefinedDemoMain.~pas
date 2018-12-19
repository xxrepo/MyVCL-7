unit UnboundDesignDefinedDemoMain;

interface

uses
  Windows, Forms, Messages, SysUtils, Classes, ActnList, ImgList, Controls, Menus,
  StdCtrls, cxButtons, cxCheckBox, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxSpinEdit, ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridCardView, cxGridDBCardView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ComCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, DB, cxDBData, cxDataStorage, cxLookAndFeelPainters,
  cxLookAndFeels, cxHyperLinkEdit, cxImageComboBox, cxDBLookupComboBox,
  cxMemo, cxGridTableView, cxGridBandedTableView, cxBlobEdit, cxImage,
  cxCurrencyEdit;

type
  TUnboundDesignDefinedDemoMainForm = class(TForm)
    mmMain: TMainMenu;
    miAbout: TMenuItem;
    miFile: TMenuItem;
    miExit: TMenuItem;
    sbMain: TStatusBar;
    lbDescrip: TLabel;
    LookAndFeelController: TcxLookAndFeelController;
    lvCars: TcxGridLevel;
    cxGrid: TcxGrid;
    bvCars: TcxGridBandedTableView;
    clnCar: TcxGridBandedColumn;
    clnPrice: TcxGridBandedColumn;
    clnPicture: TcxGridBandedColumn;
    clnHP: TcxGridBandedColumn;
    clnLiter: TcxGridBandedColumn;
    clnCyl: TcxGridBandedColumn;
    clnTransmissSpeedCount: TcxGridBandedColumn;
    clnTransmissAutomatic: TcxGridBandedColumn;
    clnHyperlink: TcxGridBandedColumn;
    cxStyleRepository1: TcxStyleRepository;
    styCar: TcxStyle;
    clnTradeMark: TcxGridBandedColumn;
    styGroup: TcxStyle;
    procedure miAboutClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
  end;

var
  UnboundDesignDefinedDemoMainForm: TUnboundDesignDefinedDemoMainForm;

implementation

{$R *.dfm}

uses
  Dialogs, AboutDemoForm;

procedure TUnboundDesignDefinedDemoMainForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TUnboundDesignDefinedDemoMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

end.
