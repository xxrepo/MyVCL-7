unit EBarMegaDemoOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Spin, dxsbar, ExtDlgs;

type
  TEBarMegaDemoOptionsForm = class(TForm)
    pgOptions: TPageControl;
    tsSideBar: TTabSheet;
    gbBackgroundColor: TGroupBox;
    lbBeginColor: TLabel;
    pBeginColor: TPanel;
    pEndColor: TPanel;
    lbEndColor: TLabel;
    lbFillStyle: TLabel;
    cbFillStyle: TComboBox;
    ColorDialog: TColorDialog;
    blStep: TLabel;
    seStep: TSpinEdit;
    gbBackgroundPicture: TGroupBox;
    ImSideBarbkPicture: TImage;
    btnLoad: TButton;
    btnClear: TButton;
    OpenPictureDialog: TOpenPictureDialog;
    gbFonts: TGroupBox;
    lbItemFontCaption: TLabel;
    lbGroupFontCaption: TLabel;
    lbGroupFont: TLabel;
    lbItemFont: TLabel;
    beFonts: TBevel;
    spGroupFont: TSpeedButton;
    spItemFont: TSpeedButton;
    FontDialog: TFontDialog;
    gbStyle: TGroupBox;
    Label7: TLabel;
    cbBorderStyle: TComboBox;
    cbPaintStyle: TComboBox;
    Label8: TLabel;
    gbMiscellaneous: TGroupBox;
    cbCanSelected: TCheckBox;
    btnClose: TButton;
    cbShowGroups: TCheckBox;
    gbSideBarPopupmenu: TGroupBox;
    cbIconType: TCheckBox;
    cbAddGroup: TCheckBox;
    cbRemoveGroup: TCheckBox;
    cbCustomize: TCheckBox;
    cbRenameGroup: TCheckBox;
    cbRenameItem: TCheckBox;
    cbRemoveItem: TCheckBox;
    tsBars: TTabSheet;
    gbBackgroundSubMenu: TGroupBox;
    imSubMenuBackground: TImage;
    btnBkSubMenuLoad: TButton;
    btnBkSubMenuClear: TButton;
    gbBackgroundBars: TGroupBox;
    imBarsBackground: TImage;
    btnBkBarsLoad: TButton;
    btnBkBarsClear: TButton;
    rgStyle: TRadioGroup;
    gbBarsMiscellaneous: TGroupBox;
    cbUseF10ForMenu: TCheckBox;
    cbCanCustomize: TCheckBox;
    sbFont: TSpeedButton;
    lbFont: TLabel;
    lbFontName: TLabel;
    cbSunkenBorder: TCheckBox;
    beMiscellaneous: TBevel;
    cbAllowReset: TCheckBox;
    procedure pBeginColorClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure seStepChange(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure spGroupFontClick(Sender: TObject);
    procedure spItemFontClick(Sender: TObject);
    procedure cbCanSelectedClick(Sender: TObject);
    procedure cbFillStyleChange(Sender: TObject);
    procedure cbBorderStyleClick(Sender: TObject);
    procedure cbPaintStyleClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure cbShowGroupsClick(Sender: TObject);
    procedure cbSBPopupMenuClick(Sender: TObject);
    procedure rbStyleClick(Sender: TObject);
    procedure btnBkBarsLoadClick(Sender: TObject);
    procedure btnBkBarsClearClick(Sender: TObject);
    procedure btnBkSubMenuLoadClick(Sender: TObject);
    procedure btnBkSubMenuClearClick(Sender: TObject);
    procedure sbFontClick(Sender: TObject);
    procedure cbUseF10ForMenuClick(Sender: TObject);
    procedure cbCanCustomizeClick(Sender: TObject);
    procedure cbSunkenBorderClick(Sender: TObject);
    procedure cbAllowResetClick(Sender: TObject);
    procedure rgStyleClick(Sender: TObject);
  end;

var
  EBarMegaDemoOptionsForm: TEBarMegaDemoOptionsForm;

implementation

uses EBarMegaDemoMain, dxBar;

{$R *.DFM}

procedure TEBarMegaDemoOptionsForm.pBeginColorClick(Sender: TObject);
begin
 if ColorDialog.Execute then
 begin
   TPanel(Sender).Color := ColorDialog.Color;
   with EBarMegaDemoMainForm.dxSideBar.bkGround do
     case TComponent(Sender).Tag of
       0: BeginColor := pBeginColor.Color;
       1: EndColor := pEndColor.Color;
     end;
 end;
end;

procedure TEBarMegaDemoOptionsForm.FormActivate(Sender: TObject);
begin
  with EBarMegaDemoMainForm.dxSideBar.bkGround do begin
    pBeginColor.Color := BeginColor;
    pEndColor.Color := EndColor;
    case FillStyle of
     bfsHorz : cbFillStyle.ItemIndex := 0;
     bfsNone : cbFillStyle.ItemIndex := 1;
     bfsVert : cbFillStyle.ItemIndex := 2;
    end;
    seStep.Value := Step;
  end;

  with EBarMegaDemoMainForm.dxSideBar do
  begin
    lbItemFont.Caption := ItemFont.Name + ' ('+IntToStr(ItemFont.Size)+')';
    lbGroupFont.Caption := GroupFont.Name + ' ('+IntToStr(GroupFont.Size)+')';
    cbShowGroups.Checked := ShowGroups;
    case BorderStyle of
      bsNone: cbBorderStyle.ItemIndex := 0;
      bsSingle: cbBorderStyle.ItemIndex := 1;
    end;
    case PaintStyle of
      sbpsFlat: cbPaintStyle.ItemIndex := 0;
      sbpsStandard: cbPaintStyle.ItemIndex := 1;
    end;
  end;
  with EBarMegaDemoMainForm.dxSideBarPopupMenu do
  begin
    cbIconType.Checked := sbmIconType in Options;
    cbAddGroup.Checked := sbmAddGroup in Options;
    cbRemoveGroup.Checked := sbmRemoveGroup in Options;
    cbCustomize.Checked := sbmCustomize in Options;
    cbRenameGroup.Checked := sbmRenameGroup in Options;
    cbRenameItem.Checked := sbmRenameItem in Options;
    cbRemoveItem.Checked := sbmRemoveItem in Options;
  end;
  with EBarMegaDemoMainForm.BarManager do
  begin
    lbFontName.Caption := Font.Name + ' ('+IntToStr(Font.Size)+')';
    cbUseF10ForMenu.Checked := UseF10ForMenu;
    cbCanCustomize.Checked := CanCustomize;
    cbSunkenBorder.Checked := SunkenBorder;
    cbAllowReset.Checked := AllowReset;
    rgStyle.ItemIndex := Integer(Style);
  end;
end;

procedure TEBarMegaDemoOptionsForm.seStepChange(Sender: TObject);
begin
  with TSpinEdit(Sender) do
  begin
    if Value < 1 then Value := 1;
    EBarMegaDemoMainForm.dxSideBar.bkGround.Step := seStep.Value;
  end;
end;

procedure TEBarMegaDemoOptionsForm.btnLoadClick(Sender: TObject);
begin
  if OpenPictureDialog.Execute then
  begin
    ImSideBarbkPicture.Picture.LoadFromFile(OpenPictureDialog.FileName);
    EBarMegaDemoMainForm.dxSideBar.bkPicture := ImSideBarbkPicture.Picture;
  end
end;

procedure TEBarMegaDemoOptionsForm.btnClearClick(Sender: TObject);
begin
  ImSideBarbkPicture.Picture := nil;
  EBarMegaDemoMainForm.dxSideBar.bkPicture := nil;
end;

procedure TEBarMegaDemoOptionsForm.spGroupFontClick(Sender: TObject);
begin
  FontDialog.Font := EBarMegaDemoMainForm.dxSideBar.GroupFont;
  if FontDialog.Execute then
  begin
    EBarMegaDemoMainForm.dxSideBar.GroupFont := FontDialog.Font;
    lbGroupFont.Caption := EBarMegaDemoMainForm.dxSideBar.GroupFont.Name + ' ('+IntToStr(EBarMegaDemoMainForm.dxSideBar.GroupFont.Size)+')';
  end;
end;

procedure TEBarMegaDemoOptionsForm.spItemFontClick(Sender: TObject);
begin
  FontDialog.Font := EBarMegaDemoMainForm.dxSideBar.ItemFont;
  if FontDialog.Execute then
  begin
    EBarMegaDemoMainForm.dxSideBar.ItemFont := FontDialog.Font;
    lbItemFont.Caption := EBarMegaDemoMainForm.dxSideBar.ItemFont.Name + ' ('+IntToStr(EBarMegaDemoMainForm.dxSideBar.ItemFont.Size)+')';
  end;  
end;

procedure TEBarMegaDemoOptionsForm.cbCanSelectedClick(Sender: TObject);
begin
  EBarMegaDemoMainForm.dxSideBar.CanSelected := TCheckBox(Sender).Checked;
end;

procedure TEBarMegaDemoOptionsForm.cbFillStyleChange(Sender: TObject);
begin
  with EBarMegaDemoMainForm.dxSideBar.bkGround do
    case TComboBox(Sender).ItemIndex of
     0: FillStyle := bfsHorz;
     1: FillStyle := bfsNone;
     2: FillStyle := bfsVert;
    end;
end;

procedure TEBarMegaDemoOptionsForm.cbBorderStyleClick(Sender: TObject);
begin
  with EBarMegaDemoMainForm.dxSideBar do
    case cbBorderStyle.ItemIndex of
      0: BorderStyle := bsNone;
      1: BorderStyle := bsSingle;
    end;
end;

procedure TEBarMegaDemoOptionsForm.cbPaintStyleClick(Sender: TObject);
begin
  with EBarMegaDemoMainForm.dxSideBar do
   case cbPaintStyle.ItemIndex of
    0: PaintStyle := sbpsFlat;
    1: PaintStyle := sbpsStandard;
   end;
end;

procedure TEBarMegaDemoOptionsForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TEBarMegaDemoOptionsForm.cbShowGroupsClick(Sender: TObject);
begin
  EBarMegaDemoMainForm.dxSideBar.ShowGroups := TCheckBox(Sender).Checked;
end;

procedure TEBarMegaDemoOptionsForm.cbSBPopupMenuClick(Sender: TObject);
var
  pmOption: TdxSideBarPopupMenuOption;
begin
  pmOption := TdxSideBarPopupMenuOption(TCheckBox(Sender).Tag);
  with EBarMegaDemoMainForm.dxSideBarPopupMenu do
  begin
    if TCheckBox(Sender).Checked then
      Options := Options + [pmOption]
    else
      Options := Options - [pmOption];
   end;
end;

procedure TEBarMegaDemoOptionsForm.rbStyleClick(Sender: TObject);
begin
  with EBarMegaDemoMainForm.BarManager do
    Style := TdxBarManagerStyle(TCheckBox(Sender).Tag);
end;

procedure TEBarMegaDemoOptionsForm.btnBkBarsLoadClick(Sender: TObject);
begin
  if OpenPictureDialog.Execute then
  begin
    imBarsBackground.Picture.LoadFromFile(OpenPictureDialog.FileName);
    EBarMegaDemoMainForm.BarManager.Backgrounds.Bar := imBarsBackground.Picture.Bitmap;
  end
end;

procedure TEBarMegaDemoOptionsForm.btnBkBarsClearClick(Sender: TObject);
begin
  imBarsBackground.Picture := nil;
  EBarMegaDemoMainForm.BarManager.Backgrounds.Bar := nil;
end;

procedure TEBarMegaDemoOptionsForm.btnBkSubMenuLoadClick(Sender: TObject);
begin
  if OpenPictureDialog.Execute then
  begin
    imSubMenuBackground.Picture.LoadFromFile(OpenPictureDialog.FileName);
    EBarMegaDemoMainForm.BarManager.Backgrounds.SubMenu := imSubMenuBackground.Picture.Bitmap;
  end;
end;

procedure TEBarMegaDemoOptionsForm.btnBkSubMenuClearClick(Sender: TObject);
begin
  imSubMenuBackground.Picture := nil;
  EBarMegaDemoMainForm.BarManager.Backgrounds.SubMenu := nil;
end;

procedure TEBarMegaDemoOptionsForm.sbFontClick(Sender: TObject);
begin
  FontDialog.Font := EBarMegaDemoMainForm.BarManager.Font;
  if FontDialog.Execute then
  begin
    EBarMegaDemoMainForm.BarManager.Font := FontDialog.Font;
    lbGroupFont.Caption := EBarMegaDemoMainForm.BarManager.Font.Name + ' ('+IntToStr(EBarMegaDemoMainForm.BarManager.Font.Size)+')';
  end;
end;

procedure TEBarMegaDemoOptionsForm.cbUseF10ForMenuClick(Sender: TObject);
begin
  EBarMegaDemoMainForm.BarManager.UseF10ForMenu := TCheckBox(Sender).Checked;
end;

procedure TEBarMegaDemoOptionsForm.cbCanCustomizeClick(Sender: TObject);
begin
  EBarMegaDemoMainForm.BarManager.CanCustomize := TCheckBox(Sender).Checked;
end;

procedure TEBarMegaDemoOptionsForm.cbSunkenBorderClick(Sender: TObject);
begin
  EBarMegaDemoMainForm.BarManager.SunkenBorder := TCheckBox(Sender).Checked;
end;

procedure TEBarMegaDemoOptionsForm.cbAllowResetClick(Sender: TObject);
begin
  EBarMegaDemoMainForm.BarManager.AllowReset := TCheckBox(Sender).Checked;
end;

procedure TEBarMegaDemoOptionsForm.rgStyleClick(Sender: TObject);
begin
  with EBarMegaDemoMainForm.BarManager do
    Style := TdxBarManagerStyle(rgStyle.ItemIndex);
end;

end.
