//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("UnboundColumnsDemo.res");
USEFORM("UnboundColumnsDemoMain.cpp", UnboundColumnsDemoMainForm);
USEFORM("UnboundColumnsDemoData.cpp", UnboundColumnsDemoDataDM); /* TDataModule: File Type */
USEFORM("..\AboutDemoForm.cpp", formAboutDemo);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressQuantumGrid UnboundColumns Demo";
     Application->CreateForm(__classid(TUnboundColumnsDemoDataDM), &UnboundColumnsDemoDataDM);
     Application->CreateForm(__classid(TUnboundColumnsDemoMainForm), &UnboundColumnsDemoMainForm);
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



