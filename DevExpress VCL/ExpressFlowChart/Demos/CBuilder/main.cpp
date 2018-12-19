//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "dxflchrt"
#pragma link "dxfcedit"
#pragma link "cxControls"
#pragma resource "*.dfm"
TMaimForm *MaimForm;
bool FUpdate;
//---------------------------------------------------------------------------
__fastcall TMaimForm::TMaimForm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMaimForm::dxFlowChartDblClick(TObject *Sender)
{
  TMemoryStream *AStream;
  TBlobField *AField;

  if (Table->RecordCount != 0)
    if (ShowFlowChartEditor(dxFlowChart, "ExpressFlowChart Editor")) {
      FUpdate = false;
      Table->Edit();
      AStream = new TMemoryStream;
      dxFlowChart->SaveToStream(AStream);
      AStream->Position = 0;
      AField = (TBlobField*)(Table->FieldByName("Chart"));
      AField->LoadFromStream(AStream);
      delete AStream;
      Table->FieldByName("BkColor")->AsInteger = dxFlowChart->Color;
      Table->Post();
      FUpdate = true;
    };
}
//---------------------------------------------------------------------------
void __fastcall TMaimForm::TableAfterScroll(TDataSet *DataSet)
{
  TMemoryStream *AStream;
  TBlobField *AField;

  if (! FUpdate) return;
  dxFlowChart->BeginUpdate();
  dxFlowChart->Clear();
  AField = (TBlobField*)(Table->FieldByName("Chart"));
  if (! (AField->IsNull)) {
    AStream = new TMemoryStream;
    AField->SaveToStream(AStream);
    AStream->Position = 0;
    dxFlowChart->LoadFromStream(AStream);
    delete AStream;
  };
  dxFlowChart->Color = Table->FieldByName("BkColor")->AsInteger;
  dxFlowChart->EndUpdate();
}
//---------------------------------------------------------------------------
void __fastcall TMaimForm::FormCreate(TObject *Sender)
{
  Table->DatabaseName = ExtractFilePath(Application->ExeName);
  FUpdate = true;
  Table->Open();
}
//---------------------------------------------------------------------------

void __fastcall TMaimForm::Exit1Click(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TMaimForm::DeveloperExpressontheWeb1Click(TObject *Sender)
{
  ShellExecute(Handle, "OPEN", "http://www.devexpress.com", NULL, NULL, SW_SHOWMAXIMIZED);
}
//---------------------------------------------------------------------------

void __fastcall TMaimForm::miSaveAsClick(TObject *Sender)
{
  if (SaveDialog->Execute())
    dxFlowChart->SaveToFile(SaveDialog->FileName);
}
//---------------------------------------------------------------------------

void __fastcall TMaimForm::DataSourceDataChange(TObject *Sender,
      TField *Field)
{
  bool En = Table->RecordCount > 0;
  miOpen->Enabled = En;
  miSaveAs->Enabled = En;
}
//---------------------------------------------------------------------------

void __fastcall TMaimForm::miAntialiasingClick(TObject *Sender)
{
   dxFlowChart->Antialiasing = miAntialiasing->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TMaimForm::miOpenClick(TObject *Sender)
{
  TMemoryStream *AStream;

  if (OpenDialog->Execute()) {
    dxFlowChart->LoadFromFile(OpenDialog->FileName);
    if (Table->RecordCount != 0) {
      FUpdate = false;
      Table->Edit();
      AStream = new TMemoryStream;
      dxFlowChart->SaveToStream(AStream);
      AStream->Position = 0;
      ((TBlobField*)Table->FieldByName("Chart"))->LoadFromStream(AStream);
      delete AStream;
      Table->FieldByName("BkColor")->AsInteger = dxFlowChart->Color;
      Table->Post();
      FUpdate = true;
    };
  };
}
//---------------------------------------------------------------------------

void __fastcall TMaimForm::miFitClick(TObject *Sender)
{
  miFit->Checked = ! miFit->Checked;
  if (miFit->Checked) {
    dxFlowChart->Zoom = 0;
    miZoomIn->Enabled = false;
    miZoomOut->Enabled = false;
    miActualSize->Enabled = false;
  } else {
    dxFlowChart->Zoom = 100;
    miZoomIn->Enabled = true;
    miZoomOut->Enabled = true;
    miActualSize->Enabled = true;
  };
}
//---------------------------------------------------------------------------

void __fastcall TMaimForm::miZoomInClick(TObject *Sender)
{
  miZoomOut->Enabled = true;
  if (dxFlowChart->Zoom < 490) dxFlowChart->Zoom = dxFlowChart->Zoom + 10; else miZoomIn->Enabled = false;
}
//---------------------------------------------------------------------------

void __fastcall TMaimForm::miZoomOutClick(TObject *Sender)
{
  miZoomIn->Enabled = true;
  if (dxFlowChart->Zoom > 20) dxFlowChart->Zoom = dxFlowChart->Zoom - 10; else miZoomOut->Enabled = false;
}
//---------------------------------------------------------------------------

void __fastcall TMaimForm::miActualSizeClick(TObject *Sender)
{
  dxFlowChart->Zoom = 100;
}
//---------------------------------------------------------------------------

void __fastcall TMaimForm::TableAfterInsert(TDataSet *DataSet)
{
  FUpdate = false;
  Table->Edit();
  Table->FieldByName("BkColor")->AsInteger = clWindow;
  Table->Post();
  FUpdate = true;
}
//---------------------------------------------------------------------------

