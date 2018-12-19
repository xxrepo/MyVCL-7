unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBAdvGrd, Grids, BaseGrid, AdvGrid, AdvGridWorkbook, StdCtrls,
  Menus;

type
  TForm1 = class(TForm)
    AdvGridWorkbook1: TAdvGridWorkbook;
    MainMenu1: TMainMenu;
    Loadfiles1: TMenuItem;
    Loadfiles2: TMenuItem;
    Sortgrid1: TMenuItem;
    procedure Loadfiles2Click(Sender: TObject);
    procedure Sortgrid1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Loadfiles2Click(Sender: TObject);
var
  i: integer;
  filelist: TStringList;
  fname: string;
begin
 filelist := TStringList.Create;
  filelist.Add('c:\temp\cars.csv');
  filelist.Add('c:\temp\data.csv');
  filelist.Add('c:\temp\germany.csv');

  with AdvGridWorkBook1 do
  begin
    Sheets.Clear;
    Grid.SaveFixedCells := false;

    for i := 1 to filelist.Count do
    begin
      fname := ExtractFileName(filelist.Strings[i - 1]);
      if pos('.',fname) > 0 then
        delete(fname,pos('.',fname), length(fname));

      Sheets.Add.Name := fname;
      ActiveSheet := i - 1;
      Grid.LoadFromCSV(filelist.Strings[i - 1]);
      Grid.AutoNumberCol(0);
      Grid.AutoNumberRow(0);
    end;

    ActiveSheet := 0;
  end;

  filelist.Free;
end;

procedure TForm1.Sortgrid1Click(Sender: TObject);
begin
  with AdvGridWorkbook1.Grid do
  begin
    SortSettings.Column := 1;
    if SortSettings.Direction = sdAscending then
      SortSettings.Direction := sdDescending
    else
      SortSettings.Direction := sdAscending;
    QSort;
  end;
end;

end.
