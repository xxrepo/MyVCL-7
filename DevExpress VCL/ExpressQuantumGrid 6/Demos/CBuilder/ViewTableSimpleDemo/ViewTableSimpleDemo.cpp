//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("ViewTableSimpleDemo.res");
USEFORM("ViewTableSimpleDemoMain.cpp", ViewTableSimpleDemoMainForm);
USEFORM("ViewTableSimpleDemoData.cpp", ViewTableSimpleDemoMainDM); /* TDataModule: File Type */
USEFORM("..\AboutDemoForm.cpp", formAboutDemo);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressQuantumGrid ViewTableSimple Demo";
     Application->CreateForm(__classid(TViewTableSimpleDemoMainDM), &ViewTableSimpleDemoMainDM);
     Application->CreateForm(__classid(TViewTableSimpleDemoMainForm), &ViewTableSimpleDemoMainForm);
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
