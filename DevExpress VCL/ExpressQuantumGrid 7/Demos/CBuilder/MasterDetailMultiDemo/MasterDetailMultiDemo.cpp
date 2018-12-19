//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("MasterDetailMultiDemo.res");
USEFORM("MasterDetailMultiDemoMain.cpp", MasterDetailMultiDemoMainForm);
USEFORM("MasterDetailMultiDemoData.cpp", MasterDetailMultiDemoMainDM); /* TDataModule: File Type */
USEFORM("..\AboutDemoForm.cpp", formAboutDemo);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressQuantumGrid MasterDetailMulti Demo ";
     Application->CreateForm(__classid(TMasterDetailMultiDemoMainDM), &MasterDetailMultiDemoMainDM);
                 Application->CreateForm(__classid(TMasterDetailMultiDemoMainForm), &MasterDetailMultiDemoMainForm);
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
