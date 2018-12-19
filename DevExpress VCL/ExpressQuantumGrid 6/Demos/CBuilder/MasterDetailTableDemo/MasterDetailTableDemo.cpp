//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("MasterDetailTableDemo.res");
USEFORM("MasterDetailTableDemoMain.cpp", MasterDetailTableDemoMainForm);
USEFORM("MasterDetailTableDemoData.cpp", MasterDetailTableDemoDataDM); /* TDataModule: File Type */
USEFORM("..\AboutDemoForm.cpp", formAboutDemo);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressQuantumGrid MasterDetailTableDemo";
     Application->CreateForm(__classid(TMasterDetailTableDemoDataDM), &MasterDetailTableDemoDataDM);
     Application->CreateForm(__classid(TMasterDetailTableDemoMainForm), &MasterDetailTableDemoMainForm);
     Application->Run();
  }
  catch (Exception &exception)
  {
     Application->ShowException(&exception);
  }
  catch (...)
  {
     try
     {
       throw Exception("");
     }
     catch (Exception &exception)
     {
       Application->ShowException(&exception);
     }
  }
  return 0;
}
//---------------------------------------------------------------------------
