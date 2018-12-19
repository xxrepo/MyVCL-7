unit MainUnit;
{$I sDefs.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  sSkinProvider, sSkinManager, sComboBoxes, ExtCtrls, sPanel, FileCtrl, sScrollBox, UnitFrameDemo,
  ImgList, sStatusBar, sGauge, sCheckbox, ExtDlgs, FrameAbout, ComCtrls, StdCtrls,
  Buttons, sSpeedButton, sComboBox, sHintManager, sDialogs, sMemo, CheckLst, sFrameBar, sLabel, Menus, UnitContact,
  Mask, sMaskEdit, sCustomComboEdit, sTooledit, UnitButtons, sTrackBar, sEdit, ActnList, StdActns, ToolWin, acMagn, XPMan, sListBox,
  acProgressBar, sButton, acAlphaImageList, acAlphaHints, acPNG;

type
  TMainForm = class(TForm)
    ImageList16: TsAlphaImageList;
    sStatusBar1: TsStatusBar;
    sGauge3: TsGauge;
    ImageList24: TsAlphaImageList;
    sFrameLookBar1: TsFrameBar;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    AvailableSkinsMenu: TMenuItem;
    About1: TMenuItem;
    Skinned1: TMenuItem;
    Enabled1: TMenuItem;
    SkinsPanel: TsPanel;
    SkinsListBox: TsListBox;
    SkinsDirectoryEdit: TsDirectoryEdit;
    sSkinProvider1: TsSkinProvider;
    N1: TMenuItem;
    BuildinSkins: TMenuItem;
    ExternalSkins: TMenuItem;
    PopupMenu1: TPopupMenu;
    Skinned2: TMenuItem;
    Hints2: TMenuItem;
    Enabled2: TMenuItem;
    Exit2: TMenuItem;
    MainActionList: TActionList;
    ActionSkinned: TAction;
    ActionHintsDisable: TAction;
    ActionEnabled: TAction;
    ActionClose: TWindowClose;
    ActionOverView: TAction;
    ActionAnimation: TAction;
    Allowanimation1: TMenuItem;
    Allowanimation2: TMenuItem;
    N3: TMenuItem;
    ActionHintsSkinned: TAction;
    ActionHintsCustom: TAction;
    Skinnedhints1: TMenuItem;
    Customhints1: TMenuItem;
    Hintskind1: TMenuItem;
    Hintsshowing1: TMenuItem;
    Custom1: TMenuItem;
    Skinned3: TMenuItem;
    Disabled1: TMenuItem;
    sSkinManager1: TsSkinManager;
    sMagnifier1: TsMagnifier;
    Openmagnifier1: TMenuItem;
    Dialogs1: TMenuItem;
    Standard1: TMenuItem;
    miOpenDialog1: TMenuItem;
    miSaveDialog1: TMenuItem;
    miOpenPictureDialog1: TMenuItem;
    miSavePictureDialog1: TMenuItem;
    miFontDialog1: TMenuItem;
    miColorDialog1: TMenuItem;
    miPrintDialog1: TMenuItem;
    miPrinterSetupDialog1: TMenuItem;
    Additional1: TMenuItem;
    miAlphaColorDialog1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    OpenPictureDialog2: TOpenPictureDialog;
    SavePictureDialog1: TSavePictureDialog;
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    PrintDialog1: TPrintDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    FindDialog1: TFindDialog;
    ReplaceDialog1: TReplaceDialog;
    miFindDialog1: TMenuItem;
    miReplaceDialog1: TMenuItem;
    SelectSkin1: TMenuItem;
    N2: TMenuItem;
    sColorDialog1: TsColorDialog;
    SelectSkindialog1: TMenuItem;
    ActionCloseForm: TAction;
    ImageList32: TsAlphaImageList;
    ActionHintsStd: TAction;
    sAlphaHints1: TsAlphaHints;
    Standard2: TMenuItem;
    Standard3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    ImgList_MultiState: TsAlphaImageList;
    ImgList_Multi16: TsAlphaImageList;
    sTrackBar3: TsTrackBar;
    Image1: TImage;
    sLabelFX1: TsLabelFX;
    sCoolBar1: TsPanel;
    sPanel1: TsPanel;
    sStickyLabel1: TsStickyLabel;
    sStickyLabel3: TsStickyLabel;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sTrackBar1: TsTrackBar;
    sTrackBar2: TsTrackBar;
    sSpeedButton3: TsSpeedButton;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    sSpeedButton5: TsSpeedButton;
    sSpeedButton4: TsSpeedButton;
    sBitBtn1: TsSpeedButton;
    sPanel2: TsPanel;
    sPanel3: TsPanel;
    sCheckBox1: TsCheckBox;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure sSkinManager1AfterChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FrameDemo1Items0CreateFrame(Sender: TObject; var Frame: TCustomFrame);
    procedure sFrameLookBar1Items2CreateFrame(Sender: TObject; var Frame: TCustomFrame);
    procedure sFrameLookBar1Items3CreateFrame(Sender: TObject; var Frame: TCustomFrame);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure SkinMenuClick(Sender: TObject);
    procedure SkinsListBoxClick(Sender: TObject);
    procedure SkinsDirectoryEditChange(Sender: TObject);
    procedure sSkinManager1BeforeChange(Sender: TObject);
    procedure sSkinManager1GetMenuExtraLineData(FirstItem: TMenuItem; var SkinSection, Caption: String; var Glyph: TBitmap; var LineVisible: Boolean);
    procedure ActionSkinnedExecute(Sender: TObject);
    procedure ActionHintsDisableExecute(Sender: TObject);
    procedure ActionEnabledExecute(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionOverViewExecute(Sender: TObject);
    procedure ActionAnimationExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sSkinProvider1TitleButtons0MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ActionHintsSkinnedExecute(Sender: TObject);
    procedure ActionHintsCustomExecute(Sender: TObject);
    procedure sLabelFX1MouseEnter(Sender: TObject);
    procedure sLabelFX1MouseLeave(Sender: TObject);
    procedure sLabelFX1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Openmagnifier1Click(Sender: TObject);
    procedure sHintManager1ShowHint(var HintStr: String; var CanShow: Boolean; var HintInfo: THintInfo; var Frame: TFrame);
    procedure miOpenDialog1Click(Sender: TObject);
    procedure miSaveDialog1Click(Sender: TObject);
    procedure miOpenPictureDialog1Click(Sender: TObject);
    procedure miSavePictureDialog1Click(Sender: TObject);
    procedure miFontDialog1Click(Sender: TObject);
    procedure miColorDialog1Click(Sender: TObject);
    procedure miPrintDialog1Click(Sender: TObject);
    procedure miPrinterSetupDialog1Click(Sender: TObject);
    procedure miFindDialog1Click(Sender: TObject);
    procedure miReplaceDialog1Click(Sender: TObject);
    procedure SelectSkin1Click(Sender: TObject);
    procedure miAlphaColorDialog1Click(Sender: TObject);
    procedure sMagnifier1DblClick(Sender: TObject);
    procedure ActionCloseFormExecute(Sender: TObject);
    procedure sTrackBar1Change(Sender: TObject);
    procedure sTrackBar2Change(Sender: TObject);
    procedure ActionHintsStdExecute(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure sTrackBar3Change(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure sSpeedButton5Click(Sender: TObject);
    procedure sSpeedButton4Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sStatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
    procedure Button1Click(Sender: TObject);
  public
    PressedBtn : TObject;
    procedure UpdateFrame(Sender : TObject = nil);
    procedure GenerateSkinsList;
  end;

var
  IniName : string;
  MainForm: TMainForm;
  Loading : boolean;
  OldFrame, CurrentFrame : TFrame;
  Animated : boolean = True;
  DialogLoading : boolean = False;

  AppLoading : boolean;         // Prevent of frame animation while app loading
  FormShowed : boolean = False; // This variable used in first form initialization
  // in the OnShow event. Used for preventing of repeated init after each form recreating.
  // Form.OnShow event is processed after each switching to skinned or non-skinned mode.

implementation

uses sMaskData, sStyleSimply, sSkinProps, ShellApi, sMessages, sStoreUtils, sGraphUtils, sVclUtils,
  UnitBarControls, UnitInvisible, sHintDesigner, acntUtils, sConst, acSelectSkin, sCommonData, UnitHints;

{$R *.DFM}

procedure TMainForm.FormShow(Sender: TObject);
begin
Exit;


  if FormShowed then Exit;
  AppLoading := True;
  FormShowed := True; // preventing of repeated initialization
  SkinsDirectoryEdit.Text := sSkinManager1.GetFullSkinDirectory;

  // Opening the first framebar item ( TFrameBarControls )
  sFrameLookBar1.OpenItem(0, True);

  // Example of access to the frame (click on sBitBtn5)
  TFrameBarControls(sFrameLookBar1.Items[0].Frame).sBitBtn5.OnClick(TFrameBarControls(sFrameLookBar1.Items[0].Frame).sBitBtn5);

  // Available skins searching
  GenerateSkinsList;
  AppLoading := False;
end;

procedure TMainForm.sSkinManager1AfterChange(Sender: TObject);
var
  i : integer;
  b : boolean;
begin   exit;


  i := sSkinManager1.GetSkinIndex(s_Form);
  if sSkinManager1.IsValidSkinIndex(i) then begin
    i := SkinsListBox.Items.IndexOf(sSkinManager1.SkinName);
    if i <> SkinsListBox.ItemIndex then begin
      Loading := True;
      SkinsListBox.Items.BeginUpdate;
      SkinsListBox.ItemIndex := i;
      SkinsListBox.Items.EndUpdate;
      Loading := False;
    end;
    b := True;
    for i := 0 to Buildinskins.Count - 1 do // Search of item with current skin name
      if b and (DelChars(Buildinskins.Items[i].Caption, '&') = sSkinManager1.SkinName) then begin
        Buildinskins.Items[i].Checked := True;
        b := False;
      end else Buildinskins.Items[i].Checked := False;
    for i := 0 to Externalskins.Count - 1 do // Search of item with current skin name
      if b and (DelChars(Externalskins.Items[i].Caption, '&') = sSkinManager1.SkinName) then begin
        Externalskins.Items[i].Checked := True;
        b := False;
      end else Externalskins.Items[i].Checked := False;
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not IsZoomed(Handle) then begin
    try
      // Save window position in Ini-file if it's possible
      sStoreUtils.WriteIniStr('Demo', 'Top', IntToStr(Top), IniName);
    finally
      sStoreUtils.WriteIniStr('Demo', 'Left', IntToStr(Left), IniName);
    end;
  end;
end;

procedure TMainForm.UpdateFrame(Sender : TObject);
var
  wTime : word;
begin
  if Animated then wTime := 100 else wTime := 0;
  if Assigned(MainForm) and Assigned(CurrentFrame) then begin
    if Sender <> nil then TsSpeedButton(Sender).ImageIndex := 1;
    CurrentFrame.Visible := False;
    CurrentFrame.SetBounds(Mainform.sFrameLookBar1.Left + Mainform.sFrameLookBar1.Width + 6, Mainform.sFrameLookBar1.Top,
                           SkinsPanel.Left - Mainform.sFrameLookBar1.Width - Mainform.sFrameLookBar1.Left - 12, Mainform.sFrameLookBar1.Height);
    CurrentFrame.Parent := MainForm;
    if Animated then begin
      if Assigned(OldFrame) then FreeAndNil(OldFrame);
      Application.ProcessMessages;
    end;
    if not ActionOverView.Enabled then begin
      ActionOverView.Enabled := True;
      sSkinProvider1.RepaintMenu;
    end;
    if sSkinManager1.Active and not AppLoading then begin
      PrepareForAnimation(CurrentFrame);
      CurrentFrame.Visible := True;
      AnimShowControl(CurrentFrame, wTime{, 255, atAero});
    end
    else begin
      CurrentFrame.Visible := True;
      CurrentFrame.Repaint
    end;
    if Assigned(OldFrame) then FreeAndNil(OldFrame);       
  end;
end;

procedure TMainForm.FrameDemo1Items0CreateFrame(Sender: TObject; var Frame: TCustomFrame);
begin Frame := TFrameBarControls.Create(nil) end;

procedure TMainForm.sFrameLookBar1Items2CreateFrame(Sender: TObject; var Frame: TCustomFrame);
begin Frame := TFrameInvisible.Create(nil) end;

procedure TMainForm.sFrameLookBar1Items3CreateFrame(Sender: TObject; var Frame: TCustomFrame);
begin
  Frame := TFrameContact.Create(nil);
  // Controls initialization
  TFrameContact(Frame).sCheckBox1.Checked := beMouseEnter in sSkinManager1.AnimEffects.Buttons.Events;
  TFrameContact(Frame).sCheckBox2.Checked := beMouseLeave in sSkinManager1.AnimEffects.Buttons.Events;
  TFrameContact(Frame).sCheckBox3.Checked := beMouseDown in sSkinManager1.AnimEffects.Buttons.Events;
  TFrameContact(Frame).sCheckBox4.Checked := beMouseup in sSkinManager1.AnimEffects.Buttons.Events;
end;

procedure TMainForm.sSpeedButton1Click(Sender: TObject);
begin
  ActionAnimation.Execute;
end;

procedure TMainForm.SkinMenuClick(Sender: TObject);
begin
  sSkinManager1.SkinName := DelChars(TMenuItem(Sender).Caption, '&');
end;

procedure TMainForm.SkinsListBoxClick(Sender: TObject);
begin
  if not Loading and (sSkinManager1.SkinName <> SkinsListBox.Items[SkinsListBox.ItemIndex]) then begin
    sSkinManager1.SkinName := SkinsListBox.Items[SkinsListBox.ItemIndex];
  end;
end;

procedure TMainForm.SkinsDirectoryEditChange(Sender: TObject);
begin
  if DirectoryExists(SkinsDirectoryEdit.Text) and (sSkinManager1.SkinDirectory <> SkinsDirectoryEdit.Text) then begin
    sSkinManager1.SkinDirectory := SkinsDirectoryEdit.Text;
    GenerateSkinsList;
  end;
end;

procedure TMainForm.GenerateSkinsList;
var
  sl : TacStringList;
  i : integer;
  mi : TMenuItem;
begin
  sl := TacStringList.Create;
  sSkinManager1.GetSkinNames(sl);
  SkinsListBox.Items.BeginUpdate;
  SkinsListBox.Clear;
  for i := 0 to sl.Count - 1 do SkinsListBox.Items.Add(sl[i]);
  SkinsListBox.Items.EndUpdate;
  // If no available skins...
  if SkinsListBox.Items.Count < 1 then SkinsListBox.Items.Add('No skins available');
  FreeAndNil(sl);
  // Menu update
  Buildinskins.Clear;
  // Build-in skins list
  for i := 0 to sSkinManager1.InternalSkins.Count - 1 do begin
    mi := TMenuItem.Create(Application);
    mi.Caption := sSkinManager1.InternalSkins[i].Name;
    if mi.Caption = sSkinManager1.SkinName then mi.Checked := True;
    mi.OnClick := SkinMenuClick;
    mi.RadioItem := True;
    Buildinskins.Add(mi);
  end;
  // External skins list
  Externalskins.Clear;
  sl := TacStringList.Create;
  sSkinManager1.GetExternalSkinNames(sl);
  if sl.Count > 0 then begin
    sl.Sort;
    for i := 0 to sl.Count - 1 do begin
      mi := TMenuItem.Create(Application);
      mi.Caption := sl[i];
      if mi.Caption = sSkinManager1.SkinName then mi.Checked := True;
      mi.OnClick := SkinMenuClick;
      mi.RadioItem := True;
      if (i <> 0) and (i mod 20 = 0) then mi.Break := mbBreak;
      Externalskins.Add(mi);
    end;
  end;
  FreeAndNil(sl);
end;

procedure TMainForm.sSkinManager1BeforeChange(Sender: TObject);
begin   exit;
  // Reset color options to 0
  sLabel1.Caption := '0';
  sLabel2.Caption := sLabel1.Caption;
  sSkinManager1.FHueOffset := 0;
  sSkinManager1.FSaturation := sSkinManager1.FHueOffset;
  sTrackBar1.Position := sSkinManager1.FHueOffset;
  sTrackBar2.Position := sSkinManager1.FSaturation;
end;

procedure TMainForm.sSkinManager1GetMenuExtraLineData(FirstItem: TMenuItem; var SkinSection, Caption: String; var Glyph: TBitmap; var LineVisible: Boolean);
  procedure PrepareGlyph;
  begin
    Glyph := TBitmap.Create;
    // Prepare transparent background
    Glyph.Canvas.Brush.Color := clFuchsia;
    Glyph.Canvas.FillRect(Rect(0, 0, Glyph.Width, Glyph.Height));
    Glyph.Transparent := True;
    // Receiving from imagelist
    ImageList24.DrawingStyle := dsTransparent;
    ImageList24.GetBitmap(12, Glyph);
  end;
begin   exit;
  // If item is a first subitem of 'Available skins' (in system menu)
  if (sSkinProvider1.SystemMenu.Items[0].Name = s_SkinSelectItemName) and
       (sSkinProvider1.SystemMenu.Items[0].Count > 8) and // Height of popup-menu must be higher then extra-line width...
         (FirstItem = sSkinProvider1.SystemMenu.Items[0].Items[0]) then begin
    LineVisible := True; // External line available
    Caption := sSkinProvider1.SystemMenu.Items[0].Caption;
    PrepareGlyph;
  end
  else if (Externalskins.Count > 8) and (FirstItem = Externalskins.Items[0]) then begin
    LineVisible := True;
    Caption := Externalskins.Caption;
    PrepareGlyph;
  end
  else if (FirstItem = PopupMenu1.Items[0]) then begin
    LineVisible := True; 
    Caption := 'Managing';
  end
  else LineVisible := False;
end;

procedure TMainForm.ActionSkinnedExecute(Sender: TObject);
begin
  ActionSkinned.Checked := not ActionSkinned.Checked;
  AvailableSkinsMenu.Enabled := ActionSkinned.Checked;
  sSkinManager1.Active := ActionSkinned.Checked;
  SkinsDirectoryEdit.Enabled := ActionSkinned.Checked;
  SkinsListBox.Enabled := ActionSkinned.Checked;
  sTrackBar1.Enabled := ActionSkinned.Checked;
  sTrackBar2.Enabled := ActionSkinned.Checked;
end;

procedure TMainForm.ActionHintsDisableExecute(Sender: TObject);
begin
  if not ActionHintsDisable.Checked then begin
    ActionHintsDisable.Checked := True;
    ActionHintsCustom.Checked := False;
    ActionHintsSkinned.Checked := False;
    ActionHintsStd.Checked := False;
    ShowHint := False;
    sAlphaHints1.Active := not ActionHintsStd.Checked;
    if CurrentFrame is TFrameHints then TFrameHints(CurrentFrame).UpdateStates
  end;
end;

procedure TMainForm.ActionEnabledExecute(Sender: TObject);
  procedure EnableControl(Control : TWinControl; Value : boolean);
  var
    i : integer;
  begin
    for i := 0 to Control.ControlCount - 1 do begin
      if (Control.Controls[i].Tag = 5) then TControl(Control.Controls[i]).Enabled := Value;
      if (Control.Controls[i] is TWinControl) then EnableControl(TWinControl(Control.Controls[i]), Value);
    end;
  end;
begin
  ActionEnabled.Checked := not ActionEnabled.Checked;
  EnableControl(Self, ActionEnabled.Checked);
end;

procedure TMainForm.ActionCloseExecute(Sender: TObject); begin Close end;

procedure TMainForm.ActionOverViewExecute(Sender: TObject);
begin
  if Assigned(CurrentFrame) then OldFrame := CurrentFrame;
  CurrentFrame := TFrameAbout.Create(MainForm);
  MainForm.UpdateFrame;
  ActionOverView.Enabled := False;
  sSkinProvider1.RepaintMenu;
end;

procedure TMainForm.ActionAnimationExecute(Sender: TObject);
begin
  Animated := not ActionAnimation.Checked; // Saving option in variable
  ActionAnimation.Checked := Animated;
  if Animated then begin
    sSpeedButton1.Caption := 'Stop'#13#10'animation';
    sSpeedButton1.ImageIndex := 0;
  end
  else begin
    sSpeedButton1.Caption := 'Allow'#13#10'animation';
    sSpeedButton1.ImageIndex := 1;
  end;
  with sSkinManager1.AnimEffects do begin
    FormShow.Time := integer(Animated) * 100;
    FormHide.Time := FormShow.Time;
    DialogShow.Time := FormShow.Time;
    DialogHide.Time := FormShow.Time;
    PageChange.Time := FormShow.Time;
    SkinChanging.Time := FormShow.Time * 2;
  end;
  if Animated
    then sSkinManager1.AnimEffects.Buttons.Events := [beMouseEnter, beMouseLeave, beMouseDown, beMouseUp]
    else sSkinManager1.AnimEffects.Buttons.Events := [];
  sFrameLookBar1.Animation := Animated;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  l, t : integer;
begin    exit;



  IniName := ExtractFilePath(Application.ExeName) + 'ASkinDemo.ini';
  if not acDirExists(sSkinManager1.SkinDirectory) then sSkinManager1.SkinDirectory := ExtractFilePath(Application.ExeName) + 'Skins';
{$IFNDEF DISABLEPREVIEWMODE}
  if (ParamCount > 0) and (ParamStr(1) = s_PreviewKey) then ActionAnimation.Execute; // If called from the SkinEditor for a skin preview (Skin Edit mode)
{$ENDIF}
  // Disable hints on start
  ActionHintsDisable.Execute;
  sSkinProvider1.AddedTitle.Text := ' ( version ' + sSkinManager1.Version + ' )';
  // Restore the form position
  t := sStoreUtils.ReadIniInteger('Demo', 'Top', -1, IniName);
  l := sStoreUtils.ReadIniInteger('Demo', 'Left', -1, IniName);
  if (t <> -1) and (l <> -1) then begin
    SetBounds(l, t, Width, Height);
    Position := poDesigned;
  end;
  // Select a required skin
//  sSkinManager1.SkinName := 'Air (internal)';
end;

procedure TMainForm.sSkinProvider1TitleButtons0MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  sMagnifier1.Execute
end;

procedure TMainForm.ActionHintsSkinnedExecute(Sender: TObject);
begin
  if not ActionHintsSkinned.Checked then begin
    ActionHintsSkinned.Checked := True;
    ActionHintsCustom.Checked := False;
    ActionHintsDisable.Checked := False;
    ActionHintsStd.Checked := False;
    sAlphaHints1.UseSkinData := True;
    ShowHint := True;
    sAlphaHints1.Active := not ActionHintsStd.Checked;
    if CurrentFrame is TFrameHints then TFrameHints(CurrentFrame).UpdateStates
  end;
end;

procedure TMainForm.ActionHintsCustomExecute(Sender: TObject);
begin
  if not ActionHintsCustom.Checked then begin
    ActionHintsCustom.Checked := True;
    ActionHintsSkinned.Checked := False;
    ActionHintsDisable.Checked := False;
    ActionHintsStd.Checked := False;
    sAlphaHints1.UseSkinData := False;
    ShowHint := True;
    sAlphaHints1.Active := not ActionHintsStd.Checked;
    if CurrentFrame is TFrameHints then TFrameHints(CurrentFrame).UpdateStates
  end;
end;

procedure TMainForm.sLabelFX1MouseEnter(Sender: TObject);
begin
  // Switching the label to unskinned mode
  if sSkinManager1.Active and (sSkinManager1.gd[sSkinManager1.ConstData.IndexGLobalInfo].FontColor[3] <> -1) {If is defined} then begin
    sLabelFX1.Kind.Color := sSkinManager1.gd[sSkinManager1.ConstData.IndexGLobalInfo].FontColor[3];
  end
  else sLabelFX1.Kind.Color := clRed;
  sLabelFX1.Kind.KindType := ktCustom;
  sLabelFX1.Font.Style := sLabelFX1.Font.Style + [fsUnderLine]
end;

procedure TMainForm.sLabelFX1MouseLeave(Sender: TObject);
begin
  // Switching the label to skinned mode
  sLabelFX1.Font.Style := sLabelFX1.Font.Style - [fsUnderLine];
  sLabelFX1.Kind.KindType := ktSkin;
end;

procedure TMainForm.sLabelFX1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and PtInRect(Rect(0, 0, sLabelFX1.Width, sLabelFX1.Height), Point(x, y)) then begin
    ShellExecute(Application.Handle, 'open', PChar('http://www.alphaskins.com'), nil, nil, SW_SHOWNORMAL);
  end;
end;

procedure TMainForm.OpenMagnifier1Click(Sender: TObject);
begin
  sMagnifier1.Execute;
end;

procedure TMainForm.sHintManager1ShowHint(var HintStr: String; var CanShow: Boolean; var HintInfo: THintInfo; var Frame: TFrame);
var
  si : TacSectionInfo;
begin
  // Hints can use some Html tags if sHintManager1.HTMLMode = True
  HintStr := 'Class name = <b><u>' + HintInfo.HintControl.ClassName + '</u></b><br>Component name = ' + HintInfo.HintControl.Name;
  si.SkinIndex := -1;
  HintInfo.HintControl.Perform(SM_ALPHACMD, MakeWParam(0, AC_GETSKININDEX), integer(@si));
  if si.SkinIndex >= 0 then begin
    HintStr := HintStr + '<br>' + 'SkinData.SkinSection = <b>' + sSkinManager1.gd[si.SkinIndex].ClassName + '<b>';
  end;
end;

procedure TMainForm.miOpenDialog1Click(Sender: TObject);
begin
  OpenDialog1.Execute
end;

procedure TMainForm.miSaveDialog1Click(Sender: TObject);
begin
  SaveDialog1.Execute
end;

procedure TMainForm.miOpenPictureDialog1Click(Sender: TObject);
begin
  OpenPictureDialog2.Execute
end;

procedure TMainForm.miSavePictureDialog1Click(Sender: TObject);
begin
  SavePictureDialog1.Execute
end;

procedure TMainForm.miFontDialog1Click(Sender: TObject);
begin
  FontDialog1.Execute
end;

procedure TMainForm.miColorDialog1Click(Sender: TObject);
begin
  ColorDialog1.Execute
end;

procedure TMainForm.miPrintDialog1Click(Sender: TObject);
begin
  PrintDialog1.Execute
end;
                                     
procedure TMainForm.miPrinterSetupDialog1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute
end;

procedure TMainForm.miFindDialog1Click(Sender: TObject);
begin
  FindDialog1.Execute
end;

procedure TMainForm.miReplaceDialog1Click(Sender: TObject);
begin
  ReplaceDialog1.Execute
end;

procedure TMainForm.SelectSkin1Click(Sender: TObject);
begin
  SelectSkin(sSkinManager1);
end;

procedure TMainForm.miAlphaColorDialog1Click(Sender: TObject);
begin
  sColorDialog1.Execute
end;

procedure TMainForm.sMagnifier1DblClick(Sender: TObject);
begin
  sMagnifier1.Hide
end;

procedure TMainForm.ActionCloseFormExecute(Sender: TObject);
begin
  Close
end;

procedure TMainForm.sTrackBar1Change(Sender: TObject);
begin
  if not aSkinChanging and (sSkinManager1.HueOffset <> sTrackBar1.Position) then begin // If not in a skin changing (global variable from AC package used)
    sSkinManager1.BeginUpdate;
    sLabel1.Caption := IntToStr(sTrackBar1.Position);
    sSkinManager1.HueOffset := sTrackBar1.Position;
    sSkinManager1.EndUpdate(True, False);
  end;
end;

procedure TMainForm.sTrackBar2Change(Sender: TObject);
begin
  if not aSkinChanging and (sSkinManager1.Saturation <> sTrackBar2.Position) then begin // If not in a skin changing (global variable from AC package used)
    sSkinManager1.BeginUpdate;
    sLabel2.Caption := IntToStr(sTrackBar2.Position);
    sSkinManager1.Saturation := sTrackBar2.Position;
    sSkinManager1.EndUpdate(True, False);
  end;
end;

procedure TMainForm.ActionHintsStdExecute(Sender: TObject);
begin
  if not ActionHintsStd.Checked then begin
    ActionHintsStd.Checked := True;
    ActionHintsSkinned.Checked := False;
    ActionHintsDisable.Checked := False;
    ActionHintsCustom.Checked := False;
    sAlphaHints1.UseSkinData := False;
    ShowHint := True;
    sAlphaHints1.Active := not ActionHintsStd.Checked;
    if CurrentFrame is TFrameHints then TFrameHints(CurrentFrame).UpdateStates
  end;
end;

procedure TMainForm.sSpeedButton2Click(Sender: TObject);
begin
  sSkinManager1.Effects.AllowGlowing := not sSkinManager1.Effects.AllowGlowing;
  if sSkinManager1.Effects.AllowGlowing then begin
    sSpeedButton2.ImageIndex := 2;
    sSpeedButton2.Caption := 'Stop'#13#10'glowing';
  end
  else begin
    sSpeedButton2.ImageIndex := 3;
    sSpeedButton2.Caption := 'Allow'#13#10'glowing';
  end;
end;

procedure TMainForm.sTrackBar3Change(Sender: TObject);
begin
  sGauge3.Progress := sTrackBar3.Position
end;

procedure TMainForm.sSpeedButton3Click(Sender: TObject);
begin
  SelectSkin1.Click
end;

procedure TMainForm.sSpeedButton5Click(Sender: TObject);
begin
  sSkinManager1.ExtendedBorders := not sSkinManager1.ExtendedBorders;
end;

procedure TMainForm.sSpeedButton4Click(Sender: TObject);
begin
  ShowHint := sSpeedButton4.Down;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
//  sSkinProvider1.AllowExtBorders := not IsZoomed(MainForm.Handle); // Uncomment this code and ExtendedBorders will be disabled when form is maximized
end;

procedure TMainForm.sStatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
begin 
  if Panel.Index = 2 then begin
    ImageList16.Draw(StatusBar.Canvas, Rect.Left + 2, Rect.Top + 2, 0);
  end;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  sSkinManager1.Active := true;
  //sSkinManager1.SkinName := 'Aluminium';

end;

end.
