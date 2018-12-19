unit EBarMDIDemoMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, dxBar, StdCtrls, dxBarExtItems, cxControls,
  ImgList, ActnList, cxLookAndFeels, dxStatusBar, cxGraphics, EBarsUtils,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, dxSkinsdxBarPainter, cxClasses;

type
  TEBarMDIDemoMainForm = class(TForm)
    BarManager: TdxBarManager;

    dxBarButtonNew: TdxBarLargeButton;
    dxBarButtonOpen: TdxBarLargeButton;
    dxBarButtonClose: TdxBarLargeButton;
    dxBarButtonSave: TdxBarLargeButton;
    dxBarButtonSaveAs: TdxBarLargeButton;
    dxBarButtonPrint: TdxBarLargeButton;
    dxBarButtonExit: TdxBarLargeButton;
    dxBarButtonUndo: TdxBarLargeButton;
    dxBarButtonCut: TdxBarLargeButton;
    dxBarButtonCopy: TdxBarLargeButton;
    dxBarButtonPaste: TdxBarLargeButton;
    dxBarButtonClear: TdxBarLargeButton;
    dxBarButtonSelectAll: TdxBarLargeButton;
    dxBarButtonFind: TdxBarLargeButton;
    dxBarButtonReplace: TdxBarLargeButton;
    dxBarComboFontSize: TdxBarCombo;
    dxBarButtonBold: TdxBarLargeButton;
    dxBarButtonItalic: TdxBarLargeButton;
    dxBarButtonUnderline: TdxBarLargeButton;
    dxBarButtonBullets: TdxBarLargeButton;
    dxBarButtonProtected: TdxBarLargeButton;
    dxBarButtonAlignLeft: TdxBarLargeButton;
    dxBarButtonCenter: TdxBarLargeButton;
    dxBarButtonAlignRight: TdxBarLargeButton;
    dxBarButtonFont: TdxBarLargeButton;

    dxBarButtonNewWindow: TdxBarLargeButton;
    dxBarButtonArrangeAll: TdxBarLargeButton;
    dxBarButtonNextWindow: TdxBarLargeButton;
    dxBarButtonPreviousWindow: TdxBarLargeButton;
    dxBarListWindows: TdxBarListItem;

    dxBarSubItemFile: TdxBarSubItem;
    dxBarSubItemEdit: TdxBarSubItem;
    dxBarSubItemFormat: TdxBarSubItem;
    dxBarSubItemWindow: TdxBarSubItem;
    dxBarSubItemHelp: TdxBarSubItem;

    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    PrintDialog: TPrintDialog;
    FontDialog: TFontDialog;
    dxBarPopupMenu: TdxBarPopupMenu;
    dxBarButtonEnhancedStyle: TdxBarLargeButton;
    dxBarMRUFiles: TdxBarMRUListItem;
    dxBarButtonStdStyle: TdxBarLargeButton;
    dxBarButtonFlatStyle: TdxBarLargeButton;
    dxBarDockControl1: TdxBarDockControl;
    dxBarComboFontColor: TdxBarColorCombo;
    dxBarGroup1: TdxBarGroup;
    dxBarButtonXPStyle: TdxBarLargeButton;
    dxBarButton1: TdxBarLargeButton;
    dxBarButton2: TdxBarLargeButton;
    dxBarButton3: TdxBarLargeButton;
    dxBarButton4: TdxBarLargeButton;
    dxBarButton5: TdxBarLargeButton;
    dxBarButton6: TdxBarLargeButton;
    dxBarButton7: TdxBarLargeButton;
    dxBarButtonOffice11Style: TdxBarLargeButton;
    Images: TImageList;
    dxBarComboFontName: TdxBarFontNameCombo;
    ilHotImages: TImageList;
    ilDisabledImages: TImageList;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    ilStatusBarImages: TImageList;
    dxStatusBar: TdxStatusBar;
    FindDialog: TFindDialog;
    ReplaceDialog: TReplaceDialog;

    procedure FormCreate(Sender: TObject);

    procedure dxBarButtonNewClick(Sender: TObject);
    procedure dxBarButtonOpenClick(Sender: TObject);
    procedure dxBarButtonCloseClick(Sender: TObject);
    procedure dxBarButtonSaveClick(Sender: TObject);
    procedure dxBarButtonSaveAsClick(Sender: TObject);
    procedure dxBarButtonPrintClick(Sender: TObject);
    procedure dxBarButtonExitClick(Sender: TObject);

    procedure dxBarButtonUndoClick(Sender: TObject);
    procedure dxBarButtonCutClick(Sender: TObject);
    procedure dxBarButtonCopyClick(Sender: TObject);
    procedure dxBarButtonPasteClick(Sender: TObject);
    procedure dxBarButtonClearClick(Sender: TObject);
    procedure dxBarButtonSelectAllClick(Sender: TObject);
    procedure dxBarButtonFindClick(Sender: TObject);
    procedure dxBarButtonReplaceClick(Sender: TObject);

    procedure dxBarComboFontNameChange(Sender: TObject);
    procedure dxBarComboFontSizeChange(Sender: TObject);
    procedure dxBarButtonBoldClick(Sender: TObject);
    procedure dxBarButtonItalicClick(Sender: TObject);
    procedure dxBarButtonUnderlineClick(Sender: TObject);
    procedure dxBarComboFontColorChange(Sender: TObject);
    procedure dxBarButtonBulletsClick(Sender: TObject);
    procedure dxBarButtonAlignClick(Sender: TObject);
    procedure dxBarButtonProtectedClick(Sender: TObject);
    procedure dxBarButtonFontClick(Sender: TObject);

    procedure dxBarButtonArrangeAllClick(Sender: TObject);
    procedure dxBarButtonNextWindowClick(Sender: TObject);
    procedure dxBarButtonPreviousWindowClick(Sender: TObject);
    procedure dxBarListWindowsGetData(Sender: TObject);
    procedure dxBarListWindowsClick(Sender: TObject);
    procedure dxBarButtonEnhancedStyleClick(Sender: TObject);
    procedure dxBarMRUFilesClick(Sender: TObject);
    procedure dxBarButtonStdStyleClick(Sender: TObject);
    procedure dxBarButtonFlatStyleClick(Sender: TObject);
    procedure dxBarButtonXPStyleClick(Sender: TObject);
    procedure dxBarButtonOffice11StyleClick(Sender: TObject);
    procedure FindOne(Sender: TObject);
    procedure ReplaceOne(Sender: TObject);
  private
    FUpdating: Boolean;

    function GetEditor: TRichEdit;
    function GetEditorCol: Integer;
    function GetEditorRow: Integer;
    function GetFileName: string;
    procedure SetFileName(Value: string);
  public
    CreatedMDICount: Integer;

    procedure EditorChange(Sender: TObject);
    procedure EditorSelectionChange(Sender: TObject);
    function SaveFile(ASaveAs: Boolean): Boolean;
    procedure SetModified(Value: Boolean);
    procedure ShowItems(AShow: Boolean);

    property Editor: TRichEdit read GetEditor;
    property EditorCol: Integer read GetEditorCol;
    property EditorRow: Integer read GetEditorRow;
    property FileName: string read GetFileName write SetFileName;
  end;

var
  EBarMDIDemoMainForm: TEBarMDIDemoMainForm;

implementation

{$R *.DFM}
{$R windowsxp.res}

uses
  RichEdit, EBarMDIDemoChild, EBarMDIDemoAbout;

const
  sRichEditFoundResultCaption = 'Information';
  sRichEditTextNotFound = 'The search text is not found.';
  sRichEditReplaceAllResult = 'Replaced %d occurances.';

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

function TEBarMDIDemoMainForm.GetEditor: TRichEdit;
begin
  if ActiveMDIChild = nil then Result := nil
  else Result := TEBarMDIDemoChildForm(ActiveMDIChild).Editor;
end;

function TEBarMDIDemoMainForm.GetEditorCol: Integer;
begin
  with Editor do
    Result := SelStart - SendMessage(Handle, EM_LINEINDEX, EditorRow, 0);
end;

function TEBarMDIDemoMainForm.GetEditorRow: Integer;
begin
  with Editor do
    Result := SendMessage(Handle, EM_LINEFROMCHAR, SelStart, 0);
end;

function TEBarMDIDemoMainForm.GetFileName: string;
begin
  if ActiveMDIChild = nil then Result := ''
  else Result := TEBarMDIDemoChildForm(ActiveMDIChild).FileName;
end;

procedure TEBarMDIDemoMainForm.SetFileName(Value: string);
begin
  if ActiveMDIChild <> nil then
    TEBarMDIDemoChildForm(ActiveMDIChild).FileName := Value;
end;

procedure TEBarMDIDemoMainForm.FindOne(Sender: TObject);
var
  StartPos, FindLength, FoundAt: Integer;
  Flags: TSearchTypes;
  P: TPoint;
  CaretR, R, IntersectR: TRect;
begin
  with Editor, TFindDialog(Sender) do
  begin
    if frDown in Options then
    begin
      if SelLength = 0 then StartPos := SelStart
      else StartPos := SelStart + SelLength;
      FindLength := Length(Text) - StartPos;
    end
    else
    begin
      StartPos := SelStart;
      FindLength := -StartPos;
    end;
    Flags := [];
    if frMatchCase in Options then Include(Flags, stMatchCase);
    if frWholeWord in Options then Include(Flags, stWholeWord);
    Screen.Cursor := crHourglass;
    FoundAt := Editor.FindText(FindText, StartPos, FindLength, Flags);
    if not (frReplaceAll in Options) then Screen.Cursor := crDefault;
    if FoundAt > -1 then
      if frReplaceAll in Options then
      begin
        SelStart := FoundAt;
        SelLength := Length(FindText);
      end
      else
      begin
        SetFocus;
        SelStart := FoundAt;
        SelLength := Length(FindText);

        GetCaretPos(P);
        P := ClientToScreen(P);
        CaretR := Rect(P.X, P.Y, P.X + 2, P.Y + 20);
        GetWindowRect(Handle, R);
        if IntersectRect(IntersectR, CaretR, R) then
          if P.Y < Screen.Height div 2 then
            Top := P.Y + 40
          else
            Top := P.Y - (R.Bottom - R.Top + 20);
      end
    else
      if not (frReplaceAll in Options) then
        Application.MessageBox(sRichEditTextNotFound,
          sRichEditFoundResultCaption, MB_ICONINFORMATION);
  end;
end;

procedure TEBarMDIDemoMainForm.ReplaceOne(Sender: TObject);
var
  ReplacedCount, OldSelStart, PrevSelStart: Integer;
  S: string;
begin
  with Editor, TReplaceDialog(Sender) do
  begin
    ReplacedCount := 0;
    OldSelStart := SelStart;
    if frReplaceAll in Options then
      Screen.Cursor := crHourglass;
    repeat
      if (SelLength > 0) and ((SelText = FindText) or
        (not (frMatchCase in Options) and
         (AnsiUpperCase(SelText) = AnsiUpperCase(FindText)))) then
      begin
        SelText := ReplaceText;
        Inc(ReplacedCount);
      end;
      PrevSelStart := SelStart;
      FindOne(Sender);
    until not (frReplaceAll in Options) or (SelStart = PrevSelStart);
    if frReplaceAll in Options then
    begin
      Screen.Cursor := crDefault;
      if ReplacedCount = 0 then S := sRichEditTextNotFound
      else
      begin
        SelStart := OldSelStart;
        S := Format(sRichEditReplaceAllResult, [ReplacedCount]);
      end;
      Application.MessageBox(PChar(S), sRichEditFoundResultCaption,
        MB_ICONINFORMATION);
    end;
  end;
end;

procedure TEBarMDIDemoMainForm.EditorChange(Sender: TObject);
begin
  if Editor = nil then Exit;

  Editor.OnSelectionChange(Editor);
  SetModified(Editor.Modified);
  dxStatusBar.Panels[1].Text := ActiveMDIChild.Caption;
  TdxStatusBarTextPanelStyle(dxStatusBar.Panels[1].PanelStyle).ImageIndex := 0;
  TdxStatusBarTextPanelStyle(dxStatusBar.Panels[0].PanelStyle).ImageIndex := 2;
  dxBarButtonUndo.Enabled := SendMessage(Editor.Handle, EM_CANUNDO, 0, 0) <> 0;
end;

procedure TEBarMDIDemoMainForm.EditorSelectionChange(Sender: TObject);
begin
  with Editor, SelAttributes do
  begin
    FUpdating := True;
    dxBarComboFontSize.OnChange := nil;
    dxBarComboFontName.OnChange := nil;
    dxBarComboFontColor.OnChange := nil;
    try
       dxStatusBar.Panels[0].Text := Format('Line: %3d   Col: %3d', [1 + EditorRow, 1 + EditorCol]);

       dxBarButtonCopy.Enabled := SelLength > 0;
       dxBarButtonCut.Enabled := dxBarButtonCopy.Enabled;
       dxBarButtonPaste.Enabled := SendMessage(Editor.Handle, EM_CANPASTE, 0, 0) <> 0;
       dxBarButtonClear.Enabled := dxBarButtonCopy.Enabled;

       dxBarComboFontSize.Text := IntToStr(Size);
       dxBarComboFontName.Text := Name;
       dxBarComboFontColor.Color := Color;

       dxBarButtonBold.Down := fsBold in Style;
       dxBarButtonItalic.Down := fsItalic in Style;
       dxBarButtonUnderline.Down := fsUnderline in Style;

       dxBarButtonBullets.Down := Boolean(Paragraph.Numbering);
       case Ord(Paragraph.Alignment) of
         0: dxBarButtonAlignLeft.Down := True;
         1: dxBarButtonAlignRight.Down := True;
         2: dxBarButtonCenter.Down := True;
       end;
       dxBarButtonProtected.Down := Protected;
    finally
      FUpdating := False;
      dxBarComboFontSize.OnChange := dxBarComboFontSizeChange;
      dxBarComboFontName.OnChange := dxBarComboFontNameChange;
      dxBarComboFontColor.OnChange := dxBarComboFontColorChange;
    end;
  end;
end;

function TEBarMDIDemoMainForm.SaveFile(ASaveAs: Boolean): Boolean;
begin
  if ASaveAs or (FileName = '') then
  begin
    SaveDialog.FileName := FileName;
    Result := SaveDialog.Execute;
    if not Result then Exit;
    FileName := SaveDialog.FileName;
  end;
  Editor.Lines.SaveToFile(FileName);
  dxStatusBar.Panels[1].Text := ActiveMDIChild.Caption;
  SetModified(False);
  Result := True;
end;

procedure TEBarMDIDemoMainForm.SetModified(Value: Boolean);
begin
  Editor.Modified := Value;
  if Value then
  begin
    dxStatusBar.Panels[2].Text := 'Modified';
    TdxStatusBarTextPanelStyle(dxStatusBar.Panels[2].PanelStyle).ImageIndex := 1;
  end
  else
  begin
    dxStatusBar.Panels[2].Text := '';
    TdxStatusBarTextPanelStyle(dxStatusBar.Panels[2].PanelStyle).ImageIndex := 4;
  end;
  dxBarButtonSave.Enabled := Value;
end;

procedure TEBarMDIDemoMainForm.ShowItems(AShow: Boolean);
var
  AVisible: TdxBarItemVisible;
begin
  BarManager.LockUpdate := True;
  try
    if not AShow then
    begin
      dxStatusBar.Panels[0].Text := '';
      dxStatusBar.Panels[1].Text := '';
      dxStatusBar.Panels[2].Text := '';
    end;
    BarManager.Groups[0].Enabled := AShow;

    if AShow then AVisible := ivAlways
    else AVisible := ivInCustomizing;

    dxBarSubItemEdit.Visible := AVisible;
    dxBarSubItemFormat.Visible := AVisible;
  finally
    BarManager.LockUpdate := False;
  end;

  TdxStatusBarTextPanelStyle(dxStatusBar.Panels[0].PanelStyle).ImageIndex := 5;
  TdxStatusBarTextPanelStyle(dxStatusBar.Panels[1].PanelStyle).ImageIndex := 3;
  TdxStatusBarTextPanelStyle(dxStatusBar.Panels[2].PanelStyle).ImageIndex := 4;
end;

procedure TEBarMDIDemoMainForm.FormCreate(Sender: TObject);
const
  Filter = 'Rich Text Files (*.RTF)|*.RTF';
begin
  dmCommonData.AboutFormClass := TEBarMDIDemoAboutForm;

  OpenDialog.Filter := Filter;
  SaveDialog.Filter := Filter;
  OpenDialog.InitialDir := ExtractFilePath(ParamStr(0));
  SaveDialog.InitialDir := OpenDialog.InitialDir;
  ShowItems(False);
end;

procedure TEBarMDIDemoMainForm.dxBarButtonNewClick(Sender: TObject);
begin
  TEBarMDIDemoChildForm.Create(Application);
end;

procedure TEBarMDIDemoMainForm.dxBarButtonOpenClick(Sender: TObject);
begin
  OpenDialog.FileName := '';
  if OpenDialog.Execute then
  begin
    with TEBarMDIDemoChildForm.Create(Application) do
    begin
      FileName := OpenDialog.FileName;
      Editor.Lines.LoadFromFile(FileName);
      SetModified(False);
    end;
    dxBarMRUFiles.RemoveItem(OpenDialog.FileName, nil);
  end;
end;

procedure TEBarMDIDemoMainForm.dxBarButtonCloseClick(Sender: TObject);
begin
  ActiveMDIChild.Close;
end;

procedure TEBarMDIDemoMainForm.dxBarButtonSaveClick(Sender: TObject);
begin
  SaveFile(False);
end;

procedure TEBarMDIDemoMainForm.dxBarButtonSaveAsClick(Sender: TObject);
begin
  SaveFile(True);
end;

procedure TEBarMDIDemoMainForm.dxBarButtonPrintClick(Sender: TObject);
begin
  if PrintDialog.Execute then Editor.Print(FileName);
end;

procedure TEBarMDIDemoMainForm.dxBarButtonExitClick(Sender: TObject);
begin
  Close;
end;

procedure TEBarMDIDemoMainForm.dxBarButtonUndoClick(Sender: TObject);
begin
  SendMessage(Editor.Handle, EM_UNDO, 0, 0);
end;

procedure TEBarMDIDemoMainForm.dxBarButtonCutClick(Sender: TObject);
begin
  Editor.CutToClipboard;
end;

procedure TEBarMDIDemoMainForm.dxBarButtonCopyClick(Sender: TObject);
begin
  Editor.CopyToClipboard;
end;

procedure TEBarMDIDemoMainForm.dxBarButtonPasteClick(Sender: TObject);
begin
  Editor.PasteFromClipboard;
end;

procedure TEBarMDIDemoMainForm.dxBarButtonClearClick(Sender: TObject);
begin
  Editor.ClearSelection;
end;

procedure TEBarMDIDemoMainForm.dxBarButtonSelectAllClick(Sender: TObject);
begin
  Editor.SelectAll;
end;

procedure TEBarMDIDemoMainForm.dxBarButtonFindClick(Sender: TObject);
begin
  Editor.SelLength := 0;
  FindDialog.Execute;
end;

procedure TEBarMDIDemoMainForm.dxBarButtonReplaceClick(Sender: TObject);
begin
  Editor.SelLength := 0;
  ReplaceDialog.Execute;
end;

procedure TEBarMDIDemoMainForm.dxBarComboFontNameChange(Sender: TObject);
begin
  if not FUpdating then
    Editor.SelAttributes.Name := dxBarComboFontName.Text;
end;

procedure TEBarMDIDemoMainForm.dxBarComboFontSizeChange(Sender: TObject);
begin
  if not FUpdating then
    Editor.SelAttributes.Size := StrToInt(dxBarComboFontSize.Text);
end;

procedure TEBarMDIDemoMainForm.dxBarButtonBoldClick(Sender: TObject);
begin
  with Editor.SelAttributes do
    if dxBarButtonBold.Down then
      Style := Style + [fsBold]
    else
      Style := Style - [fsBold];
end;

procedure TEBarMDIDemoMainForm.dxBarButtonItalicClick(Sender: TObject);
begin
  with Editor.SelAttributes do
    if dxBarButtonItalic.Down then
      Style := Style + [fsItalic]
    else
      Style := Style - [fsItalic];
end;

procedure TEBarMDIDemoMainForm.dxBarButtonUnderlineClick(Sender: TObject);
begin
  with Editor.SelAttributes do
    if dxBarButtonUnderline.Down then
      Style := Style + [fsUnderline]
    else
      Style := Style - [fsUnderline];
end;

procedure TEBarMDIDemoMainForm.dxBarComboFontColorChange(Sender: TObject);
begin
  Editor.SelAttributes.Color := dxBarComboFontColor.Color;
end;

procedure TEBarMDIDemoMainForm.dxBarButtonBulletsClick(Sender: TObject);
begin
  Editor.Paragraph.Numbering := TNumberingStyle(dxBarButtonBullets.Down);
end;

procedure TEBarMDIDemoMainForm.dxBarButtonAlignClick(Sender: TObject);
begin
  if TdxBarLargeButton(Sender).Down then
    Editor.Paragraph.Alignment := TAlignment(TdxBarLargeButton(Sender).Tag)
  else
    Editor.Paragraph.Alignment := taLeftJustify;
end;

procedure TEBarMDIDemoMainForm.dxBarButtonProtectedClick(Sender: TObject);
begin
  with Editor.SelAttributes do Protected := not Protected;
end;

procedure TEBarMDIDemoMainForm.dxBarButtonFontClick(Sender: TObject);
begin
  FontDialog.Font.Assign(Editor.SelAttributes);
  if FontDialog.Execute then
    Editor.SelAttributes.Assign(FontDialog.Font);
end;

procedure TEBarMDIDemoMainForm.dxBarButtonArrangeAllClick(Sender: TObject);
begin
  Tile;
end;

procedure TEBarMDIDemoMainForm.dxBarButtonNextWindowClick(Sender: TObject);
begin
  Next;
end;

procedure TEBarMDIDemoMainForm.dxBarButtonPreviousWindowClick(Sender: TObject);
begin
  Previous;
end;

procedure TEBarMDIDemoMainForm.dxBarListWindowsGetData(Sender: TObject);
begin
  with dxBarListWindows do
    ItemIndex := Items.IndexOfObject(ActiveMDIChild);
end;

procedure TEBarMDIDemoMainForm.dxBarListWindowsClick(Sender: TObject);
begin
  with dxBarListWindows do
    TCustomForm(Items.Objects[ItemIndex]).Show;
end;

procedure TEBarMDIDemoMainForm.dxBarMRUFilesClick(Sender: TObject);
var
  AFileName: String;
begin
  AFileName := dxBarMRUFiles.Items[dxBarMRUFiles.ItemIndex];
  if FileExists(AFileName) then
    with TEBarMDIDemoChildForm.Create(Application) do
    begin
      FileName := AFileName;
      Editor.Lines.LoadFromFile(FileName);
      SetModified(False);
    end
  else
    Application.MessageBox(PChar(AFileName+#10#13+'File not found.'),'Open',MB_OK or MB_ICONERROR)
end;

procedure TEBarMDIDemoMainForm.dxBarButtonStdStyleClick(Sender: TObject);
begin
  BarManager.Style := bmsStandard;
  dxStatusBar.PaintStyle := stpsStandard;
end;

procedure TEBarMDIDemoMainForm.dxBarButtonEnhancedStyleClick(Sender: TObject);
begin
  BarManager.Style := bmsEnhanced;
  dxStatusBar.PaintStyle := stpsStandard;
end;

procedure TEBarMDIDemoMainForm.dxBarButtonFlatStyleClick(Sender: TObject);
begin
  BarManager.Style := bmsFlat;
  dxStatusBar.PaintStyle := stpsFlat;
end;

procedure TEBarMDIDemoMainForm.dxBarButtonXPStyleClick(Sender: TObject);
begin
  BarManager.Style := bmsXP;
  dxStatusBar.PaintStyle := stpsXP;
end;

procedure TEBarMDIDemoMainForm.dxBarButtonOffice11StyleClick(Sender: TObject);
begin
  BarManager.Style := bmsOffice11;
  dxStatusBar.PaintStyle := stpsOffice11;
end;

end.
