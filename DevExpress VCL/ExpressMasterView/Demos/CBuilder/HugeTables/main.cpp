//---------------------------------------------------------------------------
#include <vcl.h>
#include <stdlib.h>
#pragma hdrstop

#include "main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "dxMasterView"
#pragma resource "*.dfm"
TfmMain *fmMain;
bool EmptyTables;

const
  // Table fields
  int ArrayLen = 10;
  char *stCustomerName[ArrayLen] = {
    "John Doe", "Jennie Valentine", "Sam Hill", "Karen Holmes", "Bobbie Valentine",
    "Ricardo Menendez", "Frank Frankson", "Christa Christie", "Alfred Newman", "James Johnson"};

  char *stCompany[ArrayLen] = {
    "Doe Enterprises", "Hill Corporation", "Holmes World", "Valentine Hearts", "Menedez Development",
    "Frankson Media", "Christies House of Design", "Jones & Assoc", "Newman Systems", "Development House"};

  char *stAddress[ArrayLen] = {
    "123 Home Lane", "45 Hill St.", "9333 Holmes Dr.", "933 Heart St. Suite 1", "939 Center Street",
    "121 Media Center Drive", "349 Graphic Design Lane", "990 King Lane", "900 Newman Center", "93900 Carter Lane"};

  char *stCity[ArrayLen] = {
    "Homesville", "Hillsville", "Johnsonville", "Chicago", "Atlanta",
    "New York", "Kingsville", "Newman", "Cartersville", "Los Angeles"};

  char *stState[ArrayLen] = {
    "CA", "NJ", "NY", "IL", "GA", "OK", "OH", "CT", "MI", "MA"};

  char *stHomePhone[ArrayLen] = {
    "(111)111-1111", "(222)222-2222", "(333)333-3333", "(898)745-1511", "(151)615-1611",
    "(339)339-3939", "(930)930-3093", "(029)020-9090", "(923)022-0834", "(228)320-8320"};

  char *stPaymentType[4] = {
    "CASH", "VISA", "MASTER", "AMEX"};
//---------------------------------------------------------------------------
__fastcall TfmMain::TfmMain(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
AnsiString __fastcall GetRandomValue(char *A[], int Len)
{
  return(A[random(Len)]);
};

//---------------------------------------------------------------------------
AnsiString __fastcall GetRandomPTValue(void)
{
  int rn = random(100)+1;

  if (rn <= 50) return("VISA");
  if (rn <= 80) return("MASTER");
  if (rn <= 95) return("AMEX");
  if (rn <= 80) return("MASTER");
  if (rn <= 100) return("CASH");
  return("");
};
//---------------------------------------------------------------------------
void __fastcall TfmMain::FormActivate(TObject *Sender)
{
  if (EmptyTables)  //If tables were not created
  {
    if (MessageBox(Handle, "The tables is empty. \n Do you wish to generate 100 000 records?", "Question",
      MB_ICONQUESTION | MB_YESNO) == ID_YES) TablesCreate();
  }
  else
    if (MessageBox(Handle, "The tables is full. \n Do you wish to generate new 100 000 records?", "Question",
      MB_ICONQUESTION | MB_YESNO) == ID_YES) TablesCreate();
    else
    try {
      BeforeLoadData(); //update StatusBar
      tbCustomers->Active = true;
      tbOrders->Active = true;
      tbItems->Active = true;
    }
    __finally
    { }
      AfterLoadData(); //update StatusBar
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::FormCreate(TObject *Sender)
{
  EmptyTables = true;  //initialize the variable
  {
    tbCustomers->DatabaseName = ExtractFilePath(Application->ExeName);
    AnsiString AFileName = tbCustomers->DatabaseName;
    if (AFileName != "")
      if (AFileName.AnsiLastChar() != "\\")
         AFileName = AFileName + "\\";
    AFileName = AFileName + tbCustomers->TableName + ".db";
    //   If the Customers table file exists
    if (FileExists(AFileName))
      EmptyTables = false;
    //  set the CheckBoxs value
    if (Level1->OptionsDB.Contains(lodSmartLoad)) chbSmartLoadLevel1->Checked = true;
    else chbSmartLoadLevel1->Checked = false;
    if (Level2->OptionsDB.Contains(lodSmartLoad)) chbSmartLoadLevel2->Checked = true;
    else chbSmartLoadLevel2->Checked = false;
    if (Level3->OptionsDB.Contains(lodSmartLoad)) chbSmartLoadLevel3->Checked = true;
    else chbSmartLoadLevel3->Checked = false;
  };
}
//---------------------------------------------------------------------------

//  build the Customers, Orders, Items tables
void __fastcall TfmMain::TablesCreate()
{
    Screen->Cursor = crHourGlass;
    StatusBar->Panels->Items[1]->Text = "Creating tables";
    int OrderId = 1; int ItemId = 1;
    StatusBar->Refresh();
    tbCustomers->Active = false;
    tbOrders->Active = false;
    tbItems->Active = false;
    tbCustomers->IndexDefs->Clear();
    tbOrders->IndexDefs->Clear();
    tbItems->IndexDefs->Clear();
    //  specify new indexes for the tables
    tbCustomers->IndexDefs->Add("ID", "ID", TIndexOptions() << ixPrimary);
    tbOrders->IndexDefs->Add("OrderNo", "OrderNo", TIndexOptions() << ixPrimary);
    tbOrders->IndexDefs->Add("CustomerNo", "CustomerNo", TIndexOptions());
    //  set the secondary index for the detail dataset by DetailKey
    tbOrders->IndexFieldNames = "CustomerNo";
    tbItems->IndexDefs->Add("ItemNo", "ItemNo", TIndexOptions() << ixPrimary);
    tbItems->IndexDefs->Add("OrderNo", "OrderNo", TIndexOptions());
    //  set the secondary index for the detail dataset by DetailKey
    tbItems->IndexFieldNames = "OrderNo";
    tbCustomers->CreateTable();
    tbOrders->CreateTable();
    tbItems->CreateTable();
    tbCustomers->DisableControls();
    tbOrders->DisableControls();
    tbItems->DisableControls();
    ProgressBar->Parent = StatusBar;
    try {
      tbCustomers->Active = true;
      tbOrders->Active = true;
      tbItems->Active = true;
      ProgressBar->Max = 1000;
      ProgressBar->Width = StatusBar->Panels->Items[0]->Width;
      ProgressBar->Height = StatusBar->ClientHeight - 2;
      ProgressBar->Left = 0;
      ProgressBar->Top = 2;
      ProgressBar->Visible = true;
      //  add records to the Customers table
      for (int CustId = 1; CustId < ProgressBar->Max + 1; CustId++) {
        tbCustomers->Append();
        tbCustomers->FieldByName("ID")->AsInteger = CustId;
        tbCustomers->FieldByName("CustomerName")->AsString = GetRandomValue(stCustomerName,ArrayLen);
        tbCustomers->FieldByName("Company")->AsString = GetRandomValue(stCompany,ArrayLen);
        tbCustomers->FieldByName("Address")->AsString = GetRandomValue(stAddress,ArrayLen);
        tbCustomers->FieldByName("City")->AsString = GetRandomValue(stCity,ArrayLen);
        tbCustomers->FieldByName("State")->AsString = GetRandomValue(stState,ArrayLen);
        tbCustomers->FieldByName("Customer")->AsBoolean = Boolean(random(2));
        tbCustomers->FieldByName("PurchaseDate")->AsDateTime = Date() - 100 + random(100);
        tbCustomers->FieldByName("HomePhone")->AsString = GetRandomValue(stHomePhone,ArrayLen);
        tbCustomers->Post();
        ProgressBar->Position = CustId;
        //create the Order table
        int OrdRecCount = random(19) + 1;
        for (int I = 1; I < OrdRecCount + 1; I++) {
          tbOrders->Append();
          tbOrders->FieldByName("OrderNo")->AsInteger = OrderId;
          tbOrders->FieldByName("CustomerNo")->AsInteger = CustId;
          tbOrders->FieldByName("PaymentType")->AsString = GetRandomPTValue();
          tbOrders->FieldByName("PaymentAmount")->AsFloat = 49 + random(200);
          tbOrders->Post();

          //create the Items table
          int ItmRecCount = random(19) + 1;
          for (int J = 1; J < ItmRecCount + 1; J++) {
            tbItems->Append();
            tbItems->FieldByName("ItemNo")->AsInteger = ItemId;
            tbItems->FieldByName("OrderNo")->AsInteger = OrderId;
            tbItems->FieldByName("PartNo")->AsInteger = random(1500) + 900;
            tbItems->FieldByName("Qty")->AsInteger = random(100);
            tbItems->Post();
            ItemId++;
          };
          OrderId++;
        };
      };
    }
    __finally
    {
      ProgressBar->Visible = false;
      StatusBar->Panels->Items[1]->Text = "Creating tables is successfully complete";
      StatusBar->Refresh();
      BeforeLoadData();
      tbCustomers->EnableControls();
      tbOrders->EnableControls();
      tbItems->EnableControls();
      Screen->Cursor = crDefault;      
    };
};
//---------------------------------------------------------------------------
//show/hide the Customization Form
void __fastcall TfmMain::btnCustomizeClick(TObject *Sender)
{
  MasterView->Customizing = ! MasterView->Customizing;
}
//---------------------------------------------------------------------------

//full expand
void __fastcall TfmMain::btnFullExpandClick(TObject *Sender)
{
  BeforeLoadData();
  MasterView->FullExpand();
  AfterLoadData();
}
//---------------------------------------------------------------------------

//full collapse
void __fastcall TfmMain::btnFullCollapseClick(TObject *Sender)
{
  MasterView->FullCollapse();
}
//---------------------------------------------------------------------------
//  activate SmartLoad mode for Level1
void __fastcall TfmMain::chbSmartLoadLevel1Click(TObject *Sender)
{
  BeforeLoadData();
  if (chbSmartLoadLevel1->Checked)
    Level1->OptionsDB = (Level1->OptionsDB + TdxMasterViewLevelOptionsDB()) << lodSmartLoad;
  else
    Level1->OptionsDB = (Level1->OptionsDB + TdxMasterViewLevelOptionsDB()) >> lodSmartLoad;
  AfterLoadData();
}
//---------------------------------------------------------------------------
//reload all datasets
void __fastcall TfmMain::btnReloadDatasetClick(TObject *Sender)
{
  BeforeLoadData();
  try
  {
    tbCustomers->Active = false;
    tbOrders->Active = false;
    tbItems->Active = false;
    tbCustomers->Active = true;
    tbOrders->Active = true;
    tbItems->Active = true;
  }
  __except(EXCEPTION_EXECUTE_HANDLER)
  {};
  AfterLoadData();
}
//---------------------------------------------------------------------------
//  activate SmartLoad mode for Level2
void __fastcall TfmMain::chbSmartLoadLevel2Click(TObject *Sender)
{
  BeforeLoadData();
  if (chbSmartLoadLevel2->Checked)
    Level2->OptionsDB = (Level2->OptionsDB + TdxMasterViewLevelOptionsDB()) << lodSmartLoad;
  else
    Level2->OptionsDB = (Level2->OptionsDB + TdxMasterViewLevelOptionsDB()) >> lodSmartLoad;
  AfterLoadData();
}
//---------------------------------------------------------------------------
//  activate SmartLoad mode for Level3
void __fastcall TfmMain::chbSmartLoadLevel3Click(TObject *Sender)
{
  BeforeLoadData();
  if (chbSmartLoadLevel3->Checked)
    Level3->OptionsDB = (Level3->OptionsDB + TdxMasterViewLevelOptionsDB()) << lodSmartLoad;
  else
    Level3->OptionsDB = (Level3->OptionsDB + TdxMasterViewLevelOptionsDB()) >> lodSmartLoad;
  AfterLoadData();
}
//---------------------------------------------------------------------------
//  mark the beginning of data loading
void __fastcall TfmMain::BeforeLoadData()
{
  StatusBar->Panels->Items[1]->Text = "Loading data";
  StatusBar->Refresh();
}
//---------------------------------------------------------------------------
//  mark the end of data loading
void __fastcall TfmMain::AfterLoadData()
{
  StatusBar->Panels->Items[1]->Text = "";
  StatusBar->Refresh();
};
//---------------------------------------------------------------------------
