//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "OLAPBrowserMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxLookAndFeels"
#pragma link "DemoBasicMain"
#pragma link "cxClasses"
#pragma link "cxControls"
#pragma link "cxCustomData"
#pragma link "cxCustomPivotGrid"
#pragma link "cxGraphics"
#pragma link "cxPivotGrid"
#pragma link "cxPivotGridOLAPDataSource"
#pragma link "cxPivotGridOLAPConnectionDesigner"
#pragma link "cxStyles"
#pragma resource "*.dfm"
TfrmOlapBrowser *frmOlapBrowser;
//---------------------------------------------------------------------------
__fastcall TfrmOlapBrowser::TfrmOlapBrowser(TComponent* Owner)
	: TfrmDemoBaisicMain(Owner)
{
}
//---------------------------------------------------------------------------

TcxCustomPivotGrid* __fastcall TfrmOlapBrowser::PivotGrid()
{
  return UnboundPivotGrid;
}
//---------------------------------------------------------------------------

void __fastcall TfrmOlapBrowser::SetFieldPos(
  const String AFieldName, TcxPivotGridFieldArea AArea)
{
  TcxPivotGridField* AField = PivotGrid()->GetFieldByName(AFieldName);
  AField->Area = AArea;
  AField->Visible = true;
}

void __fastcall TfrmOlapBrowser::FormCreate(TObject *Sender)
{
  TfrmDemoBaisicMain::FormCreate(Sender); 
  WideString APath = ExpandFileName("..\\..\\Data\\Northwind.cub");
  if (!FileExists(APath)) return;
  WideString ConnectionString = "Provider=MSOLAP.3;Integrated Security=SSPI;Persist Security Info=False;Data Source=";
  PivotGrid()->BeginUpdate();
  try {
	OLAPDataSource->ConnectionString = ConnectionString + APath;
	OLAPDataSource->Active = true;
	OLAPDataSource->RetrieveFields(PivotGrid());
	SetFieldPos("Country", faColumn);
	SetFieldPos("City", faColumn);
	SetFieldPos("Category Name", faRow);
	SetFieldPos("Products", faRow);
	SetFieldPos("Quantity", faData);
	SetFieldPos("Discount", faData);
  }
  __finally {
	PivotGrid()->EndUpdate();
	PivotGrid()->ApplyBestFit();
  }
}

void __fastcall TfrmOlapBrowser::NewConnection1Click(TObject *Sender)
{
  int I, J;
  WideString ACube;

  PivotGrid()->BeginUpdate();
  try {
	OLAPDataSource->ConnectionString =
	  cxPivotGridOLAPCreateConnectionString(ACube, PivotGrid()->LookAndFeel);
	OLAPDataSource->Cube = ACube;
	OLAPDataSource->Active = True;
	OLAPDataSource->RetrieveFields(PivotGrid());
	for (I = 0; I < PivotGrid()->Groups->Count - 1; I++) {
	  for (J = 1; J < PivotGrid()->Groups->Items[I]->FieldCount; J++) {
		PivotGrid()->Groups->Items[I]->Fields[J]->Visible = true;
	  }
	}
  }
  __finally {
	PivotGrid()->EndUpdate();
	PivotGrid()->Customization->Visible = true;
  };
}
