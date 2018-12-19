//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("MasterDetailDemo.res");
USEFORM("MasterDetailDemoMain.cpp", MasterDetailDemoMainForm);
USEFORM("MasterDetailDemoData.cpp", MasterDetailDemoDataDM); /* TDataModule: File Type */
USEFORM("..\AboutDemoForm.cpp", formAboutDemo);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressQuantumGrid MasterDetailDemo";
     Application->CreateForm(__classid(TMasterDetailDemoDataDM), &MasterDetailDemoDataDM);
     Application->CreateForm(__classid(TMasterDetailDemoMainForm), &MasterDetailDemoMainForm);
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
