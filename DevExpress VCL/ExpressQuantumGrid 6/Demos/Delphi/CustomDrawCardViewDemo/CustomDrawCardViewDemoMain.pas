unit CustomDrawCardViewDemoMain;

{$I ..\..\cxVer.inc}

interface

uses
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxLookupGrid, cxLookupDBGrid, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid,
  cxGridCardView, cxGridDBCardView, cxMaskEdit, StdCtrls, ExtCtrls,
  cxContainer, cxEdit, cxTextEdit, cxDropDownEdit, cxDBEdit, cxStyles,
  Menus, ActnList, ImgList, ComCtrls, cxLookAndFeels, cxGraphics,
  ToolWin, cxCustomData, cxFilter, cxData, DB, cxDBData,
  cxClasses, cxDataStorage, cxDBLookupComboBox, cxBlobEdit, DemoUtils;

type
  TCustomDrawCardViewDemoMainForm = class(TForm)
    mmMain: TMainMenu;
    miAbout: TMenuItem;
    miFile: TMenuItem;
    miOptions: TMenuItem;
    miExit: TMenuItem;
    sbMain: TStatusBar;
    lbDescrip: TLabel;
    miSeparator1: TMenuItem;
    miLookFeel: TMenuItem;
    miKind: TMenuItem;
    miFlat: TMenuItem;
    miStandard: TMenuItem;
    miUltraFlat: TMenuItem;
    miNativeStyle: TMenuItem;
    miSeparator4: TMenuItem;
    ilPics: TImageList;
    miBlue: TMenuItem;
    miGold: TMenuItem;
    miGreen: TMenuItem;
    miGrey: TMenuItem;
    pnPersonLines: TPanel;
    pnPersonLinesCaption: TPanel;
    tvPersonLine: TcxGridDBTableView;
    lvPersonLine: TcxGridLevel;
    cxgPersonLine: TcxGrid;
    pnPersons: TPanel;
    cxgPersons: TcxGrid;
    cvPersons: TcxGridDBCardView;
    lvPersons: TcxGridLevel;
    Splitter: TSplitter;
    pnPersonsCaption: TPanel;
    tvPersonLineNAME: TcxGridDBColumn;
    cvPersonsFIRSTNAME: TcxGridDBCardViewRow;
    cvPersonsSECONDNAME: TcxGridDBCardViewRow;
    cvPersonsGENDER: TcxGridDBCardViewRow;
    cvPersonsBIRTHNAME: TcxGridDBCardViewRow;
    cvPersonsDATEOFBIRTH: TcxGridDBCardViewRow;
    cvPersonsBIRTHCOUNTRY: TcxGridDBCardViewRow;
    cvPersonsLOCATIONOFBIRTH: TcxGridDBCardViewRow;
    cvPersonsBIOGRAPHY: TcxGridDBCardViewRow;
    cvPersonsNICKNAME: TcxGridDBCardViewRow;
    miCustomDrawStyles: TMenuItem;
    miGradient: TMenuItem;
    miBackgroundImage: TMenuItem;
    miCar: TMenuItem;
    miSky: TMenuItem;
    miLoadImage: TMenuItem;
    OpenDialog: TOpenDialog;
    miDefaultDrawing: TMenuItem;
    FontDialog: TFontDialog;
    miFont: TMenuItem;
    miDependOnDataDrawing: TMenuItem;
    miEgypt: TMenuItem;
    miTile: TMenuItem;
    miMyFace: TMenuItem;
    LookAndFeelController: TcxLookAndFeelController;
    procedure miAboutClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miNativeStyleClick(Sender: TObject);
    procedure miLookAndFeelKindClick(Sender: TObject);
    procedure cvPersonsCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure miBlueClick(Sender: TObject);
    procedure miGreenClick(Sender: TObject);
    procedure miGoldClick(Sender: TObject);
    procedure miGreyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure miCarClick(Sender: TObject);
    procedure miSkyClick(Sender: TObject);
    procedure miLoadClick(Sender: TObject);
    procedure miDefaultDrawingClick(Sender: TObject);
    procedure miFontClick(Sender: TObject);
    procedure miDependOnDataDrawingClick(Sender: TObject);
    procedure miMyFaceClick(Sender: TObject);
    procedure miEgyptClick(Sender: TObject);
    procedure miTileClick(Sender: TObject);
  private
    FColorScheme: TColorScheme;
    FCustomDrawingStyle: TCustomDrawingStyle;
    FCarBitmap, FSkyBitmap, FUserDefinedImage, FCurrentBitmap,
      FEgyptBitmap, FMyFaceBitmap, FTileBitmap: TBitMap;
    FFont: TFont;
    procedure GridsStyles;
    procedure AssignCustomDrawProc;
    procedure UncheckMenuItem(AMenuItem: TMenuItem);
    procedure SetBkImage(AMenuItem: TMenuItem; ABitMap: TBitMap);
    procedure SetGradientColor(AMenuItem: TMenuItem;
      AColorScheme: TColorScheme; ABackGroudStyleIndex: Integer);
  end;

var
  CustomDrawCardViewDemoMainForm: TCustomDrawCardViewDemoMainForm;

implementation

{$R *.dfm}

uses
  CustomDrawCardViewDemoData, AboutDemoForm;

procedure TCustomDrawCardViewDemoMainForm.FormCreate(Sender: TObject);
begin
  FColorScheme := csBlue;
  GridsStyles;

  FCustomDrawingStyle := cdsBkImage;

  FFont := TFont.Create;
  FFont.Assign(cxgPersons.Font);

  FCarBitmap := TBitMap.Create;
  LoadImageFromRes(FCarBitmap, 'CAR');

  FSkyBitmap := TBitMap.Create;
  LoadImageFromRes(FSkyBitmap, 'SKY');

  FEgyptBitmap := TBitmap.Create;
  LoadImageFromRes(FEgyptBitmap, 'EGYPT');

  FMyFaceBitmap := TBitmap.Create;
  LoadImageFromRes(FMyFaceBitmap, 'MYFACE');

  FTileBitmap := TBitmap.Create;
  LoadImageFromRes(FTileBitmap, 'TILE');

  FUserDefinedImage := TBitmap.Create;
  FCurrentBitmap := FTileBitmap;
end;

procedure TCustomDrawCardViewDemoMainForm.FormDestroy(Sender: TObject);
begin
  FCurrentBitmap := nil;
  FUserDefinedImage.Free;
  FEgyptBitmap.Free;
  FMyFaceBitmap.Free;
  FTileBitmap.Free;
  FCarBitmap.Free;
  FSkyBitmap.Free;
end;

procedure TCustomDrawCardViewDemoMainForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TCustomDrawCardViewDemoMainForm.cvPersonsCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  ARec: TRect;
  ATextToDraw: String;
  ABool: Boolean;
  AIsVertical: Boolean;
  procedure SetTextToDraw;
  begin
    if (AViewInfo is TcxGridCardRowDataViewInfo) then
    begin
      if (AViewInfo.Item.Index = cvPersonsGENDER.Index) then
      begin
        if VarAsType(AViewInfo.GridRecord.Values[cvPersonsGENDER.Index], varBoolean) then
          ATextToDraw := 'Male'
        else
          ATextToDraw := 'Female';
      end
      else
        ATextToDraw := AViewInfo.GridRecord.DisplayTexts[AViewInfo.Item.Index];
    end
    else
      ATextToDraw := VarAsType(AViewInfo.Item.Caption, varString);
  end;

begin
  ARec := AViewInfo.Bounds;
  ACanvas.Canvas.Font.Assign(FFont);
  SetTextToDraw;
  case FCustomDrawingStyle of
    cdsBkImage:
      ACanvas.FillRect(ARec, FCurrentBitmap);
    cdsGradient:
    begin
      AIsVertical := (FColorScheme = csGrey) or (FColorScheme = csGold);
      if AViewInfo is TcxGridCardRowDataViewInfo then
        DrawGradient(ACanvas.Canvas, ARec, ColorScheme[Integer(FColorScheme), 1], ColorScheme[Integer(FColorScheme), 0], 40, AIsVertical)
      else
        DrawGradient(ACanvas.Canvas, ARec, ColorScheme[Integer(FColorScheme), 0], ColorScheme[Integer(FColorScheme), 1], 40, AIsVertical);
    end;
    cdsDependOnData:
    begin
      ACanvas.Canvas.Brush.Style := bsSolid;
      ACanvas.Canvas.Brush.Color := clBlueLight;
      ACanvas.Canvas.FillRect(ARec);
      if VarAsType(AViewInfo.GridRecord.Values[cvPersonsGENDER.Index], varBoolean) then
        ACanvas.Canvas.Font.Color := clBlue
      else
        ACanvas.Canvas.Font.Color := clFuchsia;
      if (AViewInfo is TcxGridCardRowDataViewInfo) and (AViewInfo.Item.Index = cvPersonsGENDER.Index) then
      begin
        ABool := VarAsType(AViewInfo.GridRecord.Values[cvPersonsGENDER.Index], varBoolean);
        ilPics.Draw(ACanvas.Canvas, ARec.Left + 2, ARec.Top, Integer(ABool));
        ATextToDraw := '';
      end;
    end;
  end;

  SetBkMode(ACanvas.Canvas.Handle, TRANSPARENT);
  ACanvas.DrawText(ATextToDraw, TcxCustomTextEditViewInfo(AViewInfo.EditViewInfo).TextRect, 0);

  ADone := FCustomDrawingStyle <> cdsDefaultDrawing;
end;

procedure TCustomDrawCardViewDemoMainForm.GridsStyles;
begin
  cvPersons.OptionsView.SeparatorColor := ColorScheme[2, 2];
  cvPersons.Styles.Background := CustomDrawCardViewDemoMainDM.StyleRepository.Items[6] as TcxStyle;
end;

procedure TCustomDrawCardViewDemoMainForm.AssignCustomDrawProc;
begin
  if not Assigned(cvPersons.OnCustomDrawCell) then
    cvPersons.OnCustomDrawCell := cvPersonsCustomDrawCell;
end;

procedure TCustomDrawCardViewDemoMainForm.SetGradientColor(AMenuItem: TMenuItem; AColorScheme: TColorScheme; ABackGroudStyleIndex: Integer);
begin
  if (FCustomDrawingStyle <> cdsGradient) or (FColorScheme <> AColorScheme) then
  begin
    FColorScheme := AColorScheme;
    AMenuItem.Checked := True;
    if FCustomDrawingStyle <> cdsGradient then
    begin
      UncheckMenuItem(AMenuItem);
      FCustomDrawingStyle := cdsGradient;
      miGradient.Checked := True;
    end;
    cvPersons.OptionsView.SeparatorColor := ColorScheme[Integer(AColorScheme), 2];
    cvPersons.Styles.Background := CustomDrawCardViewDemoMainDM.StyleRepository.Items[ABackGroudStyleIndex] as TcxStyle;
    AssignCustomDrawProc;
    cvPersons.Painter.Invalidate;
  end;
end;

procedure TCustomDrawCardViewDemoMainForm.miGreenClick(
  Sender: TObject);
begin
  SetGradientColor(Sender as TMenuItem, csGreen, 8);
end;

procedure TCustomDrawCardViewDemoMainForm.miGoldClick(
  Sender: TObject);
begin
  SetGradientColor(Sender as TMenuItem, csGold, 4);
end;

procedure TCustomDrawCardViewDemoMainForm.miGreyClick(
  Sender: TObject);
begin
  SetGradientColor(Sender as TMenuItem, csGrey, 5);
end;

procedure TCustomDrawCardViewDemoMainForm.miBlueClick(
  Sender: TObject);
begin
  SetGradientColor(Sender as TMenuItem, csBlue, 6);
end;

procedure TCustomDrawCardViewDemoMainForm.miLoadClick(
  Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    TMenuItem(Sender).Checked := True;
    if FCustomDrawingStyle <> cdsBkImage then
    begin
      UncheckMenuItem(Sender as TMenuItem);
      GridsStyles;
      FCustomDrawingStyle := cdsBkImage;
      miBackgroundImage.Checked := True;
    end;

    FUserDefinedImage.LoadFromFile(OpenDialog.FileName);
    FCurrentBitmap := FUserDefinedImage;
    AssignCustomDrawProc;
    cvPersons.Painter.Invalidate;
    SetCurrentDir(ExtractFilePath(Application.ExeName));
 end;
end;

procedure TCustomDrawCardViewDemoMainForm.UncheckMenuItem(AMenuItem: TMenuItem);

  function IsLookAndFeelMenuItem(AMenuItem: TMenuItem): Boolean;
  begin
    Result := (AMenuItem.Parent = miKind) or (AMenuItem = miNativeStyle);
  end;

var
  i: Integer;
begin
  for i:=0 to ComponentCount - 1 do
    if (Components[i] is TMenuItem) and (Components[i] <> AMenuItem) and
      (Components[i] as TMenuItem).Checked and
       not IsLookAndFeelMenuItem(Components[i] as TMenuItem) then
        (Components[i] as TMenuItem).Checked := False;
end;

procedure TCustomDrawCardViewDemoMainForm.miDefaultDrawingClick(
  Sender: TObject);
begin
  if not TMenuItem(Sender).Checked then
  begin
    TMenuItem(Sender).Checked := True;
    UncheckMenuItem(Sender as TMenuItem);
    FCustomDrawingStyle := cdsDefaultDrawing;
    cvPersons.OnCustomDrawCell := nil;
    cvPersons.Styles.Background := nil;
    cvPersons.OptionsView.SeparatorColor := clBtnFace;
    cvPersons.Painter.Invalidate;
  end;
end;

procedure TCustomDrawCardViewDemoMainForm.miFontClick(Sender: TObject);
begin
  FontDialog.Font.Assign(FFont);
  if FontDialog.Execute then
  begin
    FFont.Assign(FontDialog.Font);
    cvPersons.Styles.ContentEven.Font.Assign(FontDialog.Font);
    cvPersons.Styles.ContentOdd.Font.Assign(FontDialog.Font);
    cvPersons.LayoutChanged(False);
    cvPersons.Painter.Invalidate;
  end;
end;

procedure TCustomDrawCardViewDemoMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TCustomDrawCardViewDemoMainForm.miNativeStyleClick(Sender: TObject);
begin
  with LookAndFeelController do
  begin
    NativeStyle := not NativeStyle;
    (Sender as TMenuItem).Checked := NativeStyle;
  end;
end;

procedure TCustomDrawCardViewDemoMainForm.miLookAndFeelKindClick(Sender: TObject);
begin
  LookAndFeelController.Kind := TcxLookAndFeelKind(TMenuItem(Sender).MenuIndex);
  (Sender as TMenuItem).Checked := True;
end;

procedure TCustomDrawCardViewDemoMainForm.miDependOnDataDrawingClick(
  Sender: TObject);
begin
  if not TMenuItem(Sender).Checked then
  begin
    TMenuItem(Sender).Checked := True;
    UncheckMenuItem(Sender as TMenuItem);
    FCustomDrawingStyle := cdsDependOnData;
    GridsStyles;
    AssignCustomDrawProc;
    cvPersons.Painter.Invalidate;
  end;
end;

procedure TCustomDrawCardViewDemoMainForm.miEgyptClick(
  Sender: TObject);
begin
  SetBkImage(Sender as TMenuItem, FEgyptBitmap);
end;

procedure TCustomDrawCardViewDemoMainForm.miMyFaceClick(
  Sender: TObject);
begin
  SetBkImage(Sender as TMenuItem, FMyFaceBitMap);
end;

procedure TCustomDrawCardViewDemoMainForm.miTileClick(
  Sender: TObject);
begin
  SetBkImage(Sender as TMenuItem, FTileBitMap);
end;

procedure TCustomDrawCardViewDemoMainForm.miSkyClick(
  Sender: TObject);
begin
  SetBkImage(Sender as TMenuItem, FSkyBitmap);
end;

procedure TCustomDrawCardViewDemoMainForm.miCarClick(
  Sender: TObject);
begin
  SetBkImage(Sender as TMenuItem, FCarBitmap);
end;

procedure TCustomDrawCardViewDemoMainForm.SetBkImage(AMenuItem: TMenuItem; ABitMap: TBitMap);
begin
  if not TMenuItem(AMenuItem).Checked then
  begin
    TMenuItem(AMenuItem).Checked := True;
    if FCustomDrawingStyle <> cdsBkImage then
    begin
      UncheckMenuItem(AMenuItem);
      GridsStyles;
      FCustomDrawingStyle := cdsBkImage;
      miBackgroundImage.Checked := True;
    end;
    FCurrentBitmap := ABitMap;
    AssignCustomDrawProc;
    cvPersons.Painter.Invalidate;
  end;
end;

end.  
