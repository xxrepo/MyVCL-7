unit SimpleListDemoMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  cxStyles, cxTL, cxMaskEdit, cxBlobEdit, cxCurrencyEdit, cxSpinEdit,
  cxCheckBox, cxHyperLinkEdit, cxEditRepositoryItems, cxEdit,
  cxLookAndFeels, ActnList, ImgList, Menus, cxInplaceContainer, cxDBTL,
  cxControls, cxTLData, ComCtrls, StdCtrls, DemoBasicMain, cxGraphics,
  cxCustomData;

type
  TSimpleListDemoMainForm = class(TDemoBasicMainForm)
    miView: TMenuItem;
    miBehavior: TMenuItem;
    miSeparator1: TMenuItem;
    miGridLookFeel: TMenuItem;
    miKind: TMenuItem;
    miFlat: TMenuItem;
    miStandard: TMenuItem;
    miUltraFlat: TMenuItem;
    miNativeStyle: TMenuItem;
    miSeparator2: TMenuItem;
    cxDBTreeList: TcxDBTreeList;
    cxEditRepository: TcxEditRepository;
    cxEditRepositorySpinItem: TcxEditRepositorySpinItem;
    eriPicture: TcxEditRepositoryBlobItem;
    eriHP: TcxEditRepositorySpinItem;
    eriLiter: TcxEditRepositorySpinItem;
    eriTransmissAuto: TcxEditRepositoryCheckBoxItem;
    eriDescription: TcxEditRepositoryBlobItem;
    eriURL: TcxEditRepositoryHyperLinkItem;
    cxDBTreeListID: TcxDBTreeListColumn;
    cxDBTreeListTrademark: TcxDBTreeListColumn;
    cxDBTreeListModel: TcxDBTreeListColumn;
    cxDBTreeListPicture: TcxDBTreeListColumn;
    cxDBTreeListPrice: TcxDBTreeListColumn;
    cxDBTreeListHP: TcxDBTreeListColumn;
    cxDBTreeListLiter: TcxDBTreeListColumn;
    cxDBTreeListCyl: TcxDBTreeListColumn;
    cxDBTreeListTransmissSpeedCount: TcxDBTreeListColumn;
    cxDBTreeListTransmissAutomatic: TcxDBTreeListColumn;
    cxDBTreeListMPG_City: TcxDBTreeListColumn;
    cxDBTreeListMPG_Highway: TcxDBTreeListColumn;
    cxDBTreeListCategory: TcxDBTreeListColumn;
    cxDBTreeListHyperlink: TcxDBTreeListColumn;
    cxDBTreeListDescription: TcxDBTreeListColumn;
    miBands: TMenuItem;
    miHeaders: TMenuItem;
    miGridLines: TMenuItem;
    miIncSearch: TMenuItem;
    miFocusCellOnCycle: TMenuItem;
    miImmediateEditor: TMenuItem;
    miMultiSelect: TMenuItem;
    Office111: TMenuItem;
    procedure LookAndFeelChange(Sender: TObject);
    procedure miBandsClick(Sender: TObject);
    procedure miHeadersClick(Sender: TObject);
    procedure miGridLinesClick(Sender: TObject);
    procedure miIncSearchClick(Sender: TObject);
    procedure miFocusCellOnCycleClick(Sender: TObject);
    procedure miImmediateEditorClick(Sender: TObject);
    procedure miMultiSelectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  end;

var
  SimpleListDemoMainForm: TSimpleListDemoMainForm;

implementation

uses SimpleListDemoData, ShellAPI, Dialogs;

{$R *.dfm}

procedure TSimpleListDemoMainForm.FormShow(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code

  ShowMessage('WARNING: tutorial not completed. First, please apply the steps '+
              'shown in the doc file');

//}
end;

procedure TSimpleListDemoMainForm.LookAndFeelChange(Sender: TObject);
begin
  if TMenuItem(Sender).Tag > 3 then
  begin
    cxLookAndFeelController.NativeStyle :=
      not cxLookAndFeelController.NativeStyle;
    TMenuItem(Sender).Checked := cxLookAndFeelController.NativeStyle;
  end
  else
  begin
    TMenuItem(Sender).Checked := True;
    cxLookAndFeelController.Kind := TcxLookAndFeelKind(TMenuItem(Sender).Tag);
    cxLookAndFeelController.NativeStyle := False;
    miNativeStyle.Checked := False;
  end;
end;

procedure TSimpleListDemoMainForm.miBandsClick(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  cxDBTreeList.OptionsView.Bands := TMenuItem(Sender).Checked;

//}
end;

procedure TSimpleListDemoMainForm.miHeadersClick(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  cxDBTreeList.OptionsView.Headers := TMenuItem(Sender).Checked;

//}
end;

procedure TSimpleListDemoMainForm.miGridLinesClick(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  if TMenuItem(Sender).Checked then
    cxDBTreeList.OptionsView.GridLines := tlglBoth
  else
    cxDBTreeList.OptionsView.GridLines := tlglNone;

//}
end;

procedure TSimpleListDemoMainForm.miIncSearchClick(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  cxDBTreeList.OptionsBehavior.IncSearch := TMenuItem(Sender).Checked;

//}
end;

procedure TSimpleListDemoMainForm.miFocusCellOnCycleClick(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  cxDBTreeList.OptionsBehavior.FocusCellOnCycle := TMenuItem(Sender).Checked;

//}
end;

procedure TSimpleListDemoMainForm.miImmediateEditorClick(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  cxDBTreeList.OptionsBehavior.ImmediateEditor := TMenuItem(Sender).Checked;

//}
end;

procedure TSimpleListDemoMainForm.miMultiSelectClick(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  cxDBTreeList.OptionsSelection.MultiSelect := TMenuItem(Sender).Checked;

//}
end;

end.
