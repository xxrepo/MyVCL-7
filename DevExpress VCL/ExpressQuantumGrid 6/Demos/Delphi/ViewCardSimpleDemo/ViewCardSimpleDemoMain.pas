unit ViewCardSimpleDemoMain;

interface

uses
  Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs, cxControls,
  cxLookupGrid, cxLookupDBGrid, cxGridCustomTableView, cxGridLevel, cxGridCustomView,
  cxGrid, cxGridCardView, cxGridDBCardView, cxMaskEdit, StdCtrls, ExtCtrls, cxContainer,
  cxEdit, cxTextEdit, cxDropDownEdit, cxDBEdit, cxStyles, ViewCardSimpleDemoData, Menus,
  ActnList, ImgList, ComCtrls, cxLookAndFeels, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDBData, cxClasses, cxGridTableView, cxGridDBTableView,
  DB, cxDataStorage, cxHyperLinkEdit;

type
  TViewCardSimpleDemoMainForm = class(TForm)
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miOptions: TMenuItem;
    miInvertSelect: TMenuItem;
    miCellSelect: TMenuItem;
    miAbout: TMenuItem;
    sbMain: TStatusBar;
    miMultiSelect: TMenuItem;
    miHideFocusRect: TMenuItem;
    pnDepartments: TPanel;
    pnDepartmentsCaption: TPanel;
    cxGridDepartments: TcxGrid;
    cxGridDepartmentsDBTableView: TcxGridDBTableView;
    cxGridDepartmentsDBTableViewNAME: TcxGridDBColumn;
    cxGridDepartmentsLevel: TcxGridLevel;
    pnUsers: TPanel;
    cxGridUsers: TcxGrid;
    cxGridUsersDBCardView: TcxGridDBCardView;
    cxGridUsersDBCardViewFNAME: TcxGridDBCardViewRow;
    cxGridUsersDBCardViewMNAME: TcxGridDBCardViewRow;
    cxGridUsersDBCardViewLNAME: TcxGridDBCardViewRow;
    cxGridUsersDBCardViewCOUNTRY: TcxGridDBCardViewRow;
    cxGridUsersDBCardViewPOSTALCODE: TcxGridDBCardViewRow;
    cxGridUsersDBCardViewCITY: TcxGridDBCardViewRow;
    cxGridUsersDBCardViewADDRESS: TcxGridDBCardViewRow;
    cxGridUsersDBCardViewPHONE: TcxGridDBCardViewRow;
    cxGridUsersDBCardViewFAX: TcxGridDBCardViewRow;
    cxGridUsersDBCardViewEMAIL: TcxGridDBCardViewRow;
    cxGridUsersDBCardViewHOMEPAGE: TcxGridDBCardViewRow;
    cxGridUsersLevel: TcxGridLevel;
    pnUsersCaption: TPanel;
    Splitter: TSplitter;
    lbDescription: TLabel;
    miShowNavigator: TMenuItem;
    LookAndFeelController: TcxLookAndFeelController;
    procedure miAboutClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miInvertSelectClick(Sender: TObject);
    procedure miCellSelectClick(Sender: TObject);
    procedure miHideFocusRectClick(Sender: TObject);
    procedure miMultiSelectClick(Sender: TObject);
    procedure miShowNavigatorClick(Sender: TObject);
  end;

var
  ViewCardSimpleDemoMainForm: TViewCardSimpleDemoMainForm;

implementation

{$R *.dfm}

uses
  AboutDemoForm;

procedure TViewCardSimpleDemoMainForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TViewCardSimpleDemoMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TViewCardSimpleDemoMainForm.miInvertSelectClick(Sender: TObject);
begin
  with cxGridUsersDBCardView.OptionsSelection do
    InvertSelect := not InvertSelect;
  (Sender as TMenuItem).Checked := cxGridUsersDBCardView.OptionsSelection.InvertSelect;
end;

procedure TViewCardSimpleDemoMainForm.miCellSelectClick(Sender: TObject);
begin
  with cxGridUsersDBCardView.OptionsSelection do
    CellSelect := not CellSelect;
  (Sender as TMenuItem).Checked := cxGridUsersDBCardView.OptionsSelection.CellSelect;
end;

procedure TViewCardSimpleDemoMainForm.miHideFocusRectClick(Sender: TObject);
begin
  with cxGridUsersDBCardView.OptionsSelection do
    HideFocusRect := not HideFocusRect;
  (Sender as TMenuItem).Checked := cxGridUsersDBCardView.OptionsSelection.HideFocusRect;
end;

procedure TViewCardSimpleDemoMainForm.miMultiSelectClick(Sender: TObject);
begin
  with cxGridUsersDBCardView.OptionsSelection do
    MultiSelect := not MultiSelect;
  (Sender as TMenuItem).Checked := cxGridUsersDBCardView.OptionsSelection.MultiSelect;
end;

procedure TViewCardSimpleDemoMainForm.miShowNavigatorClick(Sender: TObject);
begin
  with cxGridUsersDBCardView.OptionsView do
    Navigator := not Navigator;
  (Sender as TMenuItem).Checked := cxGridUsersDBCardView.OptionsView.Navigator;
end;

end.  
