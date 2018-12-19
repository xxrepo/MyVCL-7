//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("MasterDetailCardDemo.res");
USEFORM("MasterDetailCardDemoMain.cpp", MasterDetailCardDemoMainForm);
USEFORM("MasterDetailCardDemoData.cpp", MasterDetailCardDemoDataDM); /* TDataModule: File Type */
USEFORM("..\AboutDemoForm.cpp", formAboutDemo);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressQuantumGrid MasterDetailCardDemo";
     Application->CreateForm(__classid(TMasterDetailCardDemoDataDM), &MasterDetailCardDemoDataDM);
     Application->CreateForm(__classid(TMasterDetailCardDemoMainForm), &MasterDetailCardDemoMainForm);
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
