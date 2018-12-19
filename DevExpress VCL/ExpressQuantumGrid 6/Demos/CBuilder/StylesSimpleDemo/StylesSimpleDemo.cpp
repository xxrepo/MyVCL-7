//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USERES("StylesSimpleDemo.res");
USEFORM("StylesSimpleDemoMain.cpp", StylesSimpleDemoMainForm);
USEFORM("StylesSimpleDemoData.cpp", StylesSimpleDemoDataDM); /* TDataModule: File Type */
USEFORM("..\AboutDemoForm.cpp", formAboutDemo);
USEFORM("StylesSimpleDemoAssign.cpp", StylesSimpleDemoAssignForm);
USEFORM("StylesSimpleDemoEdit.cpp", StylesSimpleDemoEditForm);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->Title = "ExpressQuantumGrid StylesSimple Demo";
     Application->CreateForm(__classid(TStylesSimpleDemoDataDM), &StylesSimpleDemoDataDM);
     Application->CreateForm(__classid(TStylesSimpleDemoMainForm), &StylesSimpleDemoMainForm);
     Application->CreateForm(__classid(TStylesSimpleDemoAssignForm), &StylesSimpleDemoAssignForm);
     Application->CreateForm(__classid(TStylesSimpleDemoEditForm), &StylesSimpleDemoEditForm);
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
