unit DBTreeListRLMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, checklst, StdCtrls, Grids, ComCtrls, ShellAPI, ToolWin, Db, DBTables,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBTLLnk, dxDBTLCl, dxTL,
  dxDBCtrl, dxCntner, dxDBTL, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  {dxPSPrVwAdv,} // enable for use of ExpressBars in PrintPreview
  dxBkgnd, dxWrap, dxPrnDev, ImgList;

type
  TDBTreeListRLMainForm = class(TForm)
    MainMenu: TMainMenu;
    miFile: TMenuItem;
    miDesigner: TMenuItem;
    miHelp: TMenuItem;
    miPageSetup: TMenuItem;
    miPrintPreview: TMenuItem;
    miPrint: TMenuItem;
    N1: TMenuItem;
    miExit: TMenuItem;
    miDX: TMenuItem;
    dxComponentPrinter1: TdxComponentPrinter;
    ToolBar1: TToolBar;
    tbSetup: TToolButton;
    tbPreview: TToolButton;
    tbPrint: TToolButton;
    tbDevider: TToolButton;
    tbDesigner: TToolButton;
    tbDX: TToolButton;
    tbSeparator: TToolButton;
    tbExit: TToolButton;
    ilButtons: TImageList;
    ilDBTreelist: TImageList;
    Table: TTable;
    Table_id: TIntegerField;
    Table_parent: TIntegerField;
    Table_name: TStringField;
    Table_bdate: TDateField;
    Table_edate: TDateField;
    Table_info: TMemoField;
    DataSource: TDataSource;
    dxComponentPrinter1Link2: TdxDBTreeListReportLink;
    DBTreeList: TdxDBTreeList;
    DBTreeListPr_id: TdxDBTreeListMaskColumn;
    DBTreeListPr_parent: TdxDBTreeListMaskColumn;
    DBTreeListPr_name: TdxDBTreeListMaskColumn;
    DBTreeListPr_info: TdxDBTreeListMemoColumn;
    tbSelected: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure miDXClick(Sender: TObject);
    procedure miPageSetupClick(Sender: TObject);
    procedure miPrintPreviewClick(Sender: TObject);
    procedure miPrintClick(Sender: TObject);
    procedure miDesignerClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure DBTreeListGetStateIndex(Sender: TObject;
      Node: TdxTreeListNode; var Index: Integer);
    procedure tbSelectedClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DBTreeListRLMainForm: TDBTreeListRLMainForm;

implementation


{$R *.DFM}

procedure TDBTreeListRLMainForm.FormCreate(Sender: TObject);
begin
  Table.DatabaseName := ExtractFilePath(Application.ExeName) + '..\..\Data\';
  Table.Active := true;
end;

procedure TDBTreeListRLMainForm.miDXClick(Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar('http://www.devexpress.com'), Nil, Nil, SW_SHOWMAXIMIZED);
end;

procedure TDBTreeListRLMainForm.miPageSetupClick(Sender: TObject);
begin
  dxComponentPrinter1.PageSetup(nil);
end;

procedure TDBTreeListRLMainForm.miPrintPreviewClick(Sender: TObject);
begin
  dxComponentPrinter1.Preview(True,nil);
end;

procedure TDBTreeListRLMainForm.miPrintClick(Sender: TObject);
begin
  dxComponentPrinter1.Print(True,nil,nil);
end;

procedure TDBTreeListRLMainForm.miDesignerClick(Sender: TObject);
begin
  dxComponentPrinter1.DesignReport(nil);
end;

procedure TDBTreeListRLMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TDBTreeListRLMainForm.DBTreeListGetStateIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  if Node.Expanded then Index := 1
  else Index := 0;
end;

procedure TDBTreeListRLMainForm.tbSelectedClick(Sender: TObject);
begin
  dxComponentPrinter1Link2.OnlySelected := tbSelected.Down;
end;

end.
