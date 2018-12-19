unit UnitTabControls;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  sTabControl, sCheckbox, sRadioButton, ExtCtrls, sPanel, sGroupBox, sPageControl,
  sFrameAdapter, sTrackBar, ComCtrls, StdCtrls, sListView, sComboBox;

type
  TFrameTabControls = class(TFrame)
    sFrameAdapter1: TsFrameAdapter;
    sTabControl2: TsTabControl;
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sGroupBox5: TsGroupBox;
    sRadioButton6: TsRadioButton;
    sRadioButton7: TsRadioButton;
    sRadioButton8: TsRadioButton;
    sRadioButton9: TsRadioButton;
    sCheckBox8: TsCheckBox;
    sTabControl1: TsTabControl;
    sTabSheet2: TsTabSheet;
    sTabSheet3: TsTabSheet;
    sTabSheet4: TsTabSheet;
    sTabSheet5: TsTabSheet;
    sTabSheet6: TsTabSheet;
    sTabSheet7: TsTabSheet;
    sRadioButton1: TsRadioButton;
    sRadioButton2: TsRadioButton;
    sRadioButton3: TsRadioButton;
    sCheckBox1: TsCheckBox;
    sCheckBox3: TsCheckBox;
    sCheckBox4: TsCheckBox;
    sCheckBox5: TsCheckBox;
    sCheckBox6: TsCheckBox;
    sCheckBox7: TsCheckBox;
    sCheckBox10: TsCheckBox;
    sCheckBox11: TsCheckBox;
    sCheckBox12: TsCheckBox;
    sCheckBox13: TsCheckBox;
    sCheckBox2: TsCheckBox;
    sCheckBox9: TsCheckBox;
    sComboBox1: TsComboBox;
    sCheckBox14: TsCheckBox;
    sCheckBox15: TsCheckBox;
    sCheckBox16: TsCheckBox;
    procedure sCheckBox8Change(Sender: TObject);
    procedure sRadioButton6Change(Sender: TObject);
    procedure sRadioButton7Change(Sender: TObject);
    procedure sRadioButton8Change(Sender: TObject);
    procedure sRadioButton9Change(Sender: TObject);
    procedure sRadioButton1Click(Sender: TObject);
    procedure sRadioButton2Click(Sender: TObject);
    procedure sRadioButton3Click(Sender: TObject);
    procedure sComboBox1Change(Sender: TObject);
    procedure sCheckBox15Click(Sender: TObject);
    procedure sCheckBox14Click(Sender: TObject);
    procedure sPageControl1CloseBtnClick(Sender: TComponent;
      TabIndex: Integer; var CanClose: Boolean;
      var Action: TacCloseAction);
    procedure sCheckBox16Click(Sender: TObject);
  end;

implementation

uses commctrl, sVclUtils, sSKinProps, MainUnit;

{$R *.DFM}

procedure TFrameTabControls.sCheckBox8Change(Sender: TObject);
begin
  sPageControl1.MultiLine := sCheckBox8.Checked;
  sTabControl1.MultiLine := sCheckBox8.Checked;
end;

procedure TFrameTabControls.sRadioButton6Change(Sender: TObject);
begin
  if sPageControl1.TabPosition <> tpTop then sPageControl1.TabPosition := tpTop;
  sTabControl1.TabPosition := tpTop;
  sCheckBox8.Enabled := True;

  sRadioButton2.Enabled := True;
  sRadioButton3.Enabled := True;
end;

procedure TFrameTabControls.sRadioButton7Change(Sender: TObject);
begin
  if sPageControl1.TabPosition <> tpBottom then sPageControl1.TabPosition := tpBottom;
  sTabControl1.TabPosition := tpBottom;
  sCheckBox8.Enabled := True;

  sRadioButton2.Enabled := False;
  sRadioButton3.Enabled := False;
end;

procedure TFrameTabControls.sRadioButton8Change(Sender: TObject);
begin
  if sPageControl1.TabPosition <> tpLeft then sPageControl1.TabPosition := tpLeft;
  sTabControl1.TabPosition := tpLeft;
  sCheckBox8.Enabled := False;

  sRadioButton2.Enabled := False;
  sRadioButton3.Enabled := False;
end;

procedure TFrameTabControls.sRadioButton9Change(Sender: TObject);
begin
  if sPageControl1.TabPosition <> tpRight then sPageControl1.TabPosition := tpRight;
  sTabControl1.TabPosition := tpRight;
  sCheckBox8.Enabled := False;

  sRadioButton2.Enabled := False;
  sRadioButton3.Enabled := False;
end;

procedure TFrameTabControls.sRadioButton1Click(Sender: TObject);
begin
  sPageControl1.Style := tsTabs;
  sComboBox1.ItemIndex := 1;
  sPageControl1.SkinData.SkinSection := sComboBox1.Text;

  if sRadioButton7 = nil then Exit;
  sRadioButton7.Enabled := True;
  sRadioButton8.Enabled := True;
  sRadioButton9.Enabled := True;
end;

procedure TFrameTabControls.sRadioButton2Click(Sender: TObject);
begin
  sPageControl1.Style := tsButtons;
  sComboBox1.ItemIndex := 0;
  sPageControl1.SkinData.SkinSection := sComboBox1.Text;

  if sRadioButton7 = nil then Exit;
  sRadioButton7.Enabled := False;
  sRadioButton8.Enabled := False;
  sRadioButton9.Enabled := False;
end;

procedure TFrameTabControls.sRadioButton3Click(Sender: TObject);
begin
  sPageControl1.Style := tsFlatButtons;
  sComboBox1.ItemIndex := 0;
  sPageControl1.SkinData.SkinSection := sComboBox1.Text;

  if sRadioButton7 = nil then Exit;
  sRadioButton7.Enabled := False;
  sRadioButton8.Enabled := False;
  sRadioButton9.Enabled := False;
end;

procedure TFrameTabControls.sComboBox1Change(Sender: TObject);
begin
  sPageControl1.SkinData.SkinSection := sComboBox1.Text
end;

procedure TFrameTabControls.sCheckBox15Click(Sender: TObject);
begin
  sPageControl1.ShowCloseBtns := sCheckBox15.Checked;
  if sTabSheet1 <> nil then sCheckBox14.Enabled := sCheckBox15.Checked;
end;

procedure TFrameTabControls.sCheckBox14Click(Sender: TObject);
begin
  sTabSheet1.UseCloseBtn := sCheckBox14.Checked;
end;

procedure TFrameTabControls.sPageControl1CloseBtnClick(Sender: TComponent; TabIndex: Integer; var CanClose: Boolean; var Action: TacCloseAction);
begin
  CanClose := MessageDlg('Close ' + sPageControl1.Pages[TabIndex].Caption + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

procedure TFrameTabControls.sCheckBox16Click(Sender: TObject);
begin
  if sCheckBox16.Checked then sTabSheet7.TabSkin := '' else sTabSheet7.TabSkin := s_ProgressH;
end;

end.
