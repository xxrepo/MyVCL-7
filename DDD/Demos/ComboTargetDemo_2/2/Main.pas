{ MS Outlook message viewer
  main form

  Copyright (C) 2000-2007, written by Shkolnik Mike, Scalabium Software
  E-Mail:  support@scalabium.com
  WEB: http://www.scalabium.com
}
unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Grids, Tabs, StdCtrls, ComCtrls, ToolWin, ExtCtrls,
  Menus, Dialogs, SMMSG;

type
  TfrmMain = class(TForm)
    tbMain: TToolBar;
    btnConvert: TToolButton;
    btnClose: TToolButton;
    tbsSeparator2: TToolButton;
    imgMenu: TImageList;
    PageControl: TPageControl;
    tsPreview: TTabSheet;
    cbMain: TCoolBar;
    MainMenu: TMainMenu;
    miFile: TMenuItem;
    miOpen: TMenuItem;
    miFileExit: TMenuItem;
    miHelp: TMenuItem;
    miHelpHomepage: TMenuItem;
    miHelpSendEMail: TMenuItem;
    miSeparator: TMenuItem;
    miHelpAbout: TMenuItem;
    tbHelp: TToolBar;
    btnAbout: TToolButton;
    btnSendMail: TToolButton;
    tbsSeparator3: TToolButton;
    btnHomepage: TToolButton;
    OpenDialog: TOpenDialog;
    tsProperties: TTabSheet;
    miFileSeparator1: TMenuItem;
    lblNoFile: TLabel;
    lblSubject: TLabel;
    edSubject: TEdit;
    reBody: TRichEdit;
    tvProperties: TTreeView;
    SplitterProperties: TSplitter;
    gbPropInfo: TGroupBox;
    lblPropName: TLabel;
    lblPropID: TLabel;
    lblpropCategory: TLabel;
    cbPropCategory: TComboBox;
    edPropID: TEdit;
    edPropName: TEdit;
    lblPropValue: TLabel;
    rePropValue: TRichEdit;
    imgProperties: TImageList;
    lvAttachments: TListView;
    imgAttachment: TImageList;
    lblFrom: TLabel;
    lblTo: TLabel;
    edFrom: TEdit;
    edTo: TEdit;
    pmAttachment: TPopupMenu;
    miEncoding: TMenuItem;
    miAttachSeparator: TMenuItem;
    miAttachSave: TMenuItem;
    miAttachOpen: TMenuItem;
    SMMSGFile1: TSMMSGFile;
    procedure btnXLSFileNameClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure tbbSendMailClick(Sender: TObject);
    procedure tvPropertiesChange(Sender: TObject; Node: TTreeNode);
    procedure miAttachSaveClick(Sender: TObject);
    procedure pmAttachmentPopup(Sender: TObject);
    procedure lvAttachmentsMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnHomepageClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
  private
    { Private declarations }
    procedure InternalClear;
    procedure InternalLoadMSG;

    procedure LoadPropertyToTree(ANode: TTreeNode; prop: TMSGProperty);
  protected
    { Protected declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}
{$R winxp.res}

uses ShellAPI, SMMSGTags, TypInfo;

procedure TfrmMain.btnXLSFileNameClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    InternalLoadMSG;
end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Close
end;

procedure TfrmMain.InternalClear;
begin
  tvProperties.Items.Clear;
  lvAttachments.Items.Clear;
end;

procedure TfrmMain.LoadPropertyToTree(ANode: TTreeNode; prop: TMSGProperty);
var
  i, intImage: Integer;
  nd: TTreeNode;
  s: string;
begin
  s := '';
  intImage := -1;
  if (prop.SubProperties.Count > 0) then
  begin
    if (prop.Category = mpcAttachment) then
    begin
      s := 'Attachment';
      intImage := 4
    end
    else
    if (prop.Category = mpcRecipient) then
    begin
      s := 'Recipient';
      intImage := 2
    end
    else
    if (prop.Category = mpcEnvelope) then
    begin
//      s := 'Envelope'
      intImage := 0
    end
  end;
  if (s = '') then
  begin
    s := prop.GetName(False, False);
    if (s = '') then
      s := '0x' + IntToHex(prop.TagID, 8);

    if Assigned(ANode) then
    begin
      case ANode.ImageIndex of
        0: intImage := 1;
        2: intImage := 3;
        4: intImage := 5;
      end;
    end;
  end;
  nd := tvProperties.Items.AddChildObject(ANode, s, Pointer(prop));
  nd.ImageIndex := intImage;
  nd.SelectedIndex := intImage;

  for i := 0 to prop.SubProperties.Count-1 do
    LoadPropertyToTree(nd, prop.SubProperties[i])
end;

procedure TfrmMain.InternalLoadMSG;
var
  i: Integer;
  prop: TMSGProperty;
begin
  PageControl.Visible := True;

  InternalClear;

  try
    Screen.Cursor := crHourglass;

    SMMSGFile1.LoadFromFile(OpenDialog.FileName);

    {property information}
    for i := 0 to SMMSGFile1.Properties.Count-1 do
      LoadPropertyToTree(nil, SMMSGFile1.Properties[i]);

    {general properties for message}
    edFrom.Text := VarToStr(SMMSGFile1.SenderName);
    edTo.Text := VarToStr(SMMSGFile1.RecipientName);
    edSubject.Text := VarToStr(SMMSGFile1.Subject);
    reBody.Lines.Text := VarToStr(SMMSGFile1.Body);

    {attachments}
    for i := 0 to SMMSGFile1.Properties.GetAttachmentCount-1 do
    begin
      prop := SMMSGFile1.Properties.GetAttachment(i);
      if Assigned(prop) then
      begin
        with lvAttachments.Items.Add do
        begin
          ImageIndex := 0;
          Caption := prop.SubProperties.GetPropertyAsString(PR_ATTACH_FILENAME, False, False);
//          SubItems.Add(prop.GetAttachmentFileName(i));
          SubItems.Add(prop.SubProperties.GetPropertyAsString(PR_ATTACH_MIME_TAG, False, False));
        end;
      end
    end;
    lvAttachments.Visible := (lvAttachments.Items.Count > 0);
    lvAttachments.Top := tsPreview.ClientHeight - 20;
  finally
    Screen.Cursor := crDefault;
  end;
  FormResize(Self)
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  OpenDialog.InitialDir := ExtractFilePath(Application.ExeName);
  
  cbPropCategory.Items.Clear;
  for i := Ord(Low(TMSGPropertyCategory)) to Ord(High(TMSGPropertyCategory)) do
    cbPropCategory.Items.Add(GetEnumName(TypeInfo(TMSGPropertyCategory), i));

  FormResize(Self)
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  InternalClear;
end;

procedure TfrmMain.btnAboutClick(Sender: TObject);
begin
  AboutSMMsg
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  edSubject.Width := tsPreview.ClientWidth - edSubject.Left - 5;
  edFrom.Width := edSubject.Width;
  edTo.Width := edSubject.Width;
  reBody.Height := tsPreview.ClientHeight - edSubject.Top - edSubject.Height - 5;
  if lvAttachments.Visible then
  begin
    reBody.Height := reBody.Height - lvAttachments.Height;
    lvAttachments.Top := tsPreview.ClientHeight - lvAttachments.Height
  end;

  rePropValue.Height := gbPropInfo.ClientHeight - rePropValue.Top - 10;
end;

procedure TfrmMain.tbbSendMailClick(Sender: TObject);
begin
  ShellExecute(0, 'open', 'mailto:support@scalabium.com?subject=Message%20File%20Viewer%20support%20needed', nil, nil, SW_SHOWNORMAL);
end;

function FileTimeToString(FileTime: TFileTime): string;
var
  ModifiedTime: TFileTime;
  SystemTime: TSystemTime;
  dt: TDateTime;
begin
  dt := 0;
  if (FileTime.dwLowDateTime = 0) and (FileTime.dwHighDateTime = 0) then
  else
  begin
    try
      FileTimeToLocalFileTime(FileTime, ModifiedTime);
      FileTimeToSystemTime(ModifiedTime, SystemTime);
      dt := SystemTimeToDateTime(SystemTime);
    except
    end
  end;

  if dt = 0 then
    Result := ''
  else
    Result := FormatDateTime('c', dt)
end;

procedure TfrmMain.tvPropertiesChange(Sender: TObject; Node: TTreeNode);
var
  prop: TMSGProperty;
begin
  if (csDestroying in tvProperties.ComponentState) then exit;

  gbPropInfo.Visible := Assigned(Node);
  gbPropInfo.Left := SplitterProperties.Left + 50;

  if Assigned(Node) then
  begin
    prop := TMSGProperty(Node.Data);
    if Assigned(prop) then
    begin
      cbPropCategory.ItemIndex := Ord(prop.Category);

      edPropID.Text := '0x' + IntToHex(prop.TagID, 8);
      edPropName.Text := prop.GetName(False, False);
      rePropValue.Lines.Text := VarToStr(prop.Value)
    end
    else
    begin
      cbPropCategory.ItemIndex := -1;
      edPropID.Text := '';
      edPropName.Text := '';
      rePropValue.Lines.Clear;
    end
  end;
  FormResize(Self);
end;

procedure TfrmMain.miAttachSaveClick(Sender: TObject);
var
  TempPath: array[0..MAX_PATH] of Char;
  TempFileName: string;
begin
  if not Assigned(lvAttachments.Selected) then exit;

  {open/save the attachment}
  case TComponent(Sender).Tag of
    1: begin
         {open}
         try
           {get temp.filename}
           GetTempPath(MAX_PATH, @TempPath);
           TempFileName := TempPath + '' + lvAttachments.Selected.Caption;
           {save to temp}
           SMMSGFile1.Properties.SaveAttachmentToFile(lvAttachments.Selected.Index, TempFileName);

           ShellExecute(0, 'open', PChar(TempFileName), nil, nil, SW_SHOWNORMAL);
         finally
           {delete temp.file}
           DeleteFile(TempFileName);
         end;
       end;

    2: begin
         {save}
         with TSaveDialog.Create(nil) do
           try
             FileName := lvAttachments.Selected.Caption;
             InitialDir := ExtractFilePath(Application.ExeName);
             if Execute then
               SMMSGFile1.Properties.SaveAttachmentToFile(lvAttachments.Selected.Index, FileName)
           finally
             Free
           end;
       end;
  end;
end;

procedure TfrmMain.pmAttachmentPopup(Sender: TObject);
begin
  miEncoding.Caption := 'Encoding: ';
  if Assigned(lvAttachments.Selected) then
    miEncoding.Caption := miEncoding.Caption + lvAttachments.Selected.SubItems[0];
end;

procedure TfrmMain.lvAttachmentsMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  p: TPoint;
begin
  if (Button = mbRight) and Assigned(lvAttachments.Selected) then
  begin
    p := lvAttachments.ClientToScreen(Point(X, Y));
    pmAttachment.Popup(p.X, p.Y)
  end;
end;

procedure TfrmMain.btnHomepageClick(Sender: TObject);
begin
  ShellExecute(0, 'open', 'http://www.scalabium.com/msg/msglib.htm', nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmMain.PageControlChange(Sender: TObject);
begin
  FormResize(Self)
end;

end.
