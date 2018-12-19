unit ColumnsMultiEditorsDemoMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Dialogs,
  Forms, cxControls, cxGridCustomTableView, cxGridTableView, cxGridCustomView,
  cxLookAndFeels, cxData, cxDBData, cxClasses, cxEditRepositoryItems,
  cxDataStorage, StdCtrls, cxEdit, ActnList, ImgList, Menus, ComCtrls,
  cxGridLevel, cxStyles, cxGraphics, cxCustomData, cxGrid, cxFilter;

type
  TColumnsMultiEditorsDemoMainForm = class(TForm)
    mmMain: TMainMenu;
    miAbout: TMenuItem;
    miFile: TMenuItem;
    miOptions: TMenuItem;
    miExit: TMenuItem;
    sbMain: TStatusBar;
    lbDescrip: TLabel;
    EditRepository: TcxEditRepository;
    ImageComboLanguages: TcxEditRepositoryImageComboBoxItem;
    ImageComboCommunication: TcxEditRepositoryImageComboBoxItem;
    SpinItemYears: TcxEditRepositorySpinItem;
    DateItemStartWorkFrom: TcxEditRepositoryDateItem;
    Grid: TcxGrid;
    tvSkills: TcxGridTableView;
    clnName: TcxGridColumn;
    clnSkill: TcxGridColumn;
    clnGrade: TcxGridColumn;
    lvSkills: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    miEditButtons: TMenuItem;
    miEditButtonsNever: TMenuItem;
    miEditButtonsForFocusedRecord: TMenuItem;
    miEditButtonsAlways: TMenuItem;
    LookAndFeelController: TcxLookAndFeelController;
    procedure miAboutClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure clnGradeGetProperties(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord;
      var AProperties: TcxCustomEditProperties);
    procedure miEditButtonsAlwaysClick(Sender: TObject);
    procedure miEditButtonsFocusedRecordClick(Sender: TObject);
    procedure miEditButtonsNeverClick(Sender: TObject);
  private
  end;

var
  ColumnsMultiEditorsDemoMainForm: TColumnsMultiEditorsDemoMainForm;

implementation

{$R *.dfm}

uses
  AboutDemoForm, ColumnsMultiEditorsDemoDS;

procedure TColumnsMultiEditorsDemoMainForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TColumnsMultiEditorsDemoMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TColumnsMultiEditorsDemoMainForm.FormCreate(Sender: TObject);
begin
  tvSkills.BeginUpdate;
  try
    clnSkill.DataBinding.ValueTypeClass := TcxStringValueType;
    clnGrade.DataBinding.ValueTypeClass := TcxVariantValueType;
    clnName.DataBinding.ValueTypeClass := TcxStringValueType;
  finally
    tvSkills.EndUpdate;
  end;
  tvSkills.DataController.CustomDataSource := TSkillDataSource.Create(tvSkills,
        ImageComboLanguages.Properties.Items.Count,
        ImageComboCommunication.Properties.Items.Count);
  tvSkills.DataController.CustomDataSource.DataChanged;
  tvSkills.DataController.Groups.FullExpand;
end;

procedure TColumnsMultiEditorsDemoMainForm.FormDestroy(Sender: TObject);
begin
  tvSkills.DataController.CustomDataSource.Free;
end;

procedure TColumnsMultiEditorsDemoMainForm.clnGradeGetProperties(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AProperties: TcxCustomEditProperties);
begin
  case ARecord.RecordIndex mod SkillCount of
    0: AProperties := SpinItemYears.Properties;
    1, 2: AProperties := ImageComboLanguages.Properties;
    3: AProperties := ImageComboCommunication.Properties;
    4: AProperties := DateItemStartWorkFrom.Properties;
  end;
end;

procedure TColumnsMultiEditorsDemoMainForm.miEditButtonsAlwaysClick(
  Sender: TObject);
begin
  if tvSkills.OptionsView.ShowEditButtons <> gsebAlways then
  begin
    TMenuItem(Sender).Checked := True;
    tvSkills.OptionsView.ShowEditButtons := gsebAlways;
  end;
end;

procedure TColumnsMultiEditorsDemoMainForm.miEditButtonsFocusedRecordClick(
  Sender: TObject);
begin
  if tvSkills.OptionsView.ShowEditButtons <> gsebForFocusedRecord then
  begin
    TMenuItem(Sender).Checked := True;
    tvSkills.OptionsView.ShowEditButtons := gsebForFocusedRecord;
  end;
end;

procedure TColumnsMultiEditorsDemoMainForm.miEditButtonsNeverClick(
  Sender: TObject);
begin
  if tvSkills.OptionsView.ShowEditButtons <> gsebNever then
  begin
    TMenuItem(Sender).Checked := True;
    tvSkills.OptionsView.ShowEditButtons := gsebNever;
  end;
end;

end.
