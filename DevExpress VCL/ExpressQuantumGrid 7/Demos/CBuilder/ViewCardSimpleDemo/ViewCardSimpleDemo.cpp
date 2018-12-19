//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("ViewCardSimpleDemo.res");
USEFORM("ViewCardSimpleDemoMain.cpp", ViewCardSimpleDemoMainForm);
USEFORM("ViewCardSimpleDemoData.cpp", ViewCardSimpleDemoDataDM); /* TDataModule: File Type */
USEFORM("..\AboutDemoForm.cpp", formAboutDemo);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressQuantumGrid ViewCardSimple Demo";
     Application->CreateForm(__classid(TViewCardSimpleDemoDataDM), &ViewCardSimpleDemoDataDM);
     Application->CreateForm(__classid(TViewCardSimpleDemoMainForm), &ViewCardSimpleDemoMainForm);
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
