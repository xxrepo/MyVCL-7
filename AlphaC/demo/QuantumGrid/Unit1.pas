unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, StdCtrls, Controls, Forms, acLFPainter,
  Dialogs, sSkinManager, sSkinProvider, Db, DBTables, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinscxPCPainter, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, ComCtrls, sTrackBar,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, sCheckBox, sLabel;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    sSkinProvider1: TsSkinProvider;
    sSkinManager1: TsSkinManager;
    sCheckBox1: TsCheckBox;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1OrderNo: TcxGridDBColumn;
    cxGrid1DBTableView1CustNo: TcxGridDBColumn;
    cxGrid1DBTableView1SaleDate: TcxGridDBColumn;
    cxGrid1DBTableView1ShipDate: TcxGridDBColumn;
    cxGrid1DBTableView1EmpNo: TcxGridDBColumn;
    cxGrid1DBTableView1ShipToContact: TcxGridDBColumn;
    cxGrid1DBTableView1ShipToAddr1: TcxGridDBColumn;
    cxGrid1DBTableView1ShipToAddr2: TcxGridDBColumn;
    cxGrid1DBTableView1ShipToCity: TcxGridDBColumn;
    cxGrid1DBTableView1ShipToState: TcxGridDBColumn;
    cxGrid1DBTableView1ShipToZip: TcxGridDBColumn;
    cxGrid1DBTableView1ShipToCountry: TcxGridDBColumn;
    cxGrid1DBTableView1ShipToPhone: TcxGridDBColumn;
    cxGrid1DBTableView1ShipVIA: TcxGridDBColumn;
    cxGrid1DBTableView1PO: TcxGridDBColumn;
    cxGrid1DBTableView1Terms: TcxGridDBColumn;
    cxGrid1DBTableView1PaymentMethod: TcxGridDBColumn;
    cxGrid1DBTableView1ItemsTotal: TcxGridDBColumn;
    cxGrid1DBTableView1TaxRate: TcxGridDBColumn;
    cxGrid1DBTableView1Freight: TcxGridDBColumn;
    cxGrid1DBTableView1AmountPaid: TcxGridDBColumn;
    sLabel2: TsLabel;
    sTrackBar1: TsTrackBar;
    sLabelFX1: TsLabelFX;
    procedure sCheckBox1Click(Sender: TObject);
    procedure sTrackBar1Change(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.sCheckBox1Click(Sender: TObject);
begin
  sSkinManager1.Active := sCheckBox1.Checked;
  if not sSkinManager1.Active then cxGrid1.Invalidate(True);
end;

procedure TForm1.sTrackBar1Change(Sender: TObject);
begin
  sSkinManager1.Saturation := sTrackBar1.Position;
end;

end.
