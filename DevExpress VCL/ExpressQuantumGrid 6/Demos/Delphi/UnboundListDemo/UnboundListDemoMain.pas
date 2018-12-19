unit UnboundListDemoMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls,  Forms, Dialogs, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, cxGridTableView,
  Menus, cxGridLevel, cxGridCustomTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, ComCtrls,
  cxGridCustomPopupMenu, cxGridPopupMenu, cxDataStorage, cxLookAndFeels;

type
  TUnboundListDemoMainForm = class(TForm)
    mmMain: TMainMenu;
    miAbout: TMenuItem;
    miFile: TMenuItem;
    miExit: TMenuItem;
    sbMain: TStatusBar;
    lbDescrip: TLabel;
    lvCustomers: TcxGridLevel;
    cxGrid: TcxGrid;
    StyleRepository: TcxStyleRepository;
    tvCustomers: TcxGridTableView;
    cxGridPopupMenu: TcxGridPopupMenu;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    LookAndFeelController: TcxLookAndFeelController;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure miAboutClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
  private
    procedure CustomizeGrid;
    procedure GenerateColumns;
    procedure LoadData;
    procedure SaveData;
  end;

var
  UnboundListDemoMainForm: TUnboundListDemoMainForm;

implementation

uses
  UnboundListDemoClasses, AboutDemoForm;

{$R *.dfm}

const
  TabChar = #9;

var
  CustomerList: TCustomerList;
  CustomerDataSource: TCustomerDataSource;

procedure TUnboundListDemoMainForm.CustomizeGrid;
begin
  GenerateColumns;
  LoadData;
end;

procedure TUnboundListDemoMainForm.GenerateColumns;
begin
  with tvCustomers as TcxGridTableView do
  begin
    ClearItems;

    with CreateColumn as TcxGridColumn do
    begin
      Caption := 'ID';
      DataBinding.ValueTypeClass := TcxIntegerValueType;
      Width := 50;
    end;

    with CreateColumn as TcxGridColumn do
    begin
      Caption := 'Customer';
      DataBinding.ValueTypeClass := TcxStringValueType;
      Width := 200;
    end;

    with CreateColumn as TcxGridColumn do
    begin
      Caption := 'Company';
      DataBinding.ValueTypeClass := TcxStringValueType;
      Width := 200;
    end;
  end;

  tvCustomers.DataController.CustomDataSource := CustomerDataSource;
end;

procedure TUnboundListDemoMainForm.LoadData;
var
  ACustomer: TCustomer;
  I: Integer;
  s: string;
begin
  with TStringList.Create do
  try
    LoadFromFile('contacts.txt');
    for I := 0 to Count - 1 do
    begin
      ACustomer := TCustomer.Create(CustomerList.NextID);
      s := Strings[I];
      ACustomer.Name := Copy(s, 1, Pos(TabChar, s) - 1);
      ACustomer.Description := Copy(s, Pos(TabChar, s) + 1, Length(s));
      CustomerList.Add(ACustomer);
    end;
  finally
    Free;
  end;
  CustomerDataSource.DataChanged;
  tvCustomers.DataController.GotoFirst;
end;

procedure TUnboundListDemoMainForm.SaveData;
var
  ACustomer: TCustomer;
  I: Integer;
begin
  with TStringList.Create do
  try
    for I := 0 to CustomerList.Count - 1 do
    begin
       ACustomer := CustomerList.Customers[I];
       Add(ACustomer.Name + TabChar + ACustomer.Description);
    end;
    SaveToFile('contacts.txt');
  finally
    Free;
  end;
end;

procedure TUnboundListDemoMainForm.FormCreate(Sender: TObject);
begin
  CustomerList := TCustomerList.Create;
  CustomerDataSource := TCustomerDataSource.Create(CustomerList);
  CustomizeGrid;
end;

procedure TUnboundListDemoMainForm.FormDestroy(Sender: TObject);
begin
  CustomerDataSource.Free;
  CustomerList.Free;
end;

procedure TUnboundListDemoMainForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  I: Integer;
begin
  I := -1;
  if CustomerDataSource.Modified then
    I := MessageDlg('Do you want to save the changes ?', mtConfirmation, [mbYes, mbNo, mbCancel], 0);
  case I of
    mrYes: SaveData;
    mrCancel: CanClose := False;
  end;
end;

procedure TUnboundListDemoMainForm.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TUnboundListDemoMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

end.
