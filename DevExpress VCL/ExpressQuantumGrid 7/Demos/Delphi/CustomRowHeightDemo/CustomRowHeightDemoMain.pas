unit CustomRowHeightDemoMain;

{$I ..\..\cxVer.inc}

interface

uses
  Windows, Forms, Messages, SysUtils, Classes, ActnList, ImgList, Controls, Menus,
  StdCtrls, cxButtons, cxCheckBox, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxSpinEdit, ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridCardView, cxGridDBCardView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ComCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, DB, cxDBData, cxDataStorage, cxLookAndFeelPainters,
  cxLookAndFeels, cxHyperLinkEdit, cxImageComboBox, cxDBLookupComboBox,
  cxMemo, cxImage, cxGridTableView, cxGridDBTableView, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter;

type
  TCustomRowHeightDemoMainForm = class(TForm)
    mmMain: TMainMenu;
    miAbout: TMenuItem;
    miFile: TMenuItem;
    miOptions: TMenuItem;
    miExit: TMenuItem;
    sbMain: TStatusBar;
    lbDescrip: TLabel;
    LookAndFeelController: TcxLookAndFeelController;
    Grid: TcxGrid;
    tvFilms: TcxGridDBTableView;
    tvFilmsCAPTION: TcxGridDBColumn;
    tvFilmsPLOTOUTLINE: TcxGridDBColumn;
    tvFilmsPHOTO: TcxGridDBColumn;
    lvFilms: TcxGridLevel;
    miPictureZoom: TMenuItem;
    miZoom100perc: TMenuItem;
    miZoom75perc: TMenuItem;
    miZoom50perc: TMenuItem;
    miZoom25perc: TMenuItem;
    procedure miAboutClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miZoomClick(Sender: TObject);
    procedure tvFilmsGetCellHeight(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);
  private
    FCurrentZoom: Integer;
    function GetZoomByMenuItem(AMenuItemIndex: Integer): Integer;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  CustomRowHeightDemoMainForm: TCustomRowHeightDemoMainForm;

implementation

{$R *.dfm}

uses
  {$IFDEF DELPHI6}
  Variants,
  {$ENDIF}
  CustomRowHeightDemoData, Dialogs, AboutDemoForm, Graphics, cxVariants;

constructor TCustomRowHeightDemoMainForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCurrentZoom := 50;
end;

procedure TCustomRowHeightDemoMainForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TCustomRowHeightDemoMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TCustomRowHeightDemoMainForm.miZoomClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := True;
  FCurrentZoom := GetZoomByMenuItem(TMenuItem(Sender).MenuIndex);
  tvFilms.SizeChanged;
end;

procedure TCustomRowHeightDemoMainForm.tvFilmsGetCellHeight(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem;
  ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);
var
  AEditValue: Variant;
  APicture: TPicture;
begin
  if AItem <> tvFilmsPHOTO then
  begin
    AHeight := 0;
    Exit;
  end;
  AEditValue := ARecord.Values[tvFilmsPHOTO.Index];
  if VarIsStr(AEditValue) or VarIsArray(AEditValue) then
  begin
    APicture := TPicture.Create;
    try
      LoadPicture(APicture,
        TcxImageProperties(tvFilmsPHOTO.Properties).GraphicClass, AEditValue);
      AHeight := APicture.Height;
      AHeight := AHeight * FCurrentZoom div 100;
    finally
      APicture.Free;
    end;
  end;
end;

function TCustomRowHeightDemoMainForm.GetZoomByMenuItem(AMenuItemIndex: Integer): Integer;
const
  Zoom: array[0..3] of Integer = (100, 75, 50, 25);
begin
  Result := Zoom[AMenuItemIndex];
end;

end.
