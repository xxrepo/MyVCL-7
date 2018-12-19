unit StylesMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBTables, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid,
  dxCntner, dxPgsDlg, dxPSEngn, dxPSCore, dxPrnDlg, dxPSdxTLLnk,
  dxPSdxDBCtrlLnk, dxPSdxDBGrLnk, dxPSGlbl, dxPSUtl, dxPrnPg, dxBkgnd,
  {dxPSPrVwAdv,} // enable for use of ExpressBars in PrintPreview
  dxWrap, dxPrnDev;

type
  TStylesMainForm = class(TForm)
    dxDBGrid: TdxDBGrid;
    colSpeciesNo: TdxDBGridColumn;
    colNotes: TdxDBGridMemoColumn;
    colCategory: TdxDBGridColumn;
    colGraphic: TdxDBGridGraphicColumn;
    colCommon_Name: TdxDBGridColumn;
    colSpeciesName: TdxDBGridColumn;
    colLength: TdxDBGridColumn;
    colLength_In: TdxDBGridColumn;
    Table1: TTable;
    DataSource1: TDataSource;
    dxPrintStyleManager1: TdxPrintStyleManager;
    dxComponentPrinter1: TdxComponentPrinter;
    dxPSEngineController1: TdxPSEngineController;
    dxComponentPrinter1Link1: TdxDBGridReportLink;
    dxPrintStyleManager1Style1: TdxPSPrintStyle;
    dxPrintStyleManager1Style2: TdxPSPrintStyle;
    MainMenu1: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miPreview: TMenuItem;
    miPrint: TMenuItem;
    N1: TMenuItem;
    dxPageSetupDialog1: TdxPageSetupDialog;
    miPageSetup: TMenuItem;
    miShow: TMenuItem;
    miStyles: TMenuItem;
    N2: TMenuItem;
    miSimpleDialog: TMenuItem;
    miSave: TMenuItem;
    miLoad: TMenuItem;
    N3: TMenuItem;
    miAutoSave: TMenuItem;
    miDefineStyles: TMenuItem;
    N4: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    miSaveAs: TMenuItem;
    miReportDesigner: TMenuItem;
    miOptions: TMenuItem;
    miHelp: TMenuItem;
    miWeb: TMenuItem;
    miFlat: TMenuItem;
    miSaveFrmPos: TMenuItem;
    procedure miExitClick(Sender: TObject);
    procedure miPreviewClick(Sender: TObject);
    procedure miShowClick(Sender: TObject);
    procedure dxPrintStyleManager1ChangeCurrentStyle(Sender: TObject);
    procedure dxPrintStyleManager1StyleListChanged(Sender: TObject);
    procedure miSimpleDialogClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DefineClick(Sender: TObject);
    procedure miAutoSaveClick(Sender: TObject);
    procedure miLoadClick(Sender: TObject);
    procedure miSaveClick(Sender: TObject);
    procedure miSaveAsClick(Sender: TObject);
    procedure miReportDesignerClick(Sender: TObject);
    procedure miWebClick(Sender: TObject);
    procedure miFlatClick(Sender: TObject);
    procedure miSaveFrmPosClick(Sender: TObject);
    procedure miPrintClick(Sender: TObject);
  private
    StylesMenuItemsCount: Integer;
    procedure StyleItemClick(Sender: TObject);
    procedure BuildStylesMenu;
    function SaveStyles(ShowDialog: Boolean): Boolean;
    procedure InvertMICheck(Item: TMenuItem);
  public
    { Public declarations }
  end;

var
  StylesMainForm: TStylesMainForm;

implementation

uses ShellAPI;

{$R *.DFM}

procedure TStylesMainForm.InvertMICheck(Item: TMenuItem);
begin
  Item.Checked := not Item.Checked;
end;

procedure TStylesMainForm.BuildStylesMenu;
var
  I: Integer;
  NewItem: TMenuItem;
begin
  while (miStyles.Count > StylesMenuItemsCount) do
    miStyles.Items[0].Free;
  for I := dxPrintStyleManager1.Count - 1 downto 0 do
  begin
    NewItem := TMenuItem.Create(Self);
    NewItem.Caption := dxPrintStyleManager1.Styles[I].StyleCaption;
    NewItem.Tag := Integer(dxPrintStyleManager1.Styles[I]);
    NewItem.RadioItem := True;
    NewItem.Checked := dxPrintStyleManager1.Styles[I].IsCurrentStyle;
    NewItem.OnClick := StyleItemClick;
    miStyles.Insert(0, NewItem);
  end;
end;

procedure TStylesMainForm.StyleItemClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := True;
  TdxPSPrintStyle(TMenuItem(Sender).Tag).IsCurrentStyle := True;
end;

procedure TStylesMainForm.FormCreate(Sender: TObject);
begin
  // Engine
  miFlat.Checked := Boolean(Ord(dxPSEngineController1.LookAndFeel));
  miSaveFrmPos.Checked := dxPSEngineController1.SaveFormsPosition;
  // Styles
  if dxPrintStyleManager1.StorageName = '' then
    dxPrintStyleManager1.AutoSave := False;
  miAutoSave.Checked := dxPrintStyleManager1.AutoSave;
  StylesMenuItemsCount := miStyles.Count;
  BuildStylesMenu;
  miSimpleDialog.Checked := dxPrintStyleManager1.PageSetupDialog <> nil;
  if dxPrintStyleManager1.Count > 0 then
    dxPrintStyleManager1.CurrentStyleIndex := 0;
end;

procedure TStylesMainForm.miReportDesignerClick(Sender: TObject);
begin
  dxComponentPrinter1.DesignReport(nil);
end;

procedure TStylesMainForm.miPreviewClick(Sender: TObject);
begin
  dxComponentPrinter1.Preview(True, nil);
end;

procedure TStylesMainForm.miPrintClick(Sender: TObject);
begin
  dxComponentPrinter1.Print(True, nil, nil);
end;

procedure TStylesMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TStylesMainForm.miShowClick(Sender: TObject);
var
  SaveAllowChangeScale: Boolean;
begin
  SaveAllowChangeScale := dxPrintStyleManager1.CurrentStyle.AllowChangeScale;
  dxPrintStyleManager1.CurrentStyle.AllowChangeScale := not miSimpleDialog.Checked;
  dxComponentPrinter1.PageSetup(nil);
  dxPrintStyleManager1.CurrentStyle.AllowChangeScale := SaveAllowChangeScale;
end;

procedure TStylesMainForm.DefineClick(Sender: TObject);
begin
  dxPrintStyleManager1.DefinePrintStylesDlg(nil, nil);
end;

procedure TStylesMainForm.dxPrintStyleManager1ChangeCurrentStyle(Sender: TObject);
begin
  miStyles.Items[dxPrintStyleManager1.CurrentStyleIndex].Checked := True;
end;

procedure TStylesMainForm.dxPrintStyleManager1StyleListChanged(Sender: TObject);
begin
  BuildStylesMenu;
end;

procedure TStylesMainForm.miSimpleDialogClick(Sender: TObject);
begin
  InvertMICheck(TMenuItem(Sender));
  if TMenuItem(Sender).Checked then
    dxPrintStyleManager1.PageSetupDialog := dxPageSetupDialog1
  else
    dxPrintStyleManager1.PageSetupDialog := nil;
end;

procedure TStylesMainForm.miAutoSaveClick(Sender: TObject);
begin
  if not TMenuItem(Sender).Checked then
    TMenuItem(Sender).Checked := SaveStyles(False)
  else
    TMenuItem(Sender).Checked := False;
  dxPrintStyleManager1.AutoSave := TMenuItem(Sender).Checked;
end;

procedure TStylesMainForm.miLoadClick(Sender: TObject);
begin
  OpenDialog1.FileName := dxPrintStyleManager1.StorageName;
  if OpenDialog1.Execute then
  begin
    dxPrintStyleManager1.StorageName := OpenDialog1.FileName;
    dxPrintStyleManager1.LoadFromFile(dxPrintStyleManager1.StorageName);
  end;
end;

procedure TStylesMainForm.miSaveClick(Sender: TObject);
begin
  SaveStyles(False);
end;

procedure TStylesMainForm.miSaveAsClick(Sender: TObject);
begin
  SaveStyles(True);
end;

function TStylesMainForm.SaveStyles(ShowDialog: Boolean): Boolean;
begin
  Result := True;
  SaveDialog1.FileName := dxPrintStyleManager1.StorageName;
  if (dxPrintStyleManager1.StorageName = '') or ShowDialog then
    Result := SaveDialog1.Execute;
  if Result then
  begin
    dxPrintStyleManager1.StorageName := SaveDialog1.FileName;
    dxPrintStyleManager1.SaveToFile(dxPrintStyleManager1.StorageName);
  end;
end;

procedure TStylesMainForm.miWebClick(Sender: TObject);
begin
  ShellExecute(0, nil, 'http://www.devexpress.com', nil, nil, SW_RESTORE);
end;

procedure TStylesMainForm.miFlatClick(Sender: TObject);
begin
  InvertMICheck(TMenuItem(Sender));
  dxPSEngineController1.LookAndFeel := TdxPSLookAndFeel(Ord(TMenuItem(Sender).Checked));
end;

procedure TStylesMainForm.miSaveFrmPosClick(Sender: TObject);
begin
  InvertMICheck(TMenuItem(Sender));
  dxPSEngineController1.SaveFormsPosition := TMenuItem(Sender).Checked;
end;

end.
