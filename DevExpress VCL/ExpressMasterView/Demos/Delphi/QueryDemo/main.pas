unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxMasterView, Db, DBTables, Grids, DBGrids, ExtCtrls, StdCtrls;

type
  TfmMain = class(TForm)
    MasterView: TdxMasterView;
    DataSource1: TDataSource;
    Table1: TTable;
    lvlCustomers: TdxMasterViewLevel;
    lvlCustomersCustNo: TdxMasterViewColumn;
    lvlCustomersCompany: TdxMasterViewColumn;
    lvlCustomersAddr1: TdxMasterViewColumn;
    lvlCustomersAddr2: TdxMasterViewColumn;
    lvlCustomersCity: TdxMasterViewColumn;
    lvlCustomersState: TdxMasterViewColumn;
    lvlCustomersZip: TdxMasterViewColumn;
    lvlCustomersCountry: TdxMasterViewColumn;
    lvlCustomersPhone: TdxMasterViewColumn;
    lvlCustomersFAX: TdxMasterViewColumn;
    lvlCustomersTaxRate: TdxMasterViewColumn;
    lvlCustomersContact: TdxMasterViewColumn;
    lvlCustomersLastInvoiceDate: TdxMasterViewColumn;
    DataSource2: TDataSource;
    lvlOrders: TdxMasterViewLevel;
    lvlOrdersOrderNo: TdxMasterViewColumn;
    lvlOrdersCustNo: TdxMasterViewColumn;
    lvlOrdersSaleDate: TdxMasterViewColumn;
    lvlOrdersShipDate: TdxMasterViewColumn;
    lvlOrdersEmpNo: TdxMasterViewColumn;
    lvlOrdersShipToContact: TdxMasterViewColumn;
    lvlOrdersShipToAddr1: TdxMasterViewColumn;
    lvlOrdersShipToAddr2: TdxMasterViewColumn;
    lvlOrdersShipToCity: TdxMasterViewColumn;
    lvlOrdersShipToState: TdxMasterViewColumn;
    lvlOrdersShipToZip: TdxMasterViewColumn;
    lvlOrdersShipToCountry: TdxMasterViewColumn;
    lvlOrdersShipToPhone: TdxMasterViewColumn;
    lvlOrdersShipVIA: TdxMasterViewColumn;
    lvlOrdersPO: TdxMasterViewColumn;
    lvlOrdersTerms: TdxMasterViewColumn;
    lvlOrdersPaymentMethod: TdxMasterViewColumn;
    lvlOrdersItemsTotal: TdxMasterViewColumn;
    lvlOrdersTaxRate: TdxMasterViewColumn;
    lvlOrdersFreight: TdxMasterViewColumn;
    lvlOrdersAmountPaid: TdxMasterViewColumn;
    Splitter1: TSplitter;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Query1: TQuery;
    pnBottom: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    procedure lvlCustomersExpanding(Sender: TdxMasterViewLevel;
      Node: TdxMasterViewNode; var Allow: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.DFM}

procedure TfmMain.lvlCustomersExpanding(Sender: TdxMasterViewLevel;
  Node: TdxMasterViewNode; var Allow: Boolean);
begin
  if Node.NodeType = ntData then
  begin
    if RadioGroup1.ItemIndex = 0 then Sender.Control.BeginLayout;
    try
      with Query1 do
      begin
        Params[0].Value := Node.Values[lvlCustomersCustNo.Index];
        Active := False;
        Active := True;
      end;
    finally
      if RadioGroup1.ItemIndex = 0 then Sender.Control.CancelLayout;
    end;
  end;
end;

end.
