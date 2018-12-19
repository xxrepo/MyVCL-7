unit OLAPBrowserMain;

{$I ..\cxVer.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, DemoBasicMain, cxLookAndFeels, Menus, StdCtrls, cxControls,
  cxCustomPivotGrid, cxPivotGrid, cxCustomData, cxClasses, cxGraphics,
  cxStyles, cxPivotGridOLAPConnectionDesigner, cxPivotGridOLAPDataSource,
  cxEdit;

type
  TfrmOlapBrowser = class(TfrmDemoBaisicMain)
    UnboundPivotGrid: TcxPivotGrid;
    NewConnection1: TMenuItem;
    N3: TMenuItem;
    OLAPDataSource: TcxPivotGridOLAPDataSource;
    procedure FormCreate(Sender: TObject);
    procedure NewConnection1Click(Sender: TObject);
  protected
    function GetPivotGrid: TcxCustomPivotGrid; override;
    procedure SetFieldPos(const AFieldName: string; AArea: TcxPivotGridFieldArea);
  public
    { Public declarations }
  end;

var
  frmOlapBrowser: TfrmOlapBrowser;

implementation

{$R *.dfm}


function TfrmOlapBrowser.GetPivotGrid: TcxCustomPivotGrid;
begin
  Result := UnboundPivotGrid;
end;

procedure TfrmOlapBrowser.SetFieldPos(
  const AFieldName: string; AArea: TcxPivotGridFieldArea);
var
  AField: TcxPivotGridField;
begin
  AField := PivotGrid.GetFieldByName(AFieldName);
  if AField = nil then Exit;
  AField.Area := AArea;
  AField.Visible := True;
end;

procedure TfrmOlapBrowser.FormCreate(Sender: TObject);
var
  APath, ConnectionString: string;
begin
  inherited;
  APath := ExpandFileName('..\..\Data\Northwind.cub');
  if not FileExists(APath) then Exit;
  ConnectionString := 'Provider=MSOLAP.3;Integrated Security=SSPI;Persist Security Info=False;Data Source=';
  PivotGrid.BeginUpdate;
  try
    OLAPDataSource.ConnectionString := ConnectionString + APath;
    OLAPDataSource.Active := True;
    OLAPDataSource.RetrieveFields(PivotGrid);
    SetFieldPos('Country', faColumn);
    SetFieldPos('City', faColumn);
    SetFieldPos('Category Name', faRow);
    SetFieldPos('Products', faRow);
    SetFieldPos('Quantity', faData);
    SetFieldPos('Discount', faData);
  finally
    PivotGrid.EndUpdate;
    PivotGrid.ApplyBestFit;
  end;
end;

procedure TfrmOlapBrowser.NewConnection1Click(Sender: TObject);
var
  I, J: Integer;
  ACube, ANewConnectionString: WideString;
begin
  ANewConnectionString := cxPivotGridOLAPCreateConnectionString(ACube, PivotGrid.LookAndFeel);
  if ANewConnectionString <> '' then
  begin
    PivotGrid.BeginUpdate;
    try
      OLAPDataSource.ConnectionString := ANewConnectionString;
      OLAPDataSource.Cube := ACube;
      OLAPDataSource.Active := True;
      OLAPDataSource.RetrieveFields(PivotGrid);
      for I := 0 to PivotGrid.Groups.Count - 1 do
        for J := 1 to PivotGrid.Groups[I].FieldCount - 1 do
          PivotGrid.Groups[I].Fields[J].Visible := True;
    finally
      PivotGrid.EndUpdate;
      PivotGrid.Customization.Visible := True;
    end;
  end;
end;

end.
