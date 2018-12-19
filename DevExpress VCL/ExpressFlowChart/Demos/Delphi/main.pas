unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxflchrt, ExtCtrls, Db, DBTables,
  StdCtrls, Grids, DBGrids,ShellAPI, dxFcEdit,
  Menus, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, ImgList;

type
  TMainForm = class(TForm)
    Splitter: TSplitter;
    dxFlowChart: TdxFlowChart;
    Table: TTable;
    DataSource: TDataSource;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    DBGrid: TDBGrid;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Edit1: TMenuItem;
    View1: TMenuItem;
    Help1: TMenuItem;
    miOpen: TMenuItem;
    miSaveAs: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    EditChart1: TMenuItem;
    miZoomIn: TMenuItem;
    miZoomOut: TMenuItem;
    N2: TMenuItem;
    miFit: TMenuItem;
    DeveloperExpressontheWeb1: TMenuItem;
    miActualSize: TMenuItem;
    ImageList1: TImageList;
    N3: TMenuItem;
    miAntialiasing: TMenuItem;
    procedure dxFlowChartDblClick(Sender: TObject);
    procedure TableAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnOnWebClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure miOpenClick(Sender: TObject);
    procedure btnFitClick(Sender: TObject);
    procedure btnZoomInClick(Sender: TObject);
    procedure btnZoomOutClick(Sender: TObject);
    procedure miActualSizeClick(Sender: TObject);
    procedure TableAfterInsert(DataSet: TDataSet);
    procedure miAntialiasingClick(Sender: TObject);
  private
    { Private declarations }
    FUpdate : Boolean;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.dxFlowChartDblClick(Sender: TObject);
var AStream : TMemoryStream;
begin
  if Table.RecordCount <> 0 then
    if ShowFlowChartEditor(dxFlowChart, 'ExpressFlowChart Editor') then begin
      FUpdate := False;
      Table.Edit;
      AStream := TMemoryStream.Create;
      dxFlowChart.SaveToStream(AStream);
      AStream.Position := 0;
      TBlobField(Table.FieldByName('Chart')).LoadFromStream(AStream);
      AStream.Free;
      Table.FieldByName('BkColor').AsInteger := dxFlowChart.Color;
      Table.Post;
      FUpdate := True;
    end;
end;

procedure TMainForm.TableAfterScroll(DataSet: TDataSet);
var AStream : TMemoryStream;
begin
  if not FUpdate then Exit;
  dxFlowChart.BeginUpdate;
  dxFlowChart.Clear;
  if not (TBlobField(Table.FieldByName('Chart')).isNull) then begin
    AStream := TMemoryStream.Create;
    TBlobField(Table.FieldByName('Chart')).SaveToStream(AStream);
    AStream.Position := 0;
    dxFlowChart.LoadFromStream(AStream);
    AStream.Free;
  end;
  dxFlowChart.Color := Table.FieldByName('BkColor').AsInteger;
  dxFlowChart.EndUpdate;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Table.DataBaseName := ExtractFilePath(Application.ExeName);
  FUpdate := True;
  Table.Open;
end;

procedure TMainForm.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.btnOnWebClick(Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar('http://www.devexpress.com'), Nil, Nil, SW_SHOWMAXIMIZED);
end;

procedure TMainForm.btnSaveClick(Sender: TObject);
begin
  if SaveDialog.Execute then
    dxFlowChart.SaveToFile(SaveDialog.FileName);
end;

procedure TMainForm.DataSourceDataChange(Sender: TObject; Field: TField);
var En : Boolean;
begin
  En := Table.RecordCount > 0;
  miOpen.Enabled := En;
  miSaveAs.Enabled := En;
end;

procedure TMainForm.miOpenClick(Sender: TObject);
var AStream : TMemoryStream;
begin
  if OpenDialog.Execute then begin
    dxFlowChart.LoadFromFile(OpenDialog.FileName);
    if Table.RecordCount <> 0 then begin
      FUpdate := False;
      Table.Edit;
      AStream := TMemoryStream.Create;
      dxFlowChart.SaveToStream(AStream);
      AStream.Position := 0;
      TBlobField(Table.FieldByName('Chart')).LoadFromStream(AStream);
      AStream.Free;
      Table.FieldByName('BkColor').AsInteger := dxFlowChart.Color;
      Table.Post;
      FUpdate := True;
    end;
  end;
end;

procedure TMainForm.btnFitClick(Sender: TObject);
begin
  miFit.Checked := not miFit.Checked;
  if miFit.Checked then begin
    dxFlowChart.Zoom := 0;
    miZoomIn.Enabled := False;
    miZoomOut.Enabled := False;
    miActualSize.Enabled := False;
  end else begin
    dxFlowChart.Zoom := 100;
    miZoomIn.Enabled := True;
    miZoomOut.Enabled := True;
    miActualSize.Enabled := True;
  end;
end;

procedure TMainForm.btnZoomInClick(Sender: TObject);
begin
  miZoomOut.Enabled := True;
  if dxFlowChart.Zoom < 490 then dxFlowChart.Zoom := dxFlowChart.Zoom + 10 else miZoomIn.Enabled := False;
end;

procedure TMainForm.btnZoomOutClick(Sender: TObject);
begin
  miZoomIn.Enabled := True;
  if dxFlowChart.Zoom > 20 then dxFlowChart.Zoom := dxFlowChart.Zoom - 10 else miZoomOut.Enabled := False;
end;

procedure TMainForm.miActualSizeClick(Sender: TObject);
begin
  dxFlowChart.Zoom := 100;
end;

procedure TMainForm.miAntialiasingClick(Sender: TObject);
begin
  dxFlowChart.Antialiasing := miAntialiasing.Checked;
end;

procedure TMainForm.TableAfterInsert(DataSet: TDataSet);
begin
  FUpdate := False;
  Table.Edit;
  Table.FieldByName('BkColor').AsInteger := clWindow;
  Table.Post;
  FUpdate := True;
end;

end.
