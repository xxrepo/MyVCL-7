unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, dxMasterView, StdCtrls, ExtCtrls, ComCtrls;

type
  TfmMain = class(TForm)
    MasterView: TdxMasterView;
    Panel1: TPanel;
    Level1: TdxMasterViewLevel;
    tbCustomers: TTable;
    tbCustomersID: TIntegerField;
    tbCustomersCustomerName: TStringField;
    tbCustomersCompany: TStringField;
    tbCustomersAddress: TStringField;
    tbCustomersCustomer: TBooleanField;
    tbCustomersCity: TStringField;
    tbCustomersState: TStringField;
    tbCustomersHomePhone: TStringField;
    dsCustomers: TDataSource;
    Level1ID: TdxMasterViewColumn;
    Level1CustomerName: TdxMasterViewColumn;
    Level1Company: TdxMasterViewColumn;
    Level1Address: TdxMasterViewColumn;
    Level1Customer: TdxMasterViewColumn;
    Level1City: TdxMasterViewColumn;
    Level1State: TdxMasterViewColumn;
    Level1HomePhone: TdxMasterViewColumn;
    ProgressBar: TProgressBar;
    tbOrders: TTable;
    dsOrders: TDataSource;
    tbOrdersOrderNo: TIntegerField;
    tbOrdersCustomerNo: TIntegerField;
    tbOrdersPaymentAmount: TCurrencyField;
    Level2: TdxMasterViewLevel;
    Level2OrderNo: TdxMasterViewColumn;
    Level2CustomerNo: TdxMasterViewColumn;
    Level2PaymentType: TdxMasterViewColumn;
    Level2PaymentAmount: TdxMasterViewColumn;
    tbOrdersPaymentType: TStringField;
    StatusBar: TStatusBar;
    btnCustomize: TButton;
    btnFullCollapse: TButton;
    btnFullExpand: TButton;
    chbSmartLoadLevel1: TCheckBox;
    Level1PurchaseDate: TdxMasterViewColumn;
    tbCustomersPurchaseDate: TDateTimeField;
    btnReloadDataset: TButton;
    tbItems: TTable;
    dsItems: TDataSource;
    tbItemsItemNo: TIntegerField;
    tbItemsOrderNo: TIntegerField;
    tbItemsPartNo: TIntegerField;
    tbItemsQty: TIntegerField;
    Level3: TdxMasterViewLevel;
    Level3ItemNo: TdxMasterViewColumn;
    Level3OrderNo: TdxMasterViewColumn;
    Level3PartNo: TdxMasterViewColumn;
    Level3Qty: TdxMasterViewColumn;
    chbSmartLoadLevel2: TCheckBox;
    chbSmartLoadLevel3: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCustomizeClick(Sender: TObject);
    procedure btnFullExpandClick(Sender: TObject);
    procedure btnFullCollapseClick(Sender: TObject);
    procedure chbSmartLoadLevel1Click(Sender: TObject);
    procedure btnReloadDatasetClick(Sender: TObject);
    procedure chbSmartLoadLevel2Click(Sender: TObject);
    procedure chbSmartLoadLevel3Click(Sender: TObject);
  public
    DataFile: String;
    procedure TablesCreate;
    procedure BeforeLoadData;
    procedure AfterLoadData;
  end;

var
  fmMain: TfmMain;
  EmptyTables: Boolean;

implementation

{$R *.DFM}

const
  // Table fields
  ArrayLen = 10;
  stCustomerName: array [0 .. ArrayLen - 1] of String = (
    'John Doe', 'Jennie Valentine', 'Sam Hill', 'Karen Holmes', 'Bobbie Valentine',
    'Ricardo Menendez', 'Frank Frankson', 'Christa Christie', 'Alfred Newman', 'James Johnson');

  stCompany: array [0 .. ArrayLen - 1] of String = (
    'Doe Enterprises', 'Hill Corporation', 'Holmes World', 'Valentine Hearts', 'Menedez Development',
    'Frankson Media', 'Christies House of Design', 'Jones & Assoc', 'Newman Systems', 'Development House');

  stAddress: array [0 .. ArrayLen - 1] of String = (
    '123 Home Lane', '45 Hill St.', '9333 Holmes Dr.', '933 Heart St. Suite 1', '939 Center Street',
    '121 Media Center Drive', '349 Graphic Design Lane', '990 King Lane', '900 Newman Center', '93900 Carter Lane');

  stCity: array [0 .. ArrayLen - 1] of String = (
    'Homesville', 'Hillsville', 'Johnsonville', 'Chicago', 'Atlanta',
    'New York', 'Kingsville', 'Newman', 'Cartersville', 'Los Angeles');

  stState: array [0 .. ArrayLen - 1] of String = (
    'CA', 'NJ', 'NY', 'IL', 'GA', 'OK', 'OH', 'CT', 'MI', 'MA');

  stHomePhone: array [0 .. ArrayLen - 1] of String = (
    '(111)111-1111', '(222)222-2222', '(333)333-3333', '(898)745-1511', '(151)615-1611',
    '(339)339-3939', '(930)930-3093', '(029)020-9090', '(923)022-0834', '(228)320-8320');

  stPaymentType: array [0 .. 3] of String = (
    'CASH', 'VISA', 'MASTER', 'AMEX');

function GetRandomValue(A: array of String): String;
begin
  Result := A[Low(A) + Random(High(A)-Low(A) + 1)];
end;

//generate a random PaymentType value
function GetRandomPTValue: String;
begin
  case Random(100)+1 of
    1..50: Result := 'VISA';
    51..80: Result := 'MASTER';
    81..95: Result := 'AMEX';
    else Result := 'CASH';
  end;
end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  if EmptyTables then  //If tables were not created
  begin
    if MessageBox(Handle, 'The tables is empty.'#13'Do you wish to generate 100 000 records?', 'Question',
      MB_ICONQUESTION or MB_YESNO) = ID_YES then TablesCreate;
  end
  else
    if MessageBox(Handle, 'The tables is full.'#13'Do you wish to generate new 100 000 records?', 'Question',
      MB_ICONQUESTION or MB_YESNO) = ID_YES then TablesCreate
    else
    try
      BeforeLoadData; //update StatusBar
      tbCustomers.Active := true;
      tbOrders.Active := true;
      tbItems.Active := true;
    except
    end;
  AfterLoadData; //update StatusBar
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
  AFileName : String;
begin
  EmptyTables := true;  //initialize the variable
  with tbCustomers do
  begin
    DatabaseName := ExtractFilePath(Application.ExeName);
    AFileName := DatabaseName;
    if AFileName <> '' then
      if AFileName[Length(AFileName)] <> '\' then
         AFileName := AFileName + '\';
    AFileName := AFileName + tbCustomers.TableName + '.db';
    //   If the Customers table file exists
    if FileExists(AFileName) then
      EmptyTables := false;
    //  set the CheckBoxs value
    if (lodSmartLoad in Level1.OptionsDB) then chbSmartLoadLevel1.Checked := true
    else chbSmartLoadLevel1.Checked := false;
    if (lodSmartLoad in Level2.OptionsDB) then chbSmartLoadLevel2.Checked := true
    else chbSmartLoadLevel2.Checked := false;
    if (lodSmartLoad in Level3.OptionsDB) then chbSmartLoadLevel3.Checked := true
    else chbSmartLoadLevel3.Checked := false;
  end;
end;

//  build the Customers, Orders, Items tables
procedure TfmMain.TablesCreate;
var
  I, J: Integer;
  CustId, OrderId, ItemId: Integer;
  OrdRecCount, ItmRecCount: Integer;
begin
    Screen.Cursor := crHourGlass;
    StatusBar.Panels.Items[1].Text := 'Creating tables';
    OrderId := 1; ItemId := 1;
    StatusBar.Refresh;
    tbCustomers.Active := False;
    tbOrders.Active := False;
    tbItems.Active := False;
    tbCustomers.IndexDefs.Clear;
    tbOrders.IndexDefs.Clear;
    tbItems.IndexDefs.Clear;
    //  specify new indexes for the tables
    tbCustomers.IndexDefs.Add('ID', 'ID', [ixPrimary]);
    tbOrders.IndexDefs.Add('OrderNo', 'OrderNo', [ixPrimary]);
    tbOrders.IndexDefs.Add('CustomerNo', 'CustomerNo', []);
    //  set the secondary index for the detail dataset by DetailKey
    tbOrders.IndexFieldNames := 'CustomerNo';
    tbItems.IndexDefs.Add('ItemNo', 'ItemNo', [ixPrimary]);
    tbItems.IndexDefs.Add('OrderNo', 'OrderNo', []);
    //  set the secondary index for the detail dataset by DetailKey
    tbItems.IndexFieldNames := 'OrderNo';
    tbCustomers.CreateTable;
    tbOrders.CreateTable;
    tbItems.CreateTable;
    Screen.Cursor := crHourGlass;
    tbCustomers.DisableControls;
    tbOrders.DisableControls;
    tbItems.DisableControls;
    ProgressBar.Parent := StatusBar;
    try
      tbCustomers.Active := True;
      tbOrders.Active := True;
      tbItems.Active := True;
      ProgressBar.Max := 1000;
      ProgressBar.Width := StatusBar.Panels[0].Width;
      ProgressBar.Height := StatusBar.ClientHeight - 2;
      ProgressBar.Left := 0;
      ProgressBar.Top := 2;
      ProgressBar.Visible := True;
      //  add records to the Customers table
      for CustId := 1 to ProgressBar.Max do
      begin
        tbCustomers.Append;
        tbCustomers.FieldByName('ID').AsInteger := CustId;
        tbCustomers.FieldByName('CustomerName').AsString := GetRandomValue(stCustomerName);
        tbCustomers.FieldByName('Company').AsString := GetRandomValue(stCompany);
        tbCustomers.FieldByName('Address').AsString := GetRandomValue(stAddress);
        tbCustomers.FieldByName('City').AsString := GetRandomValue(stCity);
        tbCustomers.FieldByName('State').AsString := GetRandomValue(stState);
        tbCustomers.FieldByName('Customer').AsBoolean := Boolean(Random(2));
        tbCustomers.FieldByName('PurchaseDate').AsDateTime := Date - 100 + Random(100);
        tbCustomers.FieldByName('HomePhone').AsString := GetRandomValue(stHomePhone);
        tbCustomers.Post;
        ProgressBar.Position := CustId;
        //create the Order table
        OrdRecCount := Random(19) + 1;
        for I := 1 to OrdRecCount do
        begin
          tbOrders.Append;
          tbOrders.FieldByName('OrderNo').AsInteger := OrderId;
          tbOrders.FieldByName('CustomerNo').AsInteger := CustId;
          tbOrders.FieldByName('PaymentType').AsString := GetRandomPTValue;
          tbOrders.FieldByName('PaymentAmount').AsFloat := 49 + Random(200);
          tbOrders.Post;

          //create the Items table
          ItmRecCount := Random(19) + 1;
          for J := 1 to ItmRecCount do
          begin
            tbItems.Append;
            tbItems.FieldByName('ItemNo').AsInteger := ItemId;
            tbItems.FieldByName('OrderNo').AsInteger := OrderId;
            tbItems.FieldByName('PartNo').AsInteger := Random(1500) + 900;
            tbItems.FieldByName('Qty').AsInteger := Random(100);
            tbItems.Post;
            Inc(ItemId);
          end;
          Inc(OrderId);
        end;
      end;
    finally
      ProgressBar.Visible := False;
      StatusBar.Panels.Items[1].Text := 'Creating tables is successfully complete';
      StatusBar.Refresh;
      BeforeLoadData;
      tbCustomers.EnableControls;
      tbOrders.EnableControls;
      tbItems.EnableControls;
      Screen.Cursor := crDefault;
    end;
end;

//show/hide the Customization Form
procedure TfmMain.btnCustomizeClick(Sender: TObject);
begin
  MasterView.Customizing := not MasterView.Customizing;
end;

//full expand
procedure TfmMain.btnFullExpandClick(Sender: TObject);
begin
  BeforeLoadData;
  MasterView.FullExpand;
  AfterLoadData;
end;

//full collapse
procedure TfmMain.btnFullCollapseClick(Sender: TObject);
begin
  MasterView.FullCollapse;
end;

//  activate SmartLoad mode for Level1
procedure TfmMain.chbSmartLoadLevel1Click(Sender: TObject);
begin
  BeforeLoadData;
  if chbSmartLoadLevel1.Checked then
    Level1.OptionsDB := Level1.OptionsDB + [lodSmartLoad]
  else
    Level1.OptionsDB := Level1.OptionsDB - [lodSmartLoad];
  AfterLoadData;
end;

//reload all datasets
procedure TfmMain.btnReloadDatasetClick(Sender: TObject);
begin
  BeforeLoadData;
  try
    tbCustomers.Active := false;
    tbOrders.Active := false;
    tbItems.Active := false;
    tbCustomers.Active := true;
    tbOrders.Active := true;
    tbItems.Active := true;
  except
  end;
  AfterLoadData;
end;

//  activate SmartLoad mode for Level2
procedure TfmMain.chbSmartLoadLevel2Click(Sender: TObject);
begin
  BeforeLoadData;
  if chbSmartLoadLevel2.Checked then
    Level2.OptionsDB := Level2.OptionsDB + [lodSmartLoad]
  else
    Level2.OptionsDB := Level2.OptionsDB - [lodSmartLoad];
  AfterLoadData;
end;

//  activate SmartLoad mode for Level3
procedure TfmMain.chbSmartLoadLevel3Click(Sender: TObject);
begin
  BeforeLoadData;
  if chbSmartLoadLevel3.Checked then
    Level3.OptionsDB := Level3.OptionsDB + [lodSmartLoad]
  else
    Level3.OptionsDB := Level3.OptionsDB - [lodSmartLoad];
  AfterLoadData;
end;

//  mark the beginning of data loading
procedure TfmMain.BeforeLoadData;
begin
  StatusBar.Panels.Items[1].Text := 'Loading data';
  StatusBar.Refresh;
end;

//  mark the end of data loading
procedure TfmMain.AfterLoadData;
begin
  StatusBar.Panels.Items[1].Text := '';
  StatusBar.Refresh;
end;

end.
