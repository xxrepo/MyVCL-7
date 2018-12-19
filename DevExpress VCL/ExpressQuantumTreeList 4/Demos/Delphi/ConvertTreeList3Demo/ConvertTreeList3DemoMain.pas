unit ConvertTreeList3DemoMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  cxStyles, cxTL, cxMaskEdit, cxCurrencyEdit, cxMemo, cxCheckBox, Menus,
  cxLookAndFeels, ActnList, ImgList, cxInplaceContainer, cxDBTL,
  cxControls, cxTLData, ComCtrls, StdCtrls, DemoBasicMain, cxGraphics,
  cxCustomData, dxExEdtr, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL,
  ExtCtrls, cxTextEdit, cxCalc, cxHyperLinkEdit;

type
  TConvertTreeList3DemoMainForm = class(TDemoBasicMainForm)
    pnlEQTL3Descrip: TPanel;
    pnlEQTL4Descrip: TPanel;
    dxDBTreeList: TdxDBTreeList;
    dxDBTreeListID: TdxDBTreeListMaskColumn;
    dxDBTreeListPARENTID: TdxDBTreeListMaskColumn;
    dxDBTreeListNAME: TdxDBTreeListColumn;
    dxDBTreeListBUDGET: TdxDBTreeListCalcColumn;
    dxDBTreeListPHONE: TdxDBTreeListColumn;
    dxDBTreeListFAX: TdxDBTreeListColumn;
    dxDBTreeListEMAIL: TdxDBTreeListHyperLinkColumn;
    dxDBTreeListVACANCY: TdxDBTreeListCheckColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    pnlTreeList4Container: TPanel;
    cxDBTreeList: TcxDBTreeList;
    cxDBTreeListID: TcxDBTreeListColumn;
    cxDBTreeListPARENTID: TcxDBTreeListColumn;
    cxDBTreeListNAME: TcxDBTreeListColumn;
    cxDBTreeListBUDGET: TcxDBTreeListColumn;
    cxDBTreeListPHONE: TcxDBTreeListColumn;
    cxDBTreeListFAX: TcxDBTreeListColumn;
    cxDBTreeListEMAIL: TcxDBTreeListColumn;
    cxDBTreeListVACANCY: TcxDBTreeListColumn;
    procedure FormShow(Sender: TObject);
  end;

var
  ConvertTreeList3DemoMainForm: TConvertTreeList3DemoMainForm;

implementation

uses ConvertTreeList3DemoData, ShellAPI, DB, Dialogs;

{$R *.dfm}

procedure TConvertTreeList3DemoMainForm.FormShow(Sender: TObject);
begin
{ remove/add the closing brace on this line to disable/enable the following code

  ShowMessage('WARNING: tutorial not completed. First, please apply the steps '+
              'shown in the doc file');

//}
end;

end.
