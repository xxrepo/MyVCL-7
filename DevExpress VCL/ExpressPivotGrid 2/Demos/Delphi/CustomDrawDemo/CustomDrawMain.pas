unit CustomDrawMain;

{$I ..\cxVer.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, DemoBasicMain, cxLookAndFeels, Menus, StdCtrls, cxControls,
  cxCustomPivotGrid, cxDBPivotGrid, DemoBasicDM, cxGraphics, dxOffice11,
  cxClasses, cxCustomData, cxStyles, cxLookAndFeelPainters, cxEdit;

type
  TfrmCustomDraw = class(TfrmDemoBaisicMain)
    DBPivotGrid: TcxDBPivotGrid;
    pgfPaymentType: TcxDBPivotGridField;
    pgfQuantity: TcxDBPivotGridField;
    pgfCarName: TcxDBPivotGridField;
    pgfUnitPrice: TcxDBPivotGridField;
    pgfCompanyName: TcxDBPivotGridField;
    pgfPaymentAmount: TcxDBPivotGridField;
    Drawing1: TMenuItem;
    FieldHeaders1: TMenuItem;
    Content1: TMenuItem;
    Background1: TMenuItem;
    GroupHeaders1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    miLimitValues: TMenuItem;
    procedure DBPivotGridCustomDrawCell(Sender: TcxCustomPivotGrid;
      ACanvas: TcxCanvas; AViewInfo: TcxPivotGridDataCellViewInfo;
      var ADone: Boolean);
    procedure DBPivotGridCustomDrawColumnHeader(Sender: TcxCustomPivotGrid;
      ACanvas: TcxCanvas; AViewInfo: TcxPivotGridHeaderCellViewInfo;
      var ADone: Boolean);
    procedure DBPivotGridCustomDrawFieldHeader(Sender: TcxCustomPivotGrid;
      ACanvas: TcxCanvas; AViewInfo: TcxPivotGridFieldHeaderCellViewInfo;
      var ADone: Boolean);
    procedure DBPivotGridCustomDrawPart(Sender: TcxCustomPivotGrid;
      ACanvas: TcxCanvas; AViewInfo: TcxPivotGridCustomCellViewInfo;
      var ADone: Boolean);
    procedure DBPivotGridCustomDrawRowHeader(Sender: TcxCustomPivotGrid;
      ACanvas: TcxCanvas; AViewInfo: TcxPivotGridHeaderCellViewInfo;
      var ADone: Boolean);
    procedure DrawingClick(Sender: TObject);
  protected
  protected
    function GetDefaultLookAndFeelKind: TcxLookAndFeelKind; override;
    function GetPivotGrid: TcxCustomPivotGrid; override; 
  public
    { Public declarations }
  end;

var
  frmCustomDraw: TfrmCustomDraw;

implementation

{$R *.dfm}

function TfrmCustomDraw.GetDefaultLookAndFeelKind: TcxLookAndFeelKind;
begin
  Result := lfUltraFlat;
end;

function TfrmCustomDraw.GetPivotGrid: TcxCustomPivotGrid;
begin
  Result := DBPivotGrid;
end;

procedure TfrmCustomDraw.DBPivotGridCustomDrawCell(
  Sender: TcxCustomPivotGrid; ACanvas: TcxCanvas;
  AViewInfo: TcxPivotGridDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.DisplayText = '' then
  begin
    ACanvas.Brush.Color := clBtnShadow;
    ACanvas.FillRect(AViewInfo.Bounds);
    with AViewInfo.Bounds do
    begin
      ACanvas.Pen.Color := clBlack;
      ACanvas.Pen.Width := 1;
      ACanvas.MoveTo(Left, Top);
      ACanvas.LineTo(Right, Bottom);
      ACanvas.MoveTo(Right, Top);
      ACanvas.LineTo(Left, Bottom);
    end;
    AViewInfo.Transparent := True;
  end
  else
    AViewInfo.Transparent := True;
    if (lvtColumnMaximum in AViewInfo.LimitValueTypes) and miLimitValues.Checked then
      FillTubeGradientRect(ACanvas.Handle, AViewInfo.Bounds, clWhite, clRed, False)
    else
      if (lvtColumnMinimum in AViewInfo.LimitValueTypes) and miLimitValues.Checked then
        FillTubeGradientRect(ACanvas.Handle, AViewInfo.Bounds, clWhite, clLime, False)
      else
        if (AViewInfo.RowIndex mod 2 = 0) or (AViewInfo.RowIndex mod 2 = 0) then
          FillTubeGradientRect(ACanvas.Handle, AViewInfo.Bounds, clYellow, clRed, True)
        else
          AViewInfo.Transparent := False;
end;

procedure TfrmCustomDraw.DBPivotGridCustomDrawColumnHeader(
  Sender: TcxCustomPivotGrid; ACanvas: TcxCanvas;
  AViewInfo: TcxPivotGridHeaderCellViewInfo; var ADone: Boolean);
begin
  FillTubeGradientRect(ACanvas.Handle, AViewInfo.Bounds, clGreen, AViewInfo.Color, False);
  AViewInfo.Transparent := True;
end;

procedure TfrmCustomDraw.DBPivotGridCustomDrawFieldHeader(
  Sender: TcxCustomPivotGrid; ACanvas: TcxCanvas;
  AViewInfo: TcxPivotGridFieldHeaderCellViewInfo; var ADone: Boolean);
begin
  FillTubeGradientRect(ACanvas.Handle, AViewInfo.Bounds, clRed, AViewInfo.Color, False);
  AViewInfo.Transparent := True;
end;

procedure TfrmCustomDraw.DBPivotGridCustomDrawPart(
  Sender: TcxCustomPivotGrid; ACanvas: TcxCanvas;
  AViewInfo: TcxPivotGridCustomCellViewInfo; var ADone: Boolean);
begin
  FillTubeGradientRect(ACanvas.Handle, AViewInfo.Bounds, clBlue, AViewInfo.Color, True);
  AViewInfo.Transparent := True;
end;

procedure TfrmCustomDraw.DBPivotGridCustomDrawRowHeader(
  Sender: TcxCustomPivotGrid; ACanvas: TcxCanvas;
  AViewInfo: TcxPivotGridHeaderCellViewInfo; var ADone: Boolean);
begin
  FillTubeGradientRect(ACanvas.Handle, AViewInfo.Bounds, clAqua, AViewInfo.Color, True);
  AViewInfo.Transparent := True;
end;

procedure TfrmCustomDraw.DrawingClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  case TComponent(Sender).Tag of
    0:
      if TMenuItem(Sender).Checked then
        DBPivotGrid.OnCustomDrawPart := DBPivotGridCustomDrawPart
      else
        DBPivotGrid.OnCustomDrawPart := nil;
    1:
      if TMenuItem(Sender).Checked then
      begin
        DBPivotGrid.OnCustomDrawCell := DBPivotGridCustomDrawCell;
        miLimitValues.Checked := True;
        miLimitValues.Enabled := True;
      end
      else
      begin
        miLimitValues.Checked := False;
        miLimitValues.Enabled := False;
        DBPivotGrid.OnCustomDrawCell := nil;
      end;
    2:
      if TMenuItem(Sender).Checked then
        DBPivotGrid.OnCustomDrawFieldHeader := DBPivotGridCustomDrawFieldHeader
      else
        DBPivotGrid.OnCustomDrawFieldHeader := nil;
    3:
      if TMenuItem(Sender).Checked then
      begin
        DBPivotGrid.OnCustomDrawColumnHeader := DBPivotGridCustomDrawColumnHeader;
        DBPivotGrid.OnCustomDrawRowHeader := DBPivotGridCustomDrawRowHeader;
      end
      else
      begin
        DBPivotGrid.OnCustomDrawColumnHeader := nil;
        DBPivotGrid.OnCustomDrawRowHeader := nil;
      end;
  end;
  PivotGrid.LayoutChanged;
end;

end.
