unit ProviderModeDemoMain;

{$I ..\cxVer.inc}

interface

uses
  Windows, Messages, SysUtils, {$IFDEF DELPHI6} Variants, {$ENDIF}Classes,
  Graphics, Controls, Forms, Dialogs, cxControls, cxLookAndFeels, ActnList,
  ImgList, Menus, ComCtrls, StdCtrls, DemoBasicMain, cxContainer, cxEdit,
  cxTextEdit, cxClasses, cxStyles, cxTL, cxSpinEdit, cxCalendar,
  cxInplaceContainer, cxTLData, cxGraphics, cxCustomData;

type

  TProviderModeDemoMainForm = class(TDemoBasicMainForm)
    miGridLookFeel: TMenuItem;
    miKind: TMenuItem;
    miFlat: TMenuItem;
    miStandard: TMenuItem;
    miUltraFlat: TMenuItem;
    miNativeStyle: TMenuItem;
    miSeparator2: TMenuItem;
    StyleRepository: TcxStyleRepository;
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
    stlGroupNode: TcxStyle;
    stlFixedBand: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    TreeList: TcxVirtualTreeList;
    clnId: TcxTreeListColumn;
    clnName: TcxTreeListColumn;
    clnDate: TcxTreeListColumn;
    N1: TMenuItem;
    miShowButtons: TMenuItem;
    miShowRoot: TMenuItem;
    miShowIndicator: TMenuItem;
    miShowTreeLines: TMenuItem;
    miCellAutoHeight: TMenuItem;
    miCellEndEllipsis: TMenuItem;
    miColumnAutoWidth: TMenuItem;
    N2: TMenuItem;
    miSmartLoadMode: TMenuItem;
    Office111: TMenuItem;
    procedure LookAndFeelChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure miShowTreeLinesClick(Sender: TObject);
    procedure miShowIndicatorClick(Sender: TObject);
    procedure miShowRootClick(Sender: TObject);
    procedure miShowButtonsClick(Sender: TObject);
    procedure miSmartLoadModeClick(Sender: TObject);
    procedure miCellAutoHeightClick(Sender: TObject);
    procedure miCellEndEllipsisClick(Sender: TObject);
    procedure miColumnAutoWidthClick(Sender: TObject);
    procedure TreeListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
  end;

var
  ProviderModeDemoMainForm: TProviderModeDemoMainForm;

implementation

uses ShellAPI, ProviderModeDemoClasses;

{$R *.dfm}

procedure TProviderModeDemoMainForm.LookAndFeelChange(Sender: TObject);
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

procedure TProviderModeDemoMainForm.FormCreate(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  TreeList.OptionsData.SmartLoad := True;
  RecreateDemoDataSource(TreeList);

//}
end;

procedure TProviderModeDemoMainForm.FormDestroy(Sender: TObject);
begin
  TreeList.DataController.CustomDataSource.Free;
  TreeList.DataController.CustomDataSource := nil;
end;

procedure TProviderModeDemoMainForm.FormShow(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code

  ShowMessage('WARNING: tutorial not completed. First, please apply the steps '+
              'shown in the doc file');

//}
end;

procedure TProviderModeDemoMainForm.miCellAutoHeightClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  TreeList.OptionsView.CellAutoHeight := TMenuItem(Sender).Checked;
end;

procedure TProviderModeDemoMainForm.miCellEndEllipsisClick(
  Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  TreeList.OptionsView.CellEndEllipsis := TMenuItem(Sender).Checked;
end;

procedure TProviderModeDemoMainForm.miColumnAutoWidthClick(
  Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  TreeList.OptionsView.ColumnAutoWidth := TMenuItem(Sender).Checked;
end;

procedure TProviderModeDemoMainForm.miShowTreeLinesClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  TreeList.OptionsView.TreeLineStyle :=
    TcxTreeListTreeLineStyle(TMenuItem(Sender).Checked);
end;

procedure TProviderModeDemoMainForm.miShowIndicatorClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  TreeList.OptionsView.Indicator := TMenuItem(Sender).Checked;
end;

procedure TProviderModeDemoMainForm.miShowRootClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  TreeList.OptionsView.ShowRoot := TMenuItem(Sender).Checked;
end;

procedure TProviderModeDemoMainForm.miShowButtonsClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  TreeList.OptionsView.Buttons := TMenuItem(Sender).Checked;
end;

procedure TProviderModeDemoMainForm.miSmartLoadModeClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  TreeList.OptionsData.SmartLoad := TMenuItem(Sender).Checked;
  RecreateDemoDataSource(TreeList);
end;

procedure TProviderModeDemoMainForm.TreeListDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  //
end;

end.
