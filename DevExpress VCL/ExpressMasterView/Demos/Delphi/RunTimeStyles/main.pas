unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxMasterView, Db, DBTables, StdCtrls, ExtCtrls, Spin;

type
  TfmMain = class(TForm)
    MasterView: TdxMasterView;
    Table1: TTable;
    DataSource1: TDataSource;
    Level1: TdxMasterViewLevel;
    dxMasterView1Level1OrderNo: TdxMasterViewColumn;
    dxMasterView1Level1CustNo: TdxMasterViewColumn;
    dxMasterView1Level1SaleDate: TdxMasterViewColumn;
    dxMasterView1Level1ShipDate: TdxMasterViewColumn;
    dxMasterView1Level1EmpNo: TdxMasterViewColumn;
    dxMasterView1Level1ShipToContact: TdxMasterViewColumn;
    dxMasterView1Level1ShipToAddr1: TdxMasterViewColumn;
    dxMasterView1Level1ShipToAddr2: TdxMasterViewColumn;
    dxMasterView1Level1ShipToCity: TdxMasterViewColumn;
    dxMasterView1Level1ShipToState: TdxMasterViewColumn;
    dxMasterView1Level1ShipToZip: TdxMasterViewColumn;
    dxMasterView1Level1ShipToCountry: TdxMasterViewColumn;
    dxMasterView1Level1ShipToPhone: TdxMasterViewColumn;
    dxMasterView1Level1ShipVIA: TdxMasterViewColumn;
    dxMasterView1Level1PO: TdxMasterViewColumn;
    dxMasterView1Level1Terms: TdxMasterViewColumn;
    dxMasterView1Level1PaymentMethod: TdxMasterViewColumn;
    dxMasterView1Level1ItemsTotal: TdxMasterViewColumn;
    dxMasterView1Level1TaxRate: TdxMasterViewColumn;
    dxMasterView1Level1Freight: TdxMasterViewColumn;
    dxMasterView1Level1AmountPaid: TdxMasterViewColumn;
    Style1: TdxMasterViewStyle;
    GroupStyle1: TdxMasterViewStyle;
    GroupStyle2: TdxMasterViewStyle;
    GroupStyle3: TdxMasterViewStyle;
    Style2: TdxMasterViewStyle;
    plBottom: TPanel;
    GroupBox1: TGroupBox;
    chbPaymantMethod: TCheckBox;
    cmbPaymentMethod: TComboBox;
    GroupBox2: TGroupBox;
    chbAmountPaid: TCheckBox;
    sedAmountPaid: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Level1GetGroupStyle(Sender: TdxMasterViewLevel;
      Node: TdxMasterViewNode; Column: TdxMasterViewColumn;
      var NewStyle: TdxMasterViewStyle);
    procedure Level1GetContentStyle(Sender: TdxMasterViewLevel;
      Node: TdxMasterViewNode; Column: TdxMasterViewColumn;
      var NewStyle: TdxMasterViewStyle);
    procedure chbPaymantMethodClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxMasterView1Level1AmountPaidGetContentStyle(
      Sender: TdxMasterViewColumn; Node: TdxMasterViewNode;
      var NewStyle: TdxMasterViewStyle);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.DFM}

procedure TfmMain.Level1GetGroupStyle(Sender: TdxMasterViewLevel;
  Node: TdxMasterViewNode; Column: TdxMasterViewColumn;
  var NewStyle: TdxMasterViewStyle);
begin
  case Node.GroupIndex of
    0: NewStyle := GroupStyle1;
    1: NewStyle := GroupStyle2;
    2: NewStyle := GroupStyle3;
  else
    NewStyle := Style1;
  end
end;

procedure TfmMain.Level1GetContentStyle(Sender: TdxMasterViewLevel;
  Node: TdxMasterViewNode; Column: TdxMasterViewColumn;
  var NewStyle: TdxMasterViewStyle);
var
  ColInd: Integer;
begin
  ColInd := dxMasterView1Level1PaymentMethod.Index;
  if chbPaymantMethod.Checked then
    if Node.NodeType = ntData then
      if (Node.Strings[ColInd] = cmbPaymentMethod.Text) then
        NewStyle := Style2;
end;

procedure TfmMain.chbPaymantMethodClick(Sender: TObject);
begin
  MasterView.Invalidate;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  cmbPaymentMethod.ItemIndex := 0;
  dxMVGroupByBoxText := 'Group several columns to receive a new style for each grouped node';
end;

procedure TfmMain.dxMasterView1Level1AmountPaidGetContentStyle(
  Sender: TdxMasterViewColumn; Node: TdxMasterViewNode;
  var NewStyle: TdxMasterViewStyle);
begin
    if chbAmountPaid.Checked then
      if Node.NodeType = ntData then
        if ((Node.Values[Sender.Index]) > sedAmountPaid.Value) then
          NewStyle := Style1;
end;

procedure TfmMain.Button2Click(Sender: TObject);
begin
  MasterView.Customizing := true;
end;

end.
