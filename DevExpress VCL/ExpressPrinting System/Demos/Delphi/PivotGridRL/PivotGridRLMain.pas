unit PivotGridRLMain;

interface

{$I ..\cxVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Forms, Menus, Graphics, StdCtrls,
  dxPSCore, dxPSGlbl, dxPSUtl, cxControls, dxPScxCommon, ComCtrls, ShellApi,
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  {dxPSPrVwAdv,} // enable for use of ExpressBars in PrintPreview
  ToolWin, Controls, ImgList, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPScxPivotGrid2Lnk,
  cxCustomPivotGrid, cxPivotGrid, cxClasses, cxGraphics, cxCustomData,
  cxStyles, cxEdit;

type
  TPivotGridRLMainForm = class(TForm)
    MainMenu: TMainMenu;
    miFile: TMenuItem;
    miDesigner: TMenuItem;
    miHelp: TMenuItem;
    miPageSetup: TMenuItem;
    miPrintPreview: TMenuItem;
    miPrint: TMenuItem;
    N1: TMenuItem;
    miExit: TMenuItem;
    miDX: TMenuItem;
    dxComponentPrinter1: TdxComponentPrinter;
    ToolBar1: TToolBar;
    tbSetup: TToolButton;
    tbPreview: TToolButton;
    tbPrint: TToolButton;
    tbDevider: TToolButton;
    tbDesigner: TToolButton;
    tbDX: TToolButton;
    tbSeparator: TToolButton;
    tbExit: TToolButton;
    ilButtons: TImageList;
    PivotGrid: TcxPivotGrid;
    pgfPurchaseQuarter: TcxPivotGridField;
    pgfPurchaseMonth: TcxPivotGridField;
    pgfPaymentType: TcxPivotGridField;
    pgfQuantity: TcxPivotGridField;
    pgfCarName: TcxPivotGridField;
    pgfUnitPrice: TcxPivotGridField;
    pgfCompanyName: TcxPivotGridField;
    pgfPaymentAmount: TcxPivotGridField;
    dxComponentPrinter1Link1: TcxPivotGridReportLink;
    PaymentTypeImages: TImageList;
    procedure miDXClick(Sender: TObject);
    procedure miPageSetupClick(Sender: TObject);
    procedure miPrintPreviewClick(Sender: TObject);
    procedure miPrintClick(Sender: TObject);
    procedure miDesignerClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pgfPaymentTypeGetGroupImageIndex(Sender: TcxPivotGridField;
      const AItem: TcxPivotGridViewDataItem; var AImageIndex: Integer;
      var AImageAlignHorz: TAlignment;
      var AImageAlignVert: TcxAlignmentVert);
  private
  public
    { Public declarations }
  end;

var
  PivotGridRLMainForm: TPivotGridRLMainForm;

implementation


{$R *.DFM}

procedure TPivotGridRLMainForm.miDXClick(Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar('http://www.devexpress.com'), Nil, Nil, SW_SHOWMAXIMIZED);
end;

procedure TPivotGridRLMainForm.miPageSetupClick(Sender: TObject);
begin
  dxComponentPrinter1.PageSetup(nil);
end;

procedure TPivotGridRLMainForm.miPrintPreviewClick(Sender: TObject);
begin
  dxComponentPrinter1.Preview(True, nil);
end;

procedure TPivotGridRLMainForm.miPrintClick(Sender: TObject);
begin
  dxComponentPrinter1.Print(True, nil, nil);
end;

procedure TPivotGridRLMainForm.miDesignerClick(Sender: TObject);
begin
  dxComponentPrinter1.DesignReport(nil);
end;

procedure TPivotGridRLMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TPivotGridRLMainForm.FormCreate(Sender: TObject);
var
  AStream: TStream;
begin
  AStream := TResourceStream.Create(hInstance, 'PIVOTPREVIEWDATA', 'PIVOTDATA');
  try
    AStream.Position := 0;
    PivotGrid.DataController.LoadFromStream(AStream);
  finally
    AStream.Free;
  end;
end;

procedure TPivotGridRLMainForm.pgfPaymentTypeGetGroupImageIndex(
  Sender: TcxPivotGridField; const AItem: TcxPivotGridViewDataItem;
  var AImageIndex: Integer; var AImageAlignHorz: TAlignment;
  var AImageAlignVert: TcxAlignmentVert);
var
  Card: string;
begin
  Card := VarToStr(AItem.Value);
  if SameText(Card, 'AmEx') then
    AImageIndex := 0
  else
    if SameText(Card, 'Cash') then
      AImageIndex := 1
    else
      if SameText(Card, 'Master') then
        AImageIndex := 2
      else
        if SameText(Card, 'Visa') then
          AImageIndex := 3;
end;

end.
