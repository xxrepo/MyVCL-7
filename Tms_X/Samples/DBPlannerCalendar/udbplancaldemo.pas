unit udbplancaldemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, PlannerCal, DBPlannerCal, Grids, DBGrids,
  ADODB;

type
  TForm1 = class(TForm)
    DBPlannerCalendar1: TDBPlannerCalendar;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOTable1: TADOTable;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  ADOTable1.Active := true;
  DBPlannerCalendar1.Date := Now;
end;

end.
