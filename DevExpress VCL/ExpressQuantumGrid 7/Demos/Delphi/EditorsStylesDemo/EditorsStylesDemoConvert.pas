unit EditorsStylesDemoConvert;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, EditorsStylesDemoBase, cxHint, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxImage, cxDropDownEdit, cxCheckBox, cxLabel, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxContainer, cxEdit, cxTrackBar,
  cxControls, cxGroupBox, cxSpinButton, cxProgressBar, ComCtrls, ExtCtrls,
  cxSplitter, cxPropertiesStore, Menus, jpeg, EditorsStylesDemoUtils, cxMemo,
  ImgList, cxGraphics;

type
  TEditorsStylesDemoConvertFrame = class(TEditorsStylesDemoBaseFrame)
    OpenDialog: TOpenDialog;
    pnlImage: TPanel;
    ScrollBox: TScrollBox;
    cxImage: TcxImage;
    Panel2: TPanel;
    cxSplitter1: TcxSplitter;
    gbConvertingOptions: TcxGroupBox;
    gbImageQuality: TcxGroupBox;
    lbBestQuality: TcxLabel;
    cxBestComp: TcxLabel;
    tbImageQuality: TcxTrackBar;
    cbGrayScale: TcxCheckBox;
    lbProgressive: TcxCheckBox;
    sbImageQuality: TcxSpinButton;
    Panel4: TPanel;
    btnLoadImage: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxProgressBar: TcxProgressBar;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    cxTrackBar: TcxTrackBar;
    cxTextEdit: TcxTextEdit;
    cxSplitter2: TcxSplitter;
    SaveDialog: TSaveDialog;
    Panel3: TPanel;
    bntConvert: TcxButton;
    cxLabel2: TcxLabel;
    ScrollBox1: TScrollBox;
    imgPreview: TcxImage;
    btnPreview: TcxButton;
    gbDisplayOptions: TcxGroupBox;
    lbScale: TcxLabel;
    cbScale: TcxComboBox;
    sbScale: TcxSpinButton;
    meCompressionQuality: TcxMaskEdit;
    procedure btnLoadImageClick(Sender: TObject);
    procedure cxTrackBarPropertiesChange(Sender: TObject);
    procedure cxTextEditPropertiesChange(Sender: TObject);
    procedure bntConvertClick(Sender: TObject);
    procedure tbImageQualityPropertiesChange(Sender: TObject);
    procedure sbImageQualityPropertiesChange(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnGetDrawParams(Sender: TcxCustomButton;
      AState: TcxButtonState; var AColor: TColor; AFont: TFont);
    procedure cbScalePropertiesChange(Sender: TObject);
    procedure sbScalePropertiesEditValueChanged(Sender: TObject);
    procedure cxTrackBarPropertiesGetThumbRect(Sender: TObject;
      var ARect: TRect);
    procedure cxTrackBarPropertiesDrawThumb(Sender: TObject;
      ACanvas: TcxCanvas; const ARect: TRect);
  private
    FBitmap: TBitmap;
    procedure AdjustTrackBarThumb(AStyleSheetType: TcxStyleSheetType;
      ATrackBar: TcxTrackBar; ABitmap: TBitmap);
    function GetJpegOptions: TJPEGOptions;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ChangeDisplayStyle(ADisplayStyle: TcxStyleSheetType); override;
    function GetStyleBackgroundColor: TColor; override;
    function Name: string; override;
    function BriefName: string; override;
    function StylesIniPath: string; override;
    function MenuOpenFileVisible: Boolean; override;
    procedure OpenFile(Sender: TObject); override;
    function Description: String; override;
  end;

var
  EditorsStylesDemoConvertFrame: TEditorsStylesDemoConvertFrame;

implementation

{$R *.dfm}

const
  AThumbImagesPath = 'StylesFrmStylePalette\';

procedure TEditorsStylesDemoConvertFrame.btnLoadImageClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    cxImage.Picture.LoadFromFile(OpenDialog.FileName);
    FFileName := OpenDialog.FileName;
    DoOnFileNameChanged;
    cxImage.Width := cxImage.Picture.Width;
    cxImage.Height := cxImage.Picture.Height;
  end;
end;

procedure TEditorsStylesDemoConvertFrame.cxTrackBarPropertiesChange(Sender: TObject);
begin
  cxImage.Width :=  (cxImage.Picture.Width * cxTrackBar.Position) div 100;
  cxImage.Height := (cxImage.Picture.Height * cxTrackBar.Position) div 100;
  cxProgressBar.Position := cxTrackBar.Position;
end;

procedure TEditorsStylesDemoConvertFrame.cxTextEditPropertiesChange(
  Sender: TObject);
var
  Val: Integer;
begin
  if cxTextEdit.Text <> '' then
  begin
    Val := StrToInt(cxTextEdit.Text);
    cxTrackBar.Properties.Max := Val;
    cxProgressBar.Properties.Max := Val;
    cxProgressBar.Properties.OverloadValue := 100;
    cxProgressBar.Properties.PeakValue := 100;
  end;
end;

constructor TEditorsStylesDemoConvertFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBitmap := TBitmap.Create;
  FBitmap.TransparentColor := clFuchsia;
  FBitmap.Transparent := True;
  if cxImage.Picture <> nil then
  begin
    cxImage.Width := cxImage.Picture.Width;
    cxImage.Height := cxImage.Picture.Height;
  end;
  HintStyle := hcstLightSlideLeft;
  FFileName := 'Untitled';
  FDisplayStyle := shtBrick;
  FTempDisplayStyle := shtBrick;
  btnPreviewClick(Self);
end;

destructor TEditorsStylesDemoConvertFrame.Destroy;
begin
  FBitmap.Free;
  inherited Destroy;
end;

function TEditorsStylesDemoConvertFrame.GetJpegOptions: TJPEGOptions;
begin
  Result.CompressionQuality := meCompressionQuality.EditValue;
  Result.Grayscale := cbGrayScale.Checked;
  Result.ProgressiveEncoding := lbProgressive.Checked;
end;

procedure TEditorsStylesDemoConvertFrame.bntConvertClick(Sender: TObject);
begin
  if SaveDialog.Execute then
    ConvertBitmapToJPEG(cxImage.Picture.Bitmap, SaveDialog.FileName, GetJpegOptions());
end;

procedure TEditorsStylesDemoConvertFrame.tbImageQualityPropertiesChange(
  Sender: TObject);
begin
  sbImageQuality.Value := tbImageQuality.Position;
end;

procedure TEditorsStylesDemoConvertFrame.sbImageQualityPropertiesChange(
  Sender: TObject);
begin
  tbImageQuality.Position := sbImageQuality.Value;
end;

function TEditorsStylesDemoConvertFrame.Name: string;
begin
  Result := 'Image Processing';
end;

function TEditorsStylesDemoConvertFrame.BriefName: string;
begin
  Result := 'Image';
end;

function TEditorsStylesDemoConvertFrame.StylesIniPath: string;
begin
  Result := 'StylesFrmConvert\';
end;

function TEditorsStylesDemoConvertFrame.MenuOpenFileVisible: Boolean;
begin
  Result := True
end;

procedure TEditorsStylesDemoConvertFrame.OpenFile(Sender: TObject);
begin
  btnLoadImageClick(nil);
end;

procedure TEditorsStylesDemoConvertFrame.btnPreviewClick(Sender: TObject);
var
  J: TJPEGImage;
  AJPEGOptions: TJPEGOptions;
begin
  J := TJPEGImage.Create;
  ScrollBox1.Visible := False;
  try
    J.Assign(cxImage.Picture.Graphic);
    AJPEGOptions := GetJPEGOptions;
    J.CompressionQuality := AJPEGOptions.CompressionQuality;
    J.ProgressiveEncoding := AJPEGOptions.ProgressiveEncoding;
    J.ProgressiveDisplay := True;
    J.Compress;
    J.Smoothing := not J.Smoothing;
    imgPreview.Picture.Assign(J);
    TJpegImage(imgPreview.Picture.Graphic).Grayscale := AJPEGOptions.Grayscale;
    TJpegImage(imgPreview.Picture.Graphic).ProgressiveDisplay := True;
    cbScalePropertiesChange(cbScale);
  finally
    ScrollBox1.Visible := True;
    J.Free;
  end;
end;

procedure TEditorsStylesDemoConvertFrame.btnGetDrawParams(
  Sender: TcxCustomButton; AState: TcxButtonState; var AColor: TColor;
  AFont: TFont);
begin
  AFont.Color := Sender.Font.Color;
end;

function TEditorsStylesDemoConvertFrame.GetStyleBackgroundColor: TColor;
begin
  Result := gbConvertingOptions.Color;
end;

function TEditorsStylesDemoConvertFrame.Description: String;
begin
  Result := 'Image Processing Notes';
end;

procedure TEditorsStylesDemoConvertFrame.cbScalePropertiesChange(
  Sender: TObject);
var
  JPEGScale: TJPEGScale;
begin
  JPEGScale := jsFullSize;
  if TcxComboBox(Sender).EditValue = 'Full Size' then
    JPEGScale := jsFullSize else
  if TcxComboBox(Sender).EditValue = 'Half' then
    JPEGScale := jsHalf else
  if TcxComboBox(Sender).EditValue = 'Quarter' then
    JPEGScale := jsQuarter else
  if TcxComboBox(Sender).EditValue = 'Eighth' then
    JPEGScale := jsEighth;
  TJpegImage(imgPreview.Picture.Graphic).Scale := JPEGScale;
end;

procedure TEditorsStylesDemoConvertFrame.sbScalePropertiesEditValueChanged(
  Sender: TObject);
begin
  cbScale.ItemIndex := sbScale.Value;
end;

procedure TEditorsStylesDemoConvertFrame.cxTrackBarPropertiesGetThumbRect(
  Sender: TObject; var ARect: TRect);
begin
  ARect := FBitmap.Canvas.ClipRect;
end;

procedure TEditorsStylesDemoConvertFrame.cxTrackBarPropertiesDrawThumb(
  Sender: TObject; ACanvas: TcxCanvas; const ARect: TRect);
begin
  ACanvas.Draw(ARect.Left, ARect.Top, FBitmap);
end;

procedure TEditorsStylesDemoConvertFrame.ChangeDisplayStyle(
  ADisplayStyle: TcxStyleSheetType);
begin
  inherited ChangeDisplayStyle(ADisplayStyle);
  AdjustTrackBarThumb(ADisplayStyle, cxTrackBar, FBitmap);
end;

procedure TEditorsStylesDemoConvertFrame.AdjustTrackBarThumb(
  AStyleSheetType: TcxStyleSheetType; ATrackBar: TcxTrackBar;
  ABitmap: TBitmap);
begin
    case AStyleSheetType of
    shtWood:
      begin
        ABitmap.LoadFromFile(AThumbImagesPath + 'Wood.bmp');
        ATrackBar.Properties.ThumbType := cxttCustom;
      end;
    shtDeepSea:
      begin
        ABitmap.LoadFromFile(AThumbImagesPath + 'DeepSea.bmp');
        ATrackBar.Properties.ThumbType := cxttCustom;
      end;
  else
    ATrackBar.Properties.ThumbType := cxttRegular;
  end;
end;

initialization
  EditorsStylesDemoFrameManager.RegisterFrameClass(TEditorsStylesDemoConvertFrame);

end.
 
