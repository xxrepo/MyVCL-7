unit UnboundExternalDataDemoMain;

interface

uses

  Windows,Forms, Dialogs, SysUtils, cxStyles, Classes, ActnList, ImgList, Controls, Menus,
  ComCtrls, StdCtrls, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, cxDataStorage,
  cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, cxLookAndFeels;

type
  TUnboundExternalDataDemoMainForm = class(TForm)
    mmMain: TMainMenu;
    miAbout: TMenuItem;
    miFile: TMenuItem;
    Exit1: TMenuItem;
    sbMain: TStatusBar;
    lbDescription: TLabel;
    StyleRepository: TcxStyleRepository;
    stBlueDarkBold: TcxStyle;
    stBlueLight: TcxStyle;
    stBlueBright: TcxStyle;
    stYellowLight: TcxStyle;
    stGreyLight: TcxStyle;
    stBlueSky: TcxStyle;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    cxGrid: TcxGrid;
    tvSections: TcxGridTableView;
    tvValues: TcxGridTableView;
    SectionLevel: TcxGridLevel;
    DetailLevel: TcxGridLevel;
    N1: TMenuItem;
    miOpen: TMenuItem;
    miSave: TMenuItem;
    miSaveAs: TMenuItem;
    Edit1: TMenuItem;
    miInsertSection: TMenuItem;
    miDeleteSection: TMenuItem;
    stBlueDark: TcxStyle;
    stGold: TcxStyle;
    LookAndFeelController: TcxLookAndFeelController;
    procedure miAboutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure miOpenClick(Sender: TObject);
    procedure miSaveClick(Sender: TObject);
    procedure miSaveAsClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure miExitClick(Sender: TObject);
    procedure miInsertSectionClick(Sender: TObject);
    procedure miDeleteSectionClick(Sender: TObject);
    procedure sbMainResize(Sender: TObject);
  private
    FChangesCount: Integer;
    procedure DoSmthOnModify(Sender: TObject);
    procedure CustomizeGrid;
    procedure GenerateColumns;
    procedure LoadData;
    procedure Load(const AFileName: string);
    procedure UpdateFileInfo(const AFileName: string);
    procedure ResetChanges;
  public
    { Public declarations }
  end;

var
  UnboundExternalDataDemoMainForm: TUnboundExternalDataDemoMainForm;

implementation

{$R *.dfm}

uses
  UnboundExternalDataDemoClasses, AboutDemoForm;

resourcestring
  rsIniFileName = 'odbcinst_test.ini';

var
  IniFile: TUserIniFile;
  UserDataSource: TUserDataSource;
  UserDetailDataSource: TUserDetailDataSource;

procedure TUnboundExternalDataDemoMainForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TUnboundExternalDataDemoMainForm.FormCreate(Sender: TObject);
begin
  IniFile := TUserIniFile.Create(ExtractFilePath(Application.ExeName) + rsIniFileName);
  UpdateFileInfo(IniFile.FileName);
  IniFile.OnModify := DoSmthOnModify;
  UserDataSource := TUserDataSource.Create(IniFile);
  UserDetailDataSource := TUserDetailDataSource.Create(UserDataSource);

  CustomizeGrid;
end;

procedure TUnboundExternalDataDemoMainForm.CustomizeGrid;
begin
  GenerateColumns;
  LoadData;
end;

procedure TUnboundExternalDataDemoMainForm.DoSmthOnModify(Sender: TObject);
begin
  Inc(FChangesCount);
  sbMain.Panels[2].Text := Format('Changes Count: %d', [FChangesCount]);
end;

procedure TUnboundExternalDataDemoMainForm.GenerateColumns;
begin
  with tvSections do
  begin
    with CreateColumn as TcxGridColumn do
    begin
      Caption := 'Section Name';
      DataBinding.ValueTypeClass := TcxStringValueType;
      Width := 600;
    end;
    DataController.CustomDataSource := UserDataSource;
  end;

  with tvValues do
  begin
    with CreateColumn as TcxGridColumn do
    begin
      Caption := 'Parameter Name';
      DataBinding.ValueTypeClass := TcxStringValueType;
      DataBinding.Data := Pointer(0);
      Width := 300;
    end;
    with CreateColumn as TcxGridColumn do
    begin
      Caption := 'Parameter Value';
      DataBinding.ValueTypeClass := TcxStringValueType;
      DataBinding.Data := Pointer(1);
      Width := 300;
    end;
    DataController.CustomDataSource := UserDetailDataSource;
  end;
end;

procedure TUnboundExternalDataDemoMainForm.Load(const AFileName: string);
begin
  IniFile.Rename(AFileName, True);
  UserDataSource.DataChanged;
end;

procedure TUnboundExternalDataDemoMainForm.LoadData;
begin
  Load(IniFile.FileName);
end;

procedure TUnboundExternalDataDemoMainForm.UpdateFileInfo(
  const AFileName: string);
begin
  sbMain.Panels[1].Text := ExtractFileName(AFileName);
end;

procedure TUnboundExternalDataDemoMainForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(UserDetailDataSource);
  FreeAndNil(UserDataSource);
  FreeAndNil(IniFile);
end;

procedure TUnboundExternalDataDemoMainForm.miOpenClick(Sender: TObject);
var
  I: Integer;
begin
  if IniFile.Modified then
  begin
    I := MessageDlg('Do you want to save the changes ?', mtConfirmation, [mbYes, mbNo, mbCancel], 0);
    case I of
      mrYes: IniFile.SaveValues;
      mrCancel: Exit;
    end;
  end;

  OpenDialog.InitialDir := ExtractFilePath(Application.ExeName);
  with OpenDialog do
    if Execute then
    begin
      Load(FileName);
      UpdateFileInfo(FileName);
      ResetChanges;
    end;
end;

procedure TUnboundExternalDataDemoMainForm.miSaveClick(Sender: TObject);
begin
  IniFile.SaveValues;
  ResetChanges;
end;

procedure TUnboundExternalDataDemoMainForm.miSaveAsClick(Sender: TObject);
begin
  with SaveDialog do
    if Execute then
    begin
      IniFile.SaveAs(FileName);
      UpdateFileInfo(FileName);
      ResetChanges;
    end;
end;

procedure TUnboundExternalDataDemoMainForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  I: Integer;
begin
  I := -1;
  if IniFile.Modified then
  I := MessageDlg('Do you want to save the changes ?', mtConfirmation, [mbYes, mbNo, mbCancel], 0);
  case I of
    mrYes: IniFile.SaveValues;
    mrCancel: CanClose := False;
  end;
end;

procedure TUnboundExternalDataDemoMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TUnboundExternalDataDemoMainForm.miInsertSectionClick(
  Sender: TObject);
begin
  cxGrid.FocusedView.DataController.Insert;
end;

procedure TUnboundExternalDataDemoMainForm.miDeleteSectionClick(
  Sender: TObject );
begin
  cxGrid.FocusedView.DataController.DeleteFocused;
end;

procedure TUnboundExternalDataDemoMainForm.sbMainResize(Sender: TObject);
begin
  with TStatusBar(Sender) do
    Panels[0].Width := Width - (Panels[1].Width + Panels[2].Width)
end;

procedure TUnboundExternalDataDemoMainForm.ResetChanges;
begin
  FChangesCount := 0;
  sbMain.Panels[2].Text := 'Changes Count: 0';
end;

end.  
