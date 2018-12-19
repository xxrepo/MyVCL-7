unit ViewCardDemoMain;

interface

uses
  Windows, Forms, Messages, SysUtils, Classes, ActnList, ImgList, Controls, Menus,
  StdCtrls, cxButtons, cxCheckBox, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxSpinEdit, ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridCardView, cxGridDBCardView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ComCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, DB, cxDBData, cxDataStorage, cxLookAndFeelPainters,
  cxLookAndFeels, cxHyperLinkEdit, cxImageComboBox, cxDBLookupComboBox,
  cxMemo;

type
  TViewCardDemoMainForm = class(TForm)
    mmMain: TMainMenu;
    miAbout: TMenuItem;
    miFile: TMenuItem;
    miOptions: TMenuItem;
    miExit: TMenuItem;
    sbMain: TStatusBar;
    lbDescrip: TLabel;
    lvPersons: TcxGridLevel;
    cxGrid: TcxGrid;
    cvPersons: TcxGridDBCardView;
    cvPersonsID: TcxGridDBCardViewRow;
    cvPersonsFIRSTNAME: TcxGridDBCardViewRow;
    cvPersonsSECONDNAME: TcxGridDBCardViewRow;
    cvPersonsGENDER: TcxGridDBCardViewRow;
    cvPersonsBIRTHNAME: TcxGridDBCardViewRow;
    cvPersonsDATEOFBIRTH: TcxGridDBCardViewRow;
    cvPersonsBIRTHCOUNTRY: TcxGridDBCardViewRow;
    cvPersonsLOCATIONOFBIRTH: TcxGridDBCardViewRow;
    cvPersonsBIOGRAPHY: TcxGridDBCardViewRow;
    cvPersonsNICKNAME: TcxGridDBCardViewRow;
    cvPersonsFullname: TcxGridDBCardViewRow;
    LookAndFeelController: TcxLookAndFeelController;
    cvPersonsHOMEPAGE: TcxGridDBCardViewRow;
    miShowEmptyRows: TMenuItem;
    miFiltering: TMenuItem;
    miExpandingCollapsing: TMenuItem;
    N1: TMenuItem;
    miRowsCustomization: TMenuItem;
    procedure miAboutClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miShowEmptyRowsClick(Sender: TObject);
    procedure miFilteringClick(Sender: TObject);
    procedure miExpandingCollapsingClick(Sender: TObject);
    procedure miRowsCustomizationClick(Sender: TObject);
  end;

var
  ViewCardDemoMainForm: TViewCardDemoMainForm;

implementation

{$R *.dfm}

uses
  ViewCardDemoData, Dialogs, AboutDemoForm;

procedure TViewCardDemoMainForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TViewCardDemoMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TViewCardDemoMainForm.miShowEmptyRowsClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  cvPersons.OptionsView.EmptyRows := TMenuItem(Sender).Checked;
end;

procedure TViewCardDemoMainForm.miFilteringClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  cvPersons.OptionsCustomize.RowFiltering := TMenuItem(Sender).Checked;
end;

procedure TViewCardDemoMainForm.miExpandingCollapsingClick(
  Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  cvPersons.OptionsCustomize.CardExpanding := TMenuItem(Sender).Checked;
end;

procedure TViewCardDemoMainForm.miRowsCustomizationClick(Sender: TObject);
begin
  cvPersons.Controller.Customization := True;
end;

end.
