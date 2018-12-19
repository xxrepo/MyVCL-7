unit ColumnsShareDemoMain;

{$I ..\..\cxVer.inc}

interface

uses
  Windows, Messages, SysUtils{$IFDEF DELPHI6}, Variants{$ENDIF}, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxLookupGrid, cxLookupDBGrid, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid,
  cxGridCardView, cxGridDBCardView, cxMaskEdit, StdCtrls, ExtCtrls,
  cxContainer, cxEdit, cxTextEdit, cxDropDownEdit, cxDBEdit, cxStyles,
  Menus, ActnList, ImgList, ComCtrls, cxLookAndFeels, DB,
  DBTables, cxCustomData, cxGraphics, cxFilter, cxData, cxDBData, cxClasses,
  cxDBEditRepository, cxGridCustomPopupMenu, cxGridPopupMenu,
  cxDBExtLookupComboBox, cxDataStorage, cxImageComboBox,
  cxDBLookupComboBox, cxHyperLinkEdit;

type
  TColumnsShareDemoMainForm = class(TForm)
    mmMain: TMainMenu;
    miAbout: TMenuItem;
    miFile: TMenuItem;
    miOptions: TMenuItem;
    miExit: TMenuItem;
    sbMain: TStatusBar;
    lbDescrip: TLabel;
    miSeparator1: TMenuItem;
    miLookFeel: TMenuItem;
    miKind: TMenuItem;
    miFlat: TMenuItem;
    miStandard: TMenuItem;
    miUltraFlat: TMenuItem;
    miNativeStyle: TMenuItem;
    Grid: TcxGrid;
    tvProjects: TcxGridDBTableView;
    tvProjectsNAME: TcxGridDBColumn;
    tvProjectsMANAGERID: TcxGridDBColumn;
    tvItems: TcxGridDBTableView;
    tvItemsNAME: TcxGridDBColumn;
    tvItemsTYPE: TcxGridDBColumn;
    tvItemsPROJECTID: TcxGridDBColumn;
    tvItemsPRIORITY: TcxGridDBColumn;
    tvItemsSTATUS: TcxGridDBColumn;
    tvItemsCREATORID: TcxGridDBColumn;
    tvItemsCREATEDDATE: TcxGridDBColumn;
    tvItemsOWNERID: TcxGridDBColumn;
    tvItemsLASTMODIFIEDDATE: TcxGridDBColumn;
    tvItemsFIXEDDATE: TcxGridDBColumn;
    tvItemsDESCRIPTION: TcxGridDBColumn;
    cvUsers: TcxGridDBCardView;
    cvUsersFNAME: TcxGridDBCardViewRow;
    cvUsersMNAME: TcxGridDBCardViewRow;
    cvUsersLNAME: TcxGridDBCardViewRow;
    cvUsersCOUNTRY: TcxGridDBCardViewRow;
    cvUsersPOSTALCODE: TcxGridDBCardViewRow;
    cvUsersCITY: TcxGridDBCardViewRow;
    cvUsersADDRESS: TcxGridDBCardViewRow;
    cvUsersPHONE: TcxGridDBCardViewRow;
    cvUsersFAX: TcxGridDBCardViewRow;
    cvUsersEMAIL: TcxGridDBCardViewRow;
    cvUsersHOMEPAGE: TcxGridDBCardViewRow;
    tvTeam: TcxGridDBTableView;
    tvTeamUSERID: TcxGridDBColumn;
    tvTeamFUNCTION: TcxGridDBColumn;
    lvItems: TcxGridLevel;
    lvProjects: TcxGridLevel;
    lvUsers: TcxGridLevel;
    cxEditRepository: TcxEditRepository;
    eriLookupComboUsers: TcxEditRepositoryLookupComboBoxItem;
    lvTeam: TcxGridLevel;
    cxGridPopupMenu1: TcxGridPopupMenu;
    miCustomizePersonsLookupCombobox: TMenuItem;
    cvUsersDepartment: TcxGridDBCardViewRow;
    cxGridViewRepository: TcxGridViewRepository;
    cxGridViewRepositoryDBTableView: TcxGridDBTableView;
    cxGridViewRepositoryDBTableViewID: TcxGridDBColumn;
    cxGridViewRepositoryDBTableViewUserName: TcxGridDBColumn;
    cxGridViewRepositoryDBTableViewCOUNTRY: TcxGridDBColumn;
    cxGridViewRepositoryDBTableViewPOSTALCODE: TcxGridDBColumn;
    cxGridViewRepositoryDBTableViewCITY: TcxGridDBColumn;
    cxGridViewRepositoryDBTableViewADDRESS: TcxGridDBColumn;
    cxGridViewRepositoryDBTableViewPHONE: TcxGridDBColumn;
    cxGridViewRepositoryDBTableViewFAX: TcxGridDBColumn;
    cxGridViewRepositoryDBTableViewEMAIL: TcxGridDBColumn;
    cxGridViewRepositoryDBTableViewHOMEPAGE: TcxGridDBColumn;
    cxGridViewRepositoryDBTableViewDepartment: TcxGridDBColumn;
    erExtLookupComboBoxItem: TcxEditRepositoryExtLookupComboBoxItem;
    miPersonEditor: TMenuItem;
    miExtLookUpEditor: TMenuItem;
    miLookupEditor: TMenuItem;
    LookAndFeelController: TcxLookAndFeelController;
    procedure miAboutClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miNativeStyleClick(Sender: TObject);
    procedure miLookAndFeelKindClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure miCustomizePersonsLookupComboboxClick(Sender: TObject);
    procedure miLookUpEditorClick(Sender: TObject);
    procedure miExtLookUpEditorClick(Sender: TObject);
  private
  end;

var
  ColumnsShareDemoMainForm: TColumnsShareDemoMainForm;

implementation

uses
  ColumnsShareDemoData, ColumnsShareDemoLookupCustomize, AboutDemoForm;

{$R *.dfm}

procedure TColumnsShareDemoMainForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TColumnsShareDemoMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TColumnsShareDemoMainForm.miNativeStyleClick(Sender: TObject);
begin
  with LookAndFeelController do
  begin
    NativeStyle := not NativeStyle;
    (Sender as TMenuItem).Checked := NativeStyle;
  end;  
end;

procedure TColumnsShareDemoMainForm.miLookAndFeelKindClick(Sender: TObject);
begin
  LookAndFeelController.Kind := TcxLookAndFeelKind(TMenuItem(Sender).MenuIndex);
  (Sender as TMenuItem).Checked := True;
end;

procedure TColumnsShareDemoMainForm.FormShow(Sender: TObject);
begin
  miCustomizePersonsLookupComboboxClick(nil);
end;

procedure TColumnsShareDemoMainForm.miLookUpEditorClick(
  Sender: TObject);
begin
  if not TMenuItem(Sender).Checked then
  begin
    tvItemsCREATORID.RepositoryItem := cxEditRepository[1];
    tvItemsOWNERID.RepositoryItem := cxEditRepository[1];
    tvProjectsMANAGERID.RepositoryItem := cxEditRepository[1];
    tvTeamUSERID.RepositoryItem := cxEditRepository[1];
    tvProjects.DataController.ClearDetails;
    TMenuItem(Sender).Checked := True;
    miCustomizePersonsLookupCombobox.Enabled := True;
  end;
end;

procedure TColumnsShareDemoMainForm.miExtLookUpEditorClick(
  Sender: TObject);
begin
  if not TMenuItem(Sender).Checked then
  begin
    tvItemsCREATORID.RepositoryItem := cxEditRepository[0];
    tvItemsOWNERID.RepositoryItem := cxEditRepository[0];
    tvProjectsMANAGERID.RepositoryItem := cxEditRepository[0];
    tvTeamUSERID.RepositoryItem := cxEditRepository[0];
    tvProjects.DataController.ClearDetails;
    TMenuItem(Sender).Checked := True;
    if (ColumnsShareDemoLookupCustomizeForm <> nil) and
      ColumnsShareDemoLookupCustomizeForm.Showing then
      ColumnsShareDemoLookupCustomizeForm.Hide;  
    miCustomizePersonsLookupCombobox.Enabled := False;
  end;
end;

procedure TColumnsShareDemoMainForm.miCustomizePersonsLookupComboboxClick(
  Sender: TObject);
begin
  if not Assigned(ColumnsShareDemoLookupCustomizeForm) then
    ColumnsShareDemoLookupCustomizeForm :=
      TColumnsShareDemoLookupCustomizeForm.Create(Self);
  ColumnsShareDemoLookupCustomizeForm.Show;
end;

end.
