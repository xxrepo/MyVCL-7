unit IssueListMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ActnList, ToolWin,  StdActns, ComCtrls, Menus, ExtCtrls,
  IssueListGrid, DBCtrls, cxGridDBTableView, cxGridTableView,
  cxLookAndFeels;

type
  TIssueListMainForm = class(TForm)
    alMain: TActionList;
    MainMenu1: TMainMenu;
    actExit: TAction;
    actColumnsCustomize: TAction;
    miFile: TMenuItem;
    miGridView: TMenuItem;
    actExit1: TMenuItem;
    StatusBar1: TStatusBar;
    miGoProjects: TMenuItem;
    miGoUsers: TMenuItem;
    miGoTeams: TMenuItem;
    miColumnCustomization: TMenuItem;
    miGoProjectItems: TMenuItem;
    miGoDepartments: TMenuItem;
    actShowPictures: TAction;
    miGridPictures: TMenuItem;
    miFlat: TMenuItem;
    miStyleUltraFlat: TMenuItem;
    miStandard: TMenuItem;
    ControlBar1: TControlBar;
    tbView1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    tbView: TToolBar;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    actGrouping: TAction;
    miGrouping: TMenuItem;
    miNativeStyle: TMenuItem;
    miGridActions: TMenuItem;
    acIndicator: TAction;
    actSummaryFooter: TAction;
    actHeader: TAction;
    actAutoWidth: TAction;
    actInvertSelected: TAction;
    actFullExpand: TAction;
    actFullCollapse: TAction;
    actBestFit: TAction;
    actShowEditButtons: TAction;
    actAbout: TAction;
    miAbout: TMenuItem;
    miInvertSelected: TMenuItem;
    miacIndicator: TMenuItem;
    mitAutoWidth: TMenuItem;
    miBestFitallcolumns: TMenuItem;
    miAlwaysDisplayButtons: TMenuItem;
    actShowDescription: TAction;
    miShowDescription: TMenuItem;
    miHeaders: TMenuItem;
    miSummaryFooter: TMenuItem;
    miSeparator3: TMenuItem;
    miGridStyle: TMenuItem;
    ToolButton11: TToolButton;
    ToolButton7: TToolButton;
    miFullCollapse: TMenuItem;
    miFullExpand: TMenuItem;
    actGridLines: TAction;
    tbOperat: TToolBar;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton13: TToolButton;
    miView: TMenuItem;
    miSeparator2: TMenuItem;
    miShowGrid: TMenuItem;
    actAutoPreview: TAction;
    ToolButton4: TToolButton;
    miSeparator1: TMenuItem;
    miGoSchedule: TMenuItem;
    miGridOptions: TMenuItem;
    miSeparator6: TMenuItem;
    actShowDependsOnData: TAction;
    miShowDepentOnData: TMenuItem;
    actNewItemRow: TAction;
    actNewItemRow1: TMenuItem;
    actSelectStyleSheet: TAction;
    actSelectStyleSheet1: TMenuItem;
    actEditorsShadow: TAction;
    miEditorsShadow: TMenuItem;
    miSeparator8: TMenuItem;
    LookAndFeelController: TcxLookAndFeelController;
    procedure actExitExecute(Sender: TObject);
    procedure actGoProjectExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actShowPicturesExecute(Sender: TObject);
    procedure miLookAndFeelKindClick(Sender: TObject);
    procedure actGroupingExecute(Sender: TObject);
    procedure miNativeStyleClick(Sender: TObject);

    procedure acIndicatorExecute(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actShowDescriptionExecute(Sender: TObject);
    procedure actHeaderExecute(Sender: TObject);
    procedure actSummaryFooterExecute(Sender: TObject);
    procedure actAutoWidthExecute(Sender: TObject);
    procedure actInvertSelectedExecute(Sender: TObject);
    procedure acIndicatorUpdate(Sender: TObject);
    procedure actGroupingUpdate(Sender: TObject);
    procedure actSummaryFooterUpdate(Sender: TObject);
    procedure actHeaderUpdate(Sender: TObject);
    procedure actAutoWidthUpdate(Sender: TObject);
    procedure actInvertSelectedUpdate(Sender: TObject);
    procedure actFullCollapseExecute(Sender: TObject);
    procedure actFullExpandExecute(Sender: TObject);
    procedure actShowEditButtonsExecute(Sender: TObject);
    procedure actGridLinesExecute(Sender: TObject);
    procedure actShowEditButtonsUpdate(Sender: TObject);
    procedure actGridLinesUpdate(Sender: TObject);
    procedure actAutoPreviewUpdate(Sender: TObject);
    procedure actAutoPreviewExecute(Sender: TObject);
    procedure actBestFitExecute(Sender: TObject);
    procedure actColumnsCustomizeExecute(Sender: TObject);
    procedure actShowDependsOnDataExecute(Sender: TObject);
    procedure actNewItemRowExecute(Sender: TObject);
    procedure actNewItemRowUpdate(Sender: TObject);
    procedure actSelectStyleSheetExecute(Sender: TObject);
    procedure actEditorsShadowExecute(Sender: TObject);
    procedure actShowDescriptionUpdate(Sender: TObject);
  private
    FGridForm: TIssueListGridForm;
    function GetFocusedView: TcxGridTableView;
  protected
  public
    property GridForm: TIssueListGridForm read FGridForm;
    property FocusedView: TcxGridTableView read GetFocusedView;
  end;

var
  IssueListMainForm: TIssueListMainForm;

implementation

{$R *.dfm}

uses
  cxGraphics, cxGridCustomTableView,
  IssueListStyles, IssueListData, cxStyles, AboutDemoForm;

procedure TIssueListMainForm.actExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TIssueListMainForm.actGoProjectExecute(Sender: TObject);
begin
  GridForm.DoGoProject({$IFDEF CLR}Byte{$ENDIF}(TMenuItem(Sender).Tag));
  TMenuItem(Sender).Checked := True;
end;

procedure TIssueListMainForm.FormCreate(Sender: TObject);
begin
{$IFDEF CLR}
  IssueListMainForm := Self;
{$ENDIF}
  FGridForm :=  TIssueListGridForm.Create(Self);
  with GridForm do
  begin
    Parent := Self;
    Align := alClient;
    Visible := True;
  end;
end;

function TIssueListMainForm.GetFocusedView: TcxGridTableView;
begin
  Result := GridForm.FocusedView;
end;

procedure TIssueListMainForm.actShowPicturesExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  GRidForm.DoSetShowPictures(TAction(Sender).Checked);
end;

procedure TIssueListMainForm.miLookAndFeelKindClick(Sender: TObject);
begin
  LookAndFeelController.Kind := TcxLookAndFeelKind(TMenuItem(Sender).MenuIndex);
  (Sender as TMenuItem).Checked := True;
end;

procedure TIssueListMainForm.actGroupingExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  GridForm.DoSetShowGrouping(TAction(Sender).Checked);
end;

procedure TIssueListMainForm.miNativeStyleClick(Sender: TObject);
begin
  with LookAndFeelController do
  begin
    NativeStyle := not NativeStyle;
    (Sender as TMenuItem).Checked := NativeStyle;
  end;  
end;

procedure TIssueListMainForm.acIndicatorExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  GridForm.DoSetShowIndicator(TAction(Sender).Checked);
end;

procedure TIssueListMainForm.actAboutExecute(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TIssueListMainForm.actShowDescriptionExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  GridForm.DoSetShowDescription(TAction(Sender).Checked);
end;

procedure TIssueListMainForm.actHeaderExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  GridForm.DoSetShowHeader(TAction(Sender).Checked);
end;

procedure TIssueListMainForm.actSummaryFooterExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  GridForm.DoSetShowFooter(TAction(Sender).Checked);
end;

procedure TIssueListMainForm.actAutoWidthExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  GridForm.DoSetAutoWidth(TAction(Sender).Checked);
end;

procedure TIssueListMainForm.actInvertSelectedExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  GridForm.DoSetInvertSelected(TAction(Sender).Checked);
end;

procedure TIssueListMainForm.acIndicatorUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := FocusedView.OptionsView.Indicator;
end;

procedure TIssueListMainForm.actGroupingUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := FocusedView.OptionsView.GroupByBox;
end;

procedure TIssueListMainForm.actSummaryFooterUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := FocusedView.OptionsView.Footer;
end;

procedure TIssueListMainForm.actHeaderUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := FocusedView.OptionsView.Header;
end;

procedure TIssueListMainForm.actAutoWidthUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := FocusedView.OptionsView.ColumnAutoWidth;
end;

procedure TIssueListMainForm.actInvertSelectedUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := FocusedView.OptionsSelection.InvertSelect;
end;

procedure TIssueListMainForm.actFullCollapseExecute(Sender: TObject);
begin
  GridForm.DoFullCollapse;
end;

procedure TIssueListMainForm.actFullExpandExecute(Sender: TObject);
begin
  GridForm.DoFullExpand;
end;

procedure TIssueListMainForm.actColumnsCustomizeExecute(Sender: TObject);
begin
  GridForm.DoColumnsCustomization;
end;

procedure TIssueListMainForm.actBestFitExecute(Sender: TObject);
begin
  GridForm.DoBestFit;
end;

procedure TIssueListMainForm.actShowEditButtonsExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  GridForm.DoSetShowEditButtons(TAction(Sender).Checked);
end;

procedure TIssueListMainForm.actGridLinesExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  GridForm.DoSetShowGridLines(TAction(Sender).Checked);
end;

procedure TIssueListMainForm.actShowEditButtonsUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := FocusedView.OptionsView.ShowEditButtons <> gsebNever;
end;

procedure TIssueListMainForm.actGridLinesUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := FocusedView.OptionsView.GridLines <> glNone;
end;


procedure TIssueListMainForm.actAutoPreviewUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := FocusedView.Preview.Visible;
end;

procedure TIssueListMainForm.actAutoPreviewExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  GridForm.DoSetAutoPreview(TAction(Sender).Checked);
end;

procedure TIssueListMainForm.actShowDependsOnDataExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  GridForm.DoSetShowDependsOnData(TAction(Sender).Checked);
end;

procedure TIssueListMainForm.actNewItemRowExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  GridForm.DoSetShowNewItemRow(TAction(Sender).Checked);
end;

procedure TIssueListMainForm.actNewItemRowUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := FocusedView.OptionsView.NewItemRow;
end;

procedure TIssueListMainForm.actSelectStyleSheetExecute(Sender: TObject);
var
  AStylesForm: TIssueListStylesForm;
begin
  AStylesForm := TIssueListStylesForm.Create(Application);
  with AStylesForm do
  try
   // if ShowModal = mrOK then
    //  SetStyleSheet(AStylesForm.SelectedStyleSheet);
    Show;
  finally
//    Free;
  end;
end;

procedure TIssueListMainForm.actEditorsShadowExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  GridForm.DoSetEditorsShadow(TAction(Sender).Checked);
end;


procedure TIssueListMainForm.actShowDescriptionUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := FocusedView.OptionsView.Header;
end;

end.
