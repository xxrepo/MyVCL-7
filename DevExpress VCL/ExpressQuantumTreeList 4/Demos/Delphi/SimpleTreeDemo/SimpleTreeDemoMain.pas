unit SimpleTreeDemoMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  cxStyles, cxTL, cxMaskEdit, cxCurrencyEdit, cxMemo, cxCheckBox, Menus,
  cxLookAndFeels, ActnList, ImgList, cxInplaceContainer, cxDBTL,
  cxControls, cxTLData, ComCtrls, StdCtrls, DemoBasicMain, cxGraphics,
  cxCustomData;

type
  TSimpleTreeDemoMainForm = class(TDemoBasicMainForm)
    miFullCollapse: TMenuItem;
    miFullExpand: TMenuItem;
    miSeparator1: TMenuItem;
    miGridLookFeel: TMenuItem;
    miKind: TMenuItem;
    miFlat: TMenuItem;
    miStandard: TMenuItem;
    miUltraFlat: TMenuItem;
    miNativeStyle: TMenuItem;
    miSeparator2: TMenuItem;
    cxDBTreeList: TcxDBTreeList;
    mnuNodeOptions: TPopupMenu;
    miNodeDelete: TMenuItem;
    N1: TMenuItem;
    miOptionsView: TMenuItem;
    miHeaders: TMenuItem;
    miIndicator: TMenuItem;
    miButtons: TMenuItem;
    miShowRoot: TMenuItem;
    miColumnCustomization: TMenuItem;
    miNodeAdd: TMenuItem;
    miNodeAddChild: TMenuItem;
    N2: TMenuItem;
    miExpand: TMenuItem;
    miCollapse: TMenuItem;
    miPreview: TMenuItem;
    cxDBTreeListID: TcxDBTreeListColumn;
    cxDBTreeListPARENTID: TcxDBTreeListColumn;
    cxDBTreeListNAME: TcxDBTreeListColumn;
    cxDBTreeListBUDGET: TcxDBTreeListColumn;
    cxDBTreeListPHONE: TcxDBTreeListColumn;
    cxDBTreeListFAX: TcxDBTreeListColumn;
    cxDBTreeListEMAIL: TcxDBTreeListColumn;
    cxDBTreeListVACANCY: TcxDBTreeListColumn;
    Office111: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure LookAndFeelChange(Sender: TObject);
    procedure mnuNodeOptionsPopup(Sender: TObject);
    procedure miFullCollapseClick(Sender: TObject);
    procedure miFullExpandClick(Sender: TObject);
    procedure miHeadersClick(Sender: TObject);
    procedure miIndicatorClick(Sender: TObject);
    procedure miButtonsClick(Sender: TObject);
    procedure miShowRootClick(Sender: TObject);
    procedure miColumnCustomizationClick(Sender: TObject);
    procedure miNodeDeleteClick(Sender: TObject);
    procedure miNodeAddClick(Sender: TObject);
    procedure miNodeAddChildClick(Sender: TObject);
    procedure miExpandClick(Sender: TObject);
    procedure miCollapseClick(Sender: TObject);
    procedure miPreviewClick(Sender: TObject);
    procedure cxDBTreeListInitInsertingRecord(Sender: TObject;
      AFocusedNode: TcxTreeListDataNode; var AHandled: Boolean);
  private
    FHitNode: TcxTreeListDataNode;
    procedure InsertNode(AParentID: Integer);
  end;

var
  SimpleTreeDemoMainForm: TSimpleTreeDemoMainForm;

implementation

uses SimpleTreeDemoData, ShellAPI, DB, Dialogs;

{$R *.dfm}

procedure TSimpleTreeDemoMainForm.FormShow(Sender: TObject);
begin
  cxDBTreeList.FullExpand;
{ remove/add the closing brace on this line to disable/enable the following code

  ShowMessage('WARNING: tutorial not completed. First, please apply the steps '+
              'shown in the doc file');

//}
end;

procedure TSimpleTreeDemoMainForm.LookAndFeelChange(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

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

//}
end;

procedure TSimpleTreeDemoMainForm.mnuNodeOptionsPopup(Sender: TObject);
begin
  if not cxDBTreeList.HitTest.HitAtIndicator then Abort;
  FHitNode := TcxTreeListDataNode(cxDBTreeList.HitTest.HitNode);
end;

procedure TSimpleTreeDemoMainForm.miFullCollapseClick(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  cxDBTreeList.FullCollapse;

//}
end;

procedure TSimpleTreeDemoMainForm.miFullExpandClick(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  cxDBTreeList.FullExpand;

//}
end;

procedure TSimpleTreeDemoMainForm.miHeadersClick(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  cxDBTreeList.OptionsView.Headers := TMenuItem(Sender).Checked;

//}
end;

procedure TSimpleTreeDemoMainForm.miIndicatorClick(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  cxDBTreeList.OptionsView.Indicator := TMenuItem(Sender).Checked;

//}
end;

procedure TSimpleTreeDemoMainForm.miButtonsClick(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  cxDBTreeList.OptionsView.Buttons := TMenuItem(Sender).Checked;

//}
end;

procedure TSimpleTreeDemoMainForm.miShowRootClick(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  cxDBTreeList.OptionsView.ShowRoot := TMenuItem(Sender).Checked;

//}
end;

procedure TSimpleTreeDemoMainForm.miColumnCustomizationClick(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  cxDBTreeList.Customizing.Visible := True;

//}
end;

procedure TSimpleTreeDemoMainForm.miNodeDeleteClick(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  FHitNode.Delete;

//}
end;

procedure TSimpleTreeDemoMainForm.miNodeAddClick(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  InsertNode(FHitNode.ParentValue);

//}
end;

procedure TSimpleTreeDemoMainForm.miNodeAddChildClick(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  InsertNode(FHitNode.KeyValue);

//}
end;

procedure TSimpleTreeDemoMainForm.miExpandClick(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  FHitNode.Expand(True);

//}
end;

procedure TSimpleTreeDemoMainForm.miCollapseClick(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  FHitNode.Collapse(True);

//}
end;

procedure TSimpleTreeDemoMainForm.miPreviewClick(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  if TMenuItem(Sender).Checked then
    cxDBTreeList.Preview.Column := cxDBTreeListNAME
  else
  begin
    cxDBTreeList.Preview.Column := nil;
    cxDBTreeListNAME.ApplyBestFit;
  end;

//}
end;

procedure TSimpleTreeDemoMainForm.InsertNode(AParentID: Integer);
var
  ADataSet: TDataSet;
  AField: TField;
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  ADataSet := cxDBTreeList.DataController.DataSet;
  ADataSet.DisableControls;
  try
    AField := ADataSet.FindField(cxDBTreeList.DataController.ParentField);
    if Assigned(AField) then
    begin
      ADataSet.Insert;
      AField.Value := AParentID;
    end;
  finally
    ADataSet.EnableControls;
  end;

//}
end;

procedure TSimpleTreeDemoMainForm.cxDBTreeListInitInsertingRecord(
  Sender: TObject; AFocusedNode: TcxTreeListDataNode;
  var AHandled: Boolean);
begin
{ remove/add the closing brace on this line to disable/enable the following code}

  if AFocusedNode <> nil then
    SimpleTreeDemoDataDM.SetParentValue(AFocusedNode.ParentValue);

//}
end;

end.
