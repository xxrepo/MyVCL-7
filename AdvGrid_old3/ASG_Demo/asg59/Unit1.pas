unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, AdvGridExcel, StdCtrls, ExtCtrls, Grids,
  BaseGrid, AdvGrid, ComCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    xls: TAdvGridExcelIO;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    ProgressBar1: TProgressBar;
    AdvStringGrid1: TAdvStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure xlsProgress(Sender: TObject; SheetNum, SheetTot, RowNum,
      RowTot: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if not OpenDialog1.Execute then exit;
    xls.XLSImport(OpenDialog1.FileName,1);
  progressbar1.Position := 0;    
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if not OpenDialog1.Execute then exit;
    xls.XLSImport(OpenDialog1.FileName);
  progressbar1.Position := 0;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if not SaveDialog1.Execute then exit;
  xls.XLSExport(SaveDialog1.FileName,'Test');
  progressbar1.Position := 0;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if not SaveDialog1.Execute then exit;
    xls.XLSExport(SaveDialog1.FileName);
  progressbar1.Position := 0;    
end;

procedure TForm1.xlsProgress(Sender: TObject; SheetNum, SheetTot, RowNum,
  RowTot: Integer);
begin
  progressbar1.Max := RowTot;
  progressbar1.Position := RowNum;
end;

end.
