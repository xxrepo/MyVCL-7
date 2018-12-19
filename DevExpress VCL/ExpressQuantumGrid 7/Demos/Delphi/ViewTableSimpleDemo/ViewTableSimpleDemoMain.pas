unit ViewTableSimpleDemoMain;

interface

uses
  {$IFDEF CLR}
  System.ComponentModel,
  {$ENDIF}
  Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  cxGridLevel, cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, Grids, DBGrids, cxStyles, Menus, ActnList,
  ImgList, cxLookAndFeels, ComCtrls, cxCustomData, cxGraphics, cxFilter,
  cxData, cxEdit, DB, cxDBData, cxClasses, cxDataStorage, cxImage,
  cxTextEdit, cxMemo, cxCheckBox, cxBlobEdit, cxHyperLinkEdit,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter;

type
  TViewTableSimpleDemoMainForm = class(TForm)
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miOptions: TMenuItem;
    miAbout: TMenuItem;
    miShowNavigator: TMenuItem;
    pnGenres: TPanel;
    pnGenresCaption: TPanel;
    cxgGenras: TcxGrid;
    cxgGenrasDBTableView: TcxGridDBTableView;
    cxgGenrasDBTableViewNAME: TcxGridDBColumn;
    cxgGenrasLevel: TcxGridLevel;
    Splitter: TSplitter;
    pnFilms: TPanel;
    pnFilmsCaption: TPanel;
    cxgFilms: TcxGrid;
    cxgFilmsDBTableView: TcxGridDBTableView;
    cxgFilmsDBTableViewICON: TcxGridDBColumn;
    cxgFilmsDBTableViewCAPTION: TcxGridDBColumn;
    cxgFilmsDBTableViewYEAR: TcxGridDBColumn;
    cxgFilmsDBTableViewTAGLINE: TcxGridDBColumn;
    cxgFilmsDBTableViewPLOTOUTLINE: TcxGridDBColumn;
    cxgFilmsDBTableViewRUNTIME: TcxGridDBColumn;
    cxgFilmsDBTableViewCOLOR: TcxGridDBColumn;
    cxgFilmsDBTableViewPHOTO: TcxGridDBColumn;
    cxgFilmsDBTableViewWEBSITE: TcxGridDBColumn;
    cxgFilmsLevel: TcxGridLevel;
    lbDescription: TLabel;
    miShowIndicator: TMenuItem;
    miShowPreviewRow: TMenuItem;
    miFocusCellOnTab: TMenuItem;
    miImmediateEditor: TMenuItem;
    miIncSearch: TMenuItem;
    miSeparator5: TMenuItem;
    sbMain: TStatusBar;
    miMultiSelect: TMenuItem;
    LookAndFeelController: TcxLookAndFeelController;
    procedure miAboutClick(Sender: TObject);
    procedure miShowIndicatorClick(Sender: TObject);
    procedure miShowPreviewRowClick(Sender: TObject);
    procedure miFocusCellOnTabClick(Sender: TObject);
    procedure miIncSearchClick(Sender: TObject);
    procedure miImmediateEditorClick(Sender: TObject);
    procedure miMultiSelectClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miShowNavigatorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure FocusRomanceCategory;
  end;

var
  ViewTableSimpleDemoMainForm: TViewTableSimpleDemoMainForm;

implementation

{$R *.dfm}

uses
{$IFDEF CLR}
  Variants,
{$ENDIF}
  ViewTableSimpleDemoData, AboutDemoForm;

procedure TViewTableSimpleDemoMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TViewTableSimpleDemoMainForm.FocusRomanceCategory;
var
  I: Integer;
begin
  for I:=0 to cxgGenrasDBTableView.ViewInfo.RecordsViewInfo.Count - 1 do
    if cxgGenrasDBTableView.ViewData.Records[i].Values[0] = 'Romance' then
    begin
      cxgGenrasDBTableView.ViewData.Records[i].Focused := True;
      Exit;
    end;
end;

procedure TViewTableSimpleDemoMainForm.FormShow(Sender: TObject);
begin
  cxgFilms.FocusedView.DataController.Groups.FullExpand;
  FocusRomanceCategory;
end;

procedure TViewTableSimpleDemoMainForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TViewTableSimpleDemoMainForm.miShowIndicatorClick(Sender: TObject);
begin
  with cxgFilmsDBTableView.OptionsView do
    Indicator := not Indicator;
  (Sender as TMenuItem).Checked := cxgFilmsDBTableView.OptionsView.Indicator;
end;

procedure TViewTableSimpleDemoMainForm.miShowPreviewRowClick(Sender: TObject);
begin
  with cxgFilmsDBTableViewTAGLINE do
    IsPreview := not IsPreview;
  (Sender as TMenuItem).Checked := cxgFilmsDBTableViewTAGLINE.IsPreview;
end;

procedure TViewTableSimpleDemoMainForm.miFocusCellOnTabClick(Sender: TObject);
begin
  with cxgFilmsDBTableView.OptionsBehavior do
    FocusCellOnTab := not FocusCellOnTab;
  (Sender as TMenuItem).Checked := cxgFilmsDBTableView.OptionsBehavior.FocusCellOnTab;
end;

procedure TViewTableSimpleDemoMainForm.miIncSearchClick(Sender: TObject);
begin
  with cxgFilmsDBTableView.OptionsBehavior do
    IncSearch := not IncSearch;
  (Sender as TMenuItem).Checked := cxgFilmsDBTableView.OptionsBehavior.IncSearch;
end;

procedure TViewTableSimpleDemoMainForm.miImmediateEditorClick(Sender: TObject);
begin
  with cxgFilmsDBTableView.OptionsBehavior do
    ImmediateEditor := not ImmediateEditor;
  (Sender as TMenuItem).Checked := cxgFilmsDBTableView.OptionsBehavior.ImmediateEditor;
end;

procedure TViewTableSimpleDemoMainForm.miMultiSelectClick(Sender: TObject);
begin
  with cxgFilmsDBTableView.OptionsSelection do
    MultiSelect := not MultiSelect;
  (Sender as TMenuItem).Checked := cxgFilmsDBTableView.OptionsSelection.MultiSelect;
end;

procedure TViewTableSimpleDemoMainForm.miShowNavigatorClick(Sender: TObject);
begin
  with cxgFilmsDBTableView.Navigator do
    Visible := not Visible;
  (Sender as TMenuItem).Checked := cxgFilmsDBTableView.Navigator.Visible;
end;

end.
